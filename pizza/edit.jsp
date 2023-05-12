<%@page import="java.sql.*" %>
<%@ include file="components/verifyAdmin.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Item</title>
    <%@ include file="components/css_js.jsp" %>
</head>
<body>
    <%@ include file="components/navbar.jsp" %>
        <%@ include file="components/message.jsp" %>
			<% 
                String id = request.getParameter("item");
                
            try { Class.forName("com.mysql.jdbc.Driver"); String url6="jdbc:mysql://localhost:3306/online_pizza" ;
				Connection con6=DriverManager.getConnection(url6, "root" , "root" ); Statement
				st6=con6.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY); String
				query6="select * from pizzainfo where id='"+id+"'" ; 
                ResultSet res=st6.executeQuery(query6);

                if (res.next())
                {
                    %>

                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card mt-3" style="margin-left: 8cm; margin-right: 8cm;">
                                    <div class="card-header custom-bg text-white">
                                        <h3>Edit pizza details</h3>
                                    </div>
                                    <div class="card-body">
                                        <form action="Edit" method="post">
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="id1" value="<%= res.getString(1) %>" placeholder="This is old id" required>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="id" placeholder="Enter new id here if want">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="name" value="<%= res.getString(2) %>" placeholder="Enter Pizza name" required>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="price" value="<%= res.getString(3) %>" placeholder="Enter Pizza price" required>
                                            </div>
                                            <div class="container text-right">
                                                <button name="function" value="edit" class="btn custom-bg text-white">Save Changes</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <%
                }
                else{
                    session.setAttribute("message", "Something went wrong!");
                
                response.sendRedirect("menu.jsp");
                }
                
                
         
        
    } 
    catch (Exception e) 
    {
        session.setAttribute("message", "Something went wrong! Try again");
        response.sendRedirect("products.jsp");
    }
    %>
    
</body>
</html>