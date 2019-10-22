<%@ page import="MODEL.ProductModel" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!--Includo NavbarIN dove è contenuto tutto il codice jsp per la navbar-->
    <jsp:include page="NavbarIN.jsp"></jsp:include>
    <!--CSS-->
    <link rel="stylesheet" href="css/mycss/Product.css">
    <title>Search page</title>
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
                    <tbody>
                    <%
                        List<ProductModel> prodotti = (List<ProductModel>) request.getAttribute("Prodotti");
                        for (ProductModel x : prodotti) {
                    %>
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
                    <%
                        }
                        request.removeAttribute("Prodotti");
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="FooterIN.jsp"></jsp:include>
</body>
</html>