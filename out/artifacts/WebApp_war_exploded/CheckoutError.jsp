<!DOCTYPE html>
<html lang="en">

<head>

    <!--Includo NavbarIN dove è contenuto tutto il codice jsp per la navbar-->
    <jsp:include page="NavbarIN.jsp"></jsp:include>
    <title>PayPal Error</title>
</head>

<body>
<div class="container" style="max-width: 550px">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">
                <h1 style="color: red">Oops!</h1>
                <h2 style="color: red">Non Puoi entrare in questa pagina se prima non inserisci qualcosa nel carrello o premi il pulsante Carrello nel caso in cui hai gia' qualcosa nel carrello</h2>
                <i style="color: red" class="fa fa-exclamation-triangle fa-5x" aria-hidden="true"></i>
                <div class="error-actions">
                    <a href="Homepage.jsp" class="btn btn-primary btn-lg"><i class="fa fa-home" aria-hidden="true"></i>Homepage</a>
                    <a href="Products.jsp" class="btn btn-primary btn-lg"><i class="fa fa-home" aria-hidden="true"></i>Articoli</a>
                    <a href="CartShopping.jsp" class="btn btn-primary btn-lg"><i class="fa fa-home" aria-hidden="true"></i>Carrello</a>
                </div>
            </div>

        </div>
    </div>
</div>
<jsp:include page="FooterIN.jsp"></jsp:include>
</body>


</html>