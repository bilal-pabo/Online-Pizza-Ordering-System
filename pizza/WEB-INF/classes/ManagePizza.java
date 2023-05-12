import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig
public class ManagePizza extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        Part pic = request.getPart("pic");
        String picName = pic.getSubmittedFileName();

        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/online_pizza";
            Connection con = DriverManager.getConnection(url, "root", "root");
            HttpSession session = request.getSession();
            Statement st = con.createStatement();
            String query = "select * from pizzainfo where id='" + id + "'";
            ResultSet res = st.executeQuery(query);
            
            if (!res.next()) 
            {
                PreparedStatement ps = con.prepareStatement("INSERT INTO pizzaInfo VALUES(?,?,?,?)");
                ps.setString(1, id);
                ps.setString(2, name);
                ps.setString(3, price);
                ps.setString(4, picName);
                int count = ps.executeUpdate();
                if (count == 1) 
                {
                    session.setAttribute("message", "Pizza added successfully!");
                    response.sendRedirect("adminHome.jsp");
                } else 
                {
                    session.setAttribute("message", "Something went wrong! Try again");
                    response.sendRedirect("adminHome.jsp");
                }
            } 
            else 
            {
                session.setAttribute("message", "Pizza with same id is already present!");
                response.sendRedirect("adminHome.jsp");
            }
        } 
        catch (Exception e) 
        {
            out.println(e);
        }
    }
}