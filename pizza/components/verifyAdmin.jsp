<% String name=(String) session.getAttribute("name"); String login=(String) session.getAttribute("login"); String
    role=(String) session.getAttribute("role"); if (login !=null) { if (role.equals("customer")) {
    session.setAttribute("message", "You are not admin!" ); response.sendRedirect("login.jsp"); return; } } else {
    session.setAttribute("message", "You are not logged in, login first!" ); response.sendRedirect("login.jsp"); return;
    } %>