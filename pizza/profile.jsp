<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <%@ include file="components/css_js.jsp" %>
</head>
<body>
    <%@ include file="components/navbar.jsp" %>

    <div class="container">
        <div class="col-md-12">
            <div class="card mt-3" style="margin-left: 8cm; margin-right: 8cm;">
                <div class="card-header text-white custom-bg">
                    <%
                        if (session.getAttribute("role").toString().equals("admin"))
                        {
                            %> <h4 class="text-center">Admin</h4> <%
                        }
                        if (session.getAttribute("role").toString().equals("customer"))
                        {
                            %> <h4 class="text-center">Customer</h4> <%
                        }
                    %>
                </div>
                <div class="card-body">
                    <div class="container text-center">
                        <img class="img-fluid rounded-circle" style="max-width: 300px;" 
                        <%
                            if (session.getAttribute("role").toString().equals("admin"))
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
                    <h6 class="text-center"> <%= session.getAttribute("name") %></h6>
                </div>
            </div>
        </div>
    </div>
</body>
</html>