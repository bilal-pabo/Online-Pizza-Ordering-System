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
				<% try { Class.forName("com.mysql.jdbc.Driver"); String url7="jdbc:mysql://localhost:3306/online_pizza" ;
					Connection con7=DriverManager.getConnection(url7, "root" , "root" ); Statement
					st7=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY); String
					query7="select * from userinfo" ; ResultSet res=st7.executeQuery(query7); int count=0; while
					(res.next()) { count++; } res.beforeFirst(); %>
					<div class="container">
						<% while (res.next()) { %>
							<div class="row">
								<% for (int j=0; j < 3; j++) { %>
									<div class="col-md-4">
										<% if (res.getString(5) !=null) { %>
											<div class="card mt-5">
												<div class="card-header">
													<h6 class="text-center text-muted text-uppercase">
														<% if (res.getString(7).equals("1"))
                                                          { %>
                                                        Admin <% } else {
                                                            %> Customer <%
                                                        } %>
													</h6>
												</div>
												<div class="card-body">
													<div class="container text-center">
														
                                                        <img class="img-fluid rounded-circle" style="max-width: 150px;" 
                                                        <%
                                                            if (res.getString(7).equals("1"))
                                                            {
                                                                %> src="img/admin.jpg" <%
                                                            }
                                                            else
                                                            {
                                                                %> src="img/users/profile.png" <%
                                                            }
                                                        %>
                                                        alt="">
													</div>
												</div>
												<div class="card-footer">
													<div class="container text-center">
														<h6><%=res.getString(1)%> <%=res.getString(2)%></h6>
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