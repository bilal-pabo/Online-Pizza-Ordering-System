<%@ page import="java.sql.*" %>
  
  <div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header custom-bg text-white" style="width: 15cm;">
          <h5 class="modal-title " id="exampleModalLongTitle">My Cart</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        
        <div class="modal-body bg-light" style="width: 15cm;">
            <div class="cart-body">
<%
          
              String email1 = (String) session.getAttribute("email");
              Connection con2 = null;
              ResultSet rr = null;
              Statement ss = null;
              String query4 = null;
              try
              {
                
                Class.forName("com.mysql.jdbc.Driver");
                String url2 = "jdbc:mysql://localhost:3306/online_pizza";
                con2 = DriverManager.getConnection(url2, "root", "root");
                ss = con2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);

                

                query4="select * from cart where useremail='"+email+"'";
                ss=con2.createStatement();
                rr = ss.executeQuery(query);
                
                while (rr.next())
                {
                  
                  String id = rr.getString(3);
                  int count = rr.getInt(4);

                  String query3="select * from pizzainfo where id= '" + id + "'";

                  Statement st2=null;
                  ResultSet rs2=null;
                  try
                  {

                    st2 = con2.createStatement();
                    rs2 = st2.executeQuery(query3);


                    if(rs2.next())
                    {
                      String pizzaname = rs2.getString(2);
                      String pic = rs2.getString(4);
                      String pid = rs2.getString(1);
%>
                      <div class="container">
                        <div class="row mt-3">
                          <div class="col-md-3">
                            
                            <img class="img-fluid rounded-circle" src="img/products/<%=pic%>" alt="">
                          </div>
                          <div class="col-md-3">
                             <h6><%= pizzaname %></h6>
                          </div>
                          <div class="col-md-3">
                             <h6>Quantity: <%= count %></h6>
                          </div>
                          <div class="col-md-3">
                              <form action="removefromCart" method="post">
                                <button name="item" value="<%=pid%>" class="btn custom-bg text-white">Remove</button>
                              </form>
                          </div>
                        </div>
                       </div>
<%
                    }
                  }
                  catch(Exception e)
                  {
                    out.println(e);
                  }
                }
              }
              catch(Exception e)
              {
                out.println(e);
              }
              

                %>
            </div>
        </div>
        <div class="modal-footer bg-light" style="width: 15cm;">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <form action="submitOrder.jsp" method="post">
            <button type="button" class="btn custom-bg text-white checkout">Place Order</button>
          </form>
        </div>
      </div>
    </div>
  </div>