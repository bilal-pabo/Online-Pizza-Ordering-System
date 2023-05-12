import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Edit extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/online_pizza";
            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();
            
                String id1 = request.getParameter("id1");
                String id2 = request.getParameter("id");
                String name = request.getParameter("name");
                String price = request.getParameter("price");

                if (id2.equals("")) {
                    String query = "update pizzainfo set name ='" + name + "', price='" + price + "' where id='" + id1
                            + "'";
                    int res = st.executeUpdate(query);
                    if (res >= 1) {
                        session.setAttribute("message", "Updated successfully!");
                        response.sendRedirect("products.jsp");
                    } else {
                        session.setAttribute("message", "1");
                        response.sendRedirect("products.jsp");
                    }
                } else {
                    ResultSet rs = st.executeQuery("select * from pizzainfo where id='" + id2 + "'");
                    if (rs.next()) {
                        session.setAttribute("message", "Pizza with same id is already present!");
                        response.sendRedirect("products.jsp");
                    } else {
                        String query = "update pizzainfo set id='" + id2 + "', name ='" + name + "', price='" + price
                                + "' where id='" + id1 + "'";
                        int res = st.executeUpdate(query);
                        if (res >= 1) {
                            session.setAttribute("message", "Updated successfully!");
                            response.sendRedirect("products.jsp");
                        } else {
                            session.setAttribute("message", "2");
                            response.sendRedirect("products.jsp");
                        }
                    }
                }
            
        }
        catch (Exception e)
        {
            out.println(e);
            
        }
    }
}