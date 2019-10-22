<!DOCTYPE html>
<html lang="en">
<head>
    <!--Includo NavbarIN dove è contenuto tutto il codice jsp per la navbar-->
    <jsp:include page="NavbarIN.jsp"></jsp:include>
    <!--CSS-->
    <link rel="stylesheet" href="css/mycss/Product.css">
    <title><%= request.getParameter("name") %></title>
</head>
<body>

<div class="container">
    <div class="product row">
        <div class="col-xs-4 item-photo">

        </div>
        <div class="col-xd-5" style="border:0px solid gray">
            <h3>Nome</h3>


            <h6 class="title-desc">
                <h6><%= request.getParameter("name") %>
                </h6>
            </h6>
            <% String i = request.getParameter("img");
                if (i.equals("NA")) {%>
            <img src="image/NotAvailable.png">
            <%}%>

            <h3>Dettagli</h3>


            <h6 class="title-desc">
                <h6><%= request.getParameter("description") %>
                </h6>
            </h6>
            <h3 style="margin-top:0px ;">Dettagli prezzo</h3>

            <!-- Detalles especificos del producto -->
            <div class="section" style="padding-bottom:20px;">
                <h6 class="title-price">
                    <h6><%= request.getParameter("price") %><a>&euro; </a>
                    </h6>
                </h6>
                <div>
                    <h3 style="margin-top:0px ;">Quantita' disponibile</h3>
                    <h6 class="title-quant">
                        <h6><%= request.getParameter("quantity")%>
                        </h6>
                    </h6>
                </div>
            </div>
            <!-- Bottone per mandare al carrello -->
            <form action="ControllerView/AddToCartController.jsp?productCode=<%=request.getParameter("productCode")%>"
                  method="post">
                <div class="section" style="padding-bottom:20px;">
                    <button class="btn btn-success"><i class="fa fa-cart-plus" aria-hidden="true"></i></button>
                </div>
                <div class="section" style="padding-bottom:20px;">
                    <a id="down" class="btn btn-default" style="background-color: red" onclick=" down('1')"><i
                            class="fa fa-minus" aria-hidden="true"></i></a>
                    <input type="number" value="1" name="quantity" id="input">
                    <a id="up" class="btn btn-default" style="background-color: green" onclick=" up('10')"><i
                            class="fa fa-plus" aria-hidden="true"></i></a>
                </div>
            </form>
        </div>
        </div>
    </div>

</body>
</html>