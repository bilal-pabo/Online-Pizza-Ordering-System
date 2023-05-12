
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registeration Page</title>
    <%@ include file="components/css_js.jsp" %>

</head>
<body>
    <%@include file="components/nav.jsp" %>
    <div class="container">
        <div class="row" mt-5>
            <div class="col-md-12">
                <div class="card mt-5" style="margin-left: 5cm; margin-right: 5cm;">
                    <div class="card-header tm-2 custom-bg text-white">
                        <h3 class="text-left">Sign-Up</h3>
                    </div>
                    <div class="card-body bg-light">
                        
                        <form action="Registration" method="post">
                            <%@ include file="components/message.jsp" %>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="fname">Firstname</label>
                                        <input type="text" class="form-control" name="fname" placeholder="Enter first name" required>
                                    </div>
                                    
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="lname">Lastname:</label>
                                        <input type="text" class="form-control" name="lname" placeholder="Enter last name" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city">City:</label>
                                        <input type="text" class="form-control" name="city" placeholder="Enter city" required>
                                    </div>
                                    
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="contact">Contact:</label>
                                        <input type="tel" class="form-control" name="contact" pattern="03[0-9]{2}[0-9]{7}" placeholder="Format: 03XXXXXXXXX" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <input type="email" class="form-control" name="email" placeholder="some@gmail.com" required>
                                    </div>
                                    
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="pwd">Password:</label>
                                        <input type="password" class="form-control" name="pwd" placeholder="******" required>
                                    </div>
                                </div>
                            </div>
                            <div class="container text-right">
                                <button class="btn btn-outline-auto custom-bg text-white">Register</button>
                            </div>
                        </form>
            
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>