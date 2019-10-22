<%@ page import="CONTROLLER.DAO.MySQLProductDAO" %>
<%@ page import="MODEL.ProductModel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!--Includo NavbarIN dove è contenuto tutto il codice jsp per la navbar-->
    <jsp:include page="NavbarIN.jsp"></jsp:include>
    <!--CSS-->
    <link rel="stylesheet" href="css/mycss/Product.css">
    <title>Prodotti</title>

</head>
<body>

<!-- Tabella -->
<div class="container mb-4 ">
    <div class="product row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                    </thead>
                    <%
                        MySQLProductDAO mpd = new MySQLProductDAO();
                        List<ProductModel> myProduct = mpd.getAllProducts();
                        for (ProductModel x : myProduct) {
                    %>

                    <tbody>
                    <tr>
                        <td><%=x.getName()%>
                        </td>
                        <td><%=x.getPrice()%><a>&euro; </a>
                        </td>
                        <td><%=x.getQuantity()%>
                        </td>
                        <td><a style="background-color: #ff8100; border-color:#ff8100 ;color: white"
                               class="btn btn btn-default"
                               href="Product.jsp?name=<%=x.getName()%>&price=<%=x.getPrice()%>&quantity=<%=x.getQuantity()%>
                                &description=<%=x.getDescription()%>&img=<%=x.getImageUrl()%>&productCode=<%=x.getProductCode()%>"><i
                                class="fa fa-external-link" aria-hidden="true"></i></a></td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>








