import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Registration extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String city = request.getParameter("city");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");
        int role = 2;

        out.println("<html>");
        out.println("<head><title>Registration Form</title></head>");
        out.println("<body bgcolor=\"#ffffff\">");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/online_pizza";
            Connection con = DriverManager.getConnection(url, "root", "root");
            HttpSession httpSession = request.getSession();
            Statement st = con.createStatement();
            String query = "select * from userinfo where email='" + email + "'";
            ResultSet res = st.executeQuery(query);
            if (!res.next()) 
            {
                PreparedStatement ps = con.prepareStatement("INSERT INTO userinfo VALUES(?,?,?,?,?,?,?)");
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, city);
                ps.setString(4, contact);
                ps.setString(5, email);
                ps.setString(6, pwd);
                ps.setInt(7, role);

                int rs = ps.executeUpdate();
                if (rs == 1) 
                {
                    httpSession.setAttribute("message", "Welcome " + fname + " " + lname);
                    response.sendRedirect("customerHome.jsp");
                    httpSession.setAttribute("login", "true");
                    httpSession.setAttribute("name", fname + " " + lname);
                    httpSession.setAttribute("email", email);
                    httpSession.setAttribute("role", "customer");
                } 
                else 
                {
                    httpSession.setAttribute("message", "Something went wrong try again!");
                    response.sendRedirect("customerHome.jsp");
                }

                out.println("</body></html>");

                ps.close();
                con.close();
            }
            else
            {
                
                httpSession.setAttribute("message", "Email already registered, try another!");
                response.sendRedirect("register.jsp");
            }

        } catch (Exception e) {
            out.println(e);
        }
    }
}