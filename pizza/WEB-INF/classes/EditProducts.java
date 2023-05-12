import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig
public class EditProducts extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String id = request.getParameter("item");
        
        HttpSession session = request.getSession();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/online_pizza";
            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();
            String query = "delete from pizzainfo where id='" + id + "'";
            int res = st.executeUpdate(query);
            if (res == 1) {
                session.setAttribute("message", "Deleted successfully!");
                response.sendRedirect("products.jsp");
            }

        } catch (Exception e) {
            session.setAttribute("message", "Something went wrong! Try again");
            response.sendRedirect("products.jsp");
        }
    }
}