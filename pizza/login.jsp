<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <%@ include file="components/css_js.jsp" %>
    <script>
        function myFunction()
        {
           var x = document.getElementById("pwd");
           if (x.type == "password")
           {
              x.type = "text";
           }
           else
           {
               x.type = "password";
           }
        }
    </script>
    
</head>
<body>

    <%@ include file="components/nav.jsp" %>
    
    <div class="container">
        <div class="row" mt-5>
            <div class="col-md-12">
                <div class="card mt-5" style="margin-left: 6cm; margin-right: 6cm;">
                    <div class="card-header tm-2 custom-bg text-white">
                        <h3 class="text-center">Sign-In</h3>
                    </div>
                    <div class="card-body bg-light">
                        
                        <form action="Login" method="post">
                            <%@ include file="components/message.jsp" %>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" name="email" placeholder="some@gmail.com" required>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <input type="password" class="form-control" name="pwd" placeholder="******" required>
                            </div>
                            <p>Don't have an account?<a style="color: blue;" href="register.jsp">Register</a></p>
                            <div class="container text-right">
                                <button class="btn btn-outline-auto custom-bg text-white">Login</button>
                            </div>
                        </form>
            
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>