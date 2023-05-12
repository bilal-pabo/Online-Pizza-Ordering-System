<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<nav class="navbar navbar-expand-lg navbar-dark custom-bg text-white">
    <div class="container">
        <a class="navbar-brand">Pizza Paradise</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="
          <%
            String r = (String) session.getAttribute("role");
            if (r.equals("admin"))
            {
              %> adminHome.jsp <%
            }
            if (r.equals("customer"))
            {
              %> customerHome.jsp <%
            }
            String email = (String) session.getAttribute("email");
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/online_pizza";
            Connection con = DriverManager.getConnection(url, "root", "root");
            Statement st = con.createStatement();
            String query = "select * from cart where useremail='"+email+"'";
            ResultSet rs = st.executeQuery(query);
            int cart = 0;
            while (rs.next())
            {
              cart++;
            }
            String s = String.valueOf(cart);
            session.setAttribute("cart", s);
        %>
          ">Home <span class="sr-only">(current)</span></a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto"> <% if (session.getAttribute("role").toString().equals("customer")) { %>
        <li class="nav-item active">
          <a class="nav-link" data-toggle="modal" data-target="#cart" href="#!">Cart(<%= session.getAttribute("cart").toString() %>)</a>
        </li> <% } %>
        <li class="nav-item active">
          <a class="nav-link" href="profile.jsp"><%= (String)session.getAttribute("name") %></a>
        <li class="nav-item active">
          <form action="Logout" method="post">
            <button class="btn custom-bg text-white">Logout</button>
          </form>
        </li>
      </ul>
      
    </div>
    </div>
  </nav>