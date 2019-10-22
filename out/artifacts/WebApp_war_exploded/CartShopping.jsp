<%@ page import="CONTROLLER.DAO.MySQLCartDAO" %>
<%@ page import="CONTROLLER.DAO.MySQLProductDAO" %>
<%@ page import="MODEL.CartModel" %>
<%@ page import="MODEL.ProductModel" %>
<%@ page import="java.util.List" %>
<%@ page import="CONTROLLER.CartController" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!--Includo NavbarIN dove è contenuto tutto il codice jsp per la navbar-->
    <jsp:include page="NavbarIN.jsp"></jsp:include>
    <!--CSS-->
    <link rel="stylesheet" href="css/mycss/RegPay.css">
    <title>Cart Shopping</title>

</head>
<body>
<% if (session.getAttribute("sessionID") == null) { %>
<!--Inserisci testo per il carrello non loggato-->

<!--Includo NavbarIN dove è contenuto tutto il codice jsp per la navbar-->
<jsp:include page="CartError.jsp"></jsp:include>

<% } else {%>
<div class="cartShop container mb-4 " style="width: auto">
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Product</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotale</th>
                    </tr>
                    </thead>
                    <%
                        MySQLCartDAO mcd = new MySQLCartDAO();
                        List<CartModel> myProduct = mcd.getCart((String) session.getAttribute("sessionID"));
                        MySQLProductDAO mpd = new MySQLProductDAO();
                        CartController cc = new CartController();
                        for (CartModel x : myProduct) {
                            ProductModel pd = mpd.getProductById(x.getProductCode());
                            double totalpriceproduct = cc.getPriceProduct(pd.getPrice(),x.getSelectedQuantity());
                    %>
                    <tbody>
                    <tr>
                        <% String i = pd.getImageUrl();
                            if (i.equals("NA")) {%>
                        <td>
                            <a href="Product.jsp?name=<%=pd.getName()%>&price=<%=pd.getPrice()%>&quantity=<%=pd.getQuantity()%>
                                 &description=<%=pd.getDescription()%>&img=<%=pd.getImageUrl()%>&productCode=<%=pd.getProductCode()%>">
                                <img style="height: 30%; width: 30%" src="image/NotAvailable.png"> </a></td>
                        <%}%>
                        <td><%=pd.getName()%>
                        </td>
                        <td><%=pd.getPrice()%><a>&euro; </a>
                        </td>
                        <td>
                            <form action="ControllerView/UpdateQuantityController.jsp?productCode=<%=x.getProductCode()%>"
                                  method="post">
                                <div>
                                <button class="btn btn-success"><i class="fa fa-refresh" aria-hidden="true"></i></button>
                                </div>
                                <input type="number" value="<%=x.getSelectedQuantity()%>" name="quantity" id="input" min="1" max="10">
                            </form>

                        </td>
                        <td><%=totalpriceproduct%><a>&euro; </a>
                        </td>
                        <td>
                            <form action="ControllerView/DeleteElemCartController.jsp?productCode=<%=x.getProductCode()%>"
                                  method="post">
                                <button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button>
                            </form>
                        </td>

                    </tr>
                    <%}%>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td><form><a data-target="#DelCart" data-toggle="modal"  class="btn  btn-success" style="background-color: red"> Elimina Carrello</a></form></td>
                            <td class="hidden-xs text-center"><strong>Totale:<%=cc.getTotal(myProduct)%><a>&euro; </a></strong></td>
                            <td><div class="col-sm-12 col-md-6 text-right">
                                <%
                                    if (myProduct.isEmpty()){%>
                                    <button  class="btn  btn-success " disabled>Checkout</button >
                                <%} else {%>
                                    <a href="Checkout.jsp?totale=<%=cc.getTotal(myProduct)%>&controllo=<%=1%>" class="btn  btn-success " >Checkout</a >
                                    <%}%>
                            </div></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>


<!-- modal Elimina Carrello-->
<div class="modal fade" id="DelCart">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- header -->
            <div class="modal-header">
                <h1 class="modal-title text-uppercase">Elimina Carrello</h1>
            </div>
            <!-- body -->
            <div class="modal-header">
                    <div aria-required="true" class="form-group">
                        <label>Sei sicuro di voler eliminare tutto il carrello?</label>
                    </div>
            </div>
            <!-- footer -->
            <form action="ControllerView/DeleteAllCartController.jsp" method="post" role="form" style="margin: auto">
                <div class="modal-footer" >
                    <button class="btn btn btn-primary">Si</button>
                    <button class="btn btn-default" data-dismiss="modal" type="button">No</button>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="FooterIN.jsp"></jsp:include>
<% } %>
</body>

</html>
