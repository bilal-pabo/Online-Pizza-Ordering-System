import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class createCart extends HttpServlet
{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String id = request.getParameter("item");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/online_pizza";
            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();
            String query = "select * from cart where useremail='"+email+"'and itemid='"+id+"'";
            ResultSet res = st.executeQuery(query);
            if (res.next()) 
            {
                int quantity = res.getInt(4);
                String order = res.getString(1);
                quantity = quantity + 1;
                st.executeUpdate("update cart set quantity='" +quantity+"' where orderid='" +order+ "'");
                session.setAttribute("message", "Added to cart!");

                
                response.sendRedirect("menu.jsp");
                
            }
            else
            {
                String order = email + id;
                PreparedStatement ps = con.prepareStatement("INSERT INTO cart VALUES(?,?,?,?)");
                ps.setString(1, order);
                ps.setString(2, email);
                ps.setString(3, id);
                ps.setInt(4, 1);
                int rs = ps.executeUpdate();
                if (rs == 1) 
                {
                    session.setAttribute("message", "Added to cart!");
                    response.sendRedirect("menu.jsp");
                } 
                else 
                {
                    session.setAttribute("message", "Something went wrong!");
                    response.sendRedirect("menu.jsp");
                }
            }

        } catch (Exception e) {
            out.println(e);
        }

    }
}