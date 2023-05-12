<%@page import="java.sql.*" %>
<%@page import="java.sql.*" %>
<%@ include file="components/verifyCustomer.jsp" %>

	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Products Page</title>
		<%@ include file="components/css_js.jsp" %>
	</head>

	<body>
		<%@ include file="components/navbar.jsp" %>
		<%@ include file="components/message.jsp" %>
			<% try { Class.forName("com.mysql.jdbc.Driver"); String url1="jdbc:mysql://localhost:3306/online_pizza" ;
				Connection con1=DriverManager.getConnection(url1, "root" , "root" ); Statement
				st1=con1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY); String
				query1="select * from pizzainfo" ; ResultSet res1=st1.executeQuery(query1); int count=0; while (res1.next())
				{ count++; } res1.beforeFirst(); %>

                

				<div class="container">
					<% while (res1.next()) { %>
						<div class="row">
							<% for (int j=0; j < 3; j++) { %>
								<div class="col-md-4"> <%
									if (res1.getString(2) != null)
                                    { %>
                                        <div class="card mt-5">
                                            <div class="card-header">
                                                <h6 class="text-center text-muted text-uppercase">
                                                    <%= res1.getString(2) %> | Price: <%= res1.getString(3) %> Rs.
                                                </h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="container text-center">
                                                    <%
                                                        String pic = res1.getString(4);
                                                    %>
                                                    <img src="img/products/<%=pic%>" class="img-fluid" style="max-width: 150px;" alt="">
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                                <div class="container text-center">
                                                    <form action="createCart" method="post">
														<button name="item" value="<%= res1.getString(1) %>" class="btn custom-bg text-white">Add to Cart</button>
													</form>
                
                                                </div>
                                            </div>
                        
                                        </div> <%
                                    } %>
								</div>
								<% if (j < 2) { res1.next(); }} %>
						</div>
						<% } %>
				</div>
				<% } catch (Exception e) {} %>

				<%@include file="components/model.jsp" %>
	</body>

	</html>