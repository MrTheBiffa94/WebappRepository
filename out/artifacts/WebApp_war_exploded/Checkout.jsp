<%@ page import="CONTROLLER.DAO.MySQLUserDAO" %>
<%@ page import="MODEL.UserModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Add meta tags for mobile and IE -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!--richiamo la navbar-->
    <jsp:include page="NavbarIN.jsp"></jsp:include>
    <title>Checkout</title>
</head>
<!--Inserisci testo per il carrello non loggato-->
<body>
<% if (session.getAttribute("sessionID") == null) {%>
    <!--codice nel caso in cui l'utente non + loggato-->
    <jsp:include page="CartError.jsp"></jsp:include>
<% } else {
        if (request.getParameter("totale") == null || request.getParameter("controllo").equals(0)  ){%>
            <jsp:include page="CheckoutError.jsp"></jsp:include>
        <%}else {%>
                <div class="container" style="max-width: 550px">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="error-template">
                                <h2>Importo da pagare</h2>
                                <%
                                    String importo  = request.getParameter("totale");
                                %>

                                <a><%=request.getParameter("totale")%></a><a>&euro; </a></form>
                                <div class="error-details">Scegli il metodo di pagamento</div>

                                <!-- Set up a container element for the button -->
                                <di id="paypal-button-container"></di>
                                <!-- Include the PayPal JavaScript SDK -->
                                <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD"></script>

                                <script>
                                    function totale(){
                                        var tot = "<%=importo%>";
                                        return tot;
                                    }

                                    // Render the PayPal button into #paypal-button-container
                                    paypal.Buttons({

                                        // Set up the transaction
                                        createOrder: function(data, actions) {
                                            return actions.order.create({
                                                purchase_units: [{
                                                    amount: {
                                                        value: totale()
                                                    }
                                                }]
                                            });
                                        },

                                        // Finalize the transaction
                                        onApprove: function(data, actions) {
                                            return actions.order.capture().then(function(details) {
                                                // Show a success message to the buyer
                                                alert('Transaction completed by ' + details.payer.name.given_name + '!');
                                                setTimeout(function(){ $("#next").show(); }, 3000);
                                            });
                                        }

                                    }).render('#paypal-button-container');
                                </script>

                            </div>
                        </div>
                    </div>
                    <a style="display: none" id="next" href="Payment.jsp?controller=<%=1%>" class="btn  btn-success " >Prosegui</a >
                </div>
                <jsp:include page="FooterIN.jsp"></jsp:include>
                <%}
                }%>
</body>
</html>

