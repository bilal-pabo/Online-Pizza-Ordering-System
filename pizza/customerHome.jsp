<%@ include file="components/verifyCustomer.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <%@ include file="components/css_js.jsp" %>
</head>
<body>
    <%@ include file="components/navbar.jsp" %>
    <%@ include file="components/message.jsp" %>
    <div class="container mt-5">
        <div class="col-md-4">
            <form action="EditProducts.jsp" method="post">
                <div class="form-group text-right">
                    <input type="text" class="form-control" name="name" placeholder="Search name">
                    <button class="btn custom-bg text-white mt-1">Search</button>
                </div>
                
            </form>
        </div>
    </div>
    <div class="container">
        <div class="row mt-3">
            <div class="col-md-6 text-center">
                <div class="card">
                    <div class="card-body">
                        <div class="container">
                            <img src="img/pizza.png" class="img-fluid rounded-circle" style="max-width: 150px;"
                                alt="">
                        </div>
                        
                    </div>
                    <div class="card-footer">
                        <a href="menu.jsp"><h2 class="text-uppercase text-muted">View Menu</h2></a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 text-center">
                <div class="card">
                    <div class="card-body">
                        <div class="container">
                            <img src="img/service.png" class="img-fluid rounded-circle"
                                style="max-width: 150px;" alt="">
                        </div>
                        
                    </div>
                    <div class="card-footer">
                        <a href=""><h2 class="text-uppercase text-muted">My Cart</h2></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="components/model.jsp" %>
</body>
</html>