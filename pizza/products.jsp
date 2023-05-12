<%@page import="java.sql.*" %>
<%@ include file="components/verifyAdmin.jsp" %>

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
				<% try { Class.forName("com.mysql.jdbc.Driver"); String url5="jdbc:mysql://localhost:3306/online_pizza" ;
					Connection con5=DriverManager.getConnection(url5, "root" , "root" ); Statement
					st5=con5.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY); String
					query5="select * from pizzainfo" ; ResultSet res=st5.executeQuery(query5); int count=0; while
					(res.next()) { count++; } res.beforeFirst(); %>
					<div class="container">
						<% while (res.next()) { %>
							<div class="row">
								<% for (int j=0; j < 3; j++) { %>
									<div class="col-md-4">
										<% if (res.getString(2) !=null) { %>
											<div class="card mt-5">
												<div class="card-header">
													<h6 class="text-center text-muted text-uppercase">
														<%= res.getString(2) %> | Price: <%= res.getString(3) %> Rs.
													</h6>
												</div>
												<div class="card-body">
													<div class="container text-center">
														<% String pic=res.getString(4); %>
															<img src="img/products/<%=pic%>" class="img-fluid"
																style="max-width: 150px;" alt="">
													</div>
												</div>
												<div class="card-footer">
													<div class="container text-center">
														<div class="row">
															<div class="col-md-6 text-right pl-5">
																<form action="EditProducts" method="post">
																	<button name="item" value="<%= res.getString(1) %>" class="btn custom-bg text-white">Delete</button>
																</form>
																
															</div>
															<div class="col-md-6 text-left pr-5">
																<form action="edit.jsp" method="post">
																	<button name="item" value="<%= res.getString(1) %>" class="btn custom-bg text-white">Edit</button>
																</form>
															</div>
														</div>
													</div>
												</div>

											</div>
											<% } %>
									</div>
									<% if (j < 2) { res.next(); }} %>
							</div>
							<% } %>
					</div>
					<% } catch (Exception e) {} %>

		

						

		</body>

		</html>