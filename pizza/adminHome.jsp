<% String name=(String) session.getAttribute("name"); String login=(String) session.getAttribute("login"); String
    role=(String) session.getAttribute("role"); if (login !=null) { if (role.equals("customer")) {
    session.setAttribute("message", "You are not admin!" ); response.sendRedirect("login.jsp"); return; } } else {
    session.setAttribute("message", "You are not logged in, login first!" ); response.sendRedirect("login.jsp"); return;
    } %>



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
            <div class="container admin">
                <div class="row mt-3">
                    <div class="col-md-6 text-center">
                        <div class="card" data-toggle="modal" data-target="#addPizza">
                            <div class="card-body">
                                <div class="container">
                                    <img src="img/pizza.png" class="img-fluid rounded-circle" style="max-width: 150px;"
                                        alt="">
                                </div>
                                <h2 class="text-uppercase text-muted">Add Pizza</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 text-center">
                        <a href="products.jsp">
                            <div class="card">
                                <div class="card-body">
                                    <div class="container">
                                        <img src="img/pizza (2).png" class="img-fluid rounded-circle"
                                            style="max-width: 150px;" alt="">
                                    </div>
                                    <h2 class="text-uppercase text-muted">View Pizzas</h2>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6 text-center">
                        <div class="card">
                            <div class="card-body">
                                <div class="container">
                                    <img src="img/shopping-bag.png" class="img-fluid rounded-circle" style="max-width: 150px;"
                                        alt="">
                                </div>
                                <h2 class="text-uppercase text-muted">Orders</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 text-center">
                        <a href="customers.jsp" class="link">
                            <div class="card">
                                <div class="card-body">
                                    <div class="container">
                                        <img src="img/service.png" class="img-fluid rounded-circle"
                                            style="max-width: 150px;" alt="">
                                    </div>
                                    <h2 class="text-uppercase text-muted">Users</h2>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="addPizza" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header custom-bg text-white">
                            <h5 class="modal-title" id="exampleModalLongTitle">Add Pizza Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="ManagePizza" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="id" placeholder="Enter pizza id">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="name" placeholder="Enter pizza name">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="price" placeholder="Enter pizza price">
                                </div>
                                <div class="form-group">
                                    <label for="pic">Select picture</label> <br>
                                    <input type="file" name="pic" required>
                                </div>
                                <div class="container text-right">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button class="btn btn-outline-auto custom-bg text-white" name="function" value="add">Add Pizza</button>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>

    </body>

    </html>