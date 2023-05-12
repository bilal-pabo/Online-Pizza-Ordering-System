<% String name=(String) session.getAttribute("name"); String login=(String)
session.getAttribute("login"); String role=(String)
session.getAttribute("role"); if (login !=null) { if (role.equals("admin")) {
session.setAttribute("message", "You are not customer!" );
response.sendRedirect("adminHome.jsp"); return; } } else {
session.setAttribute("message", "You are not logged in, login first!" );
response.sendRedirect("login.jsp"); return; } %>
