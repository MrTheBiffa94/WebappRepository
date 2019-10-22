<!DOCTYPE html>
<html lang="en">

<head>
    <!--Includo NavbarIN dove è contenuto tutto il codice jsp per la navbar-->
    <jsp:include page="NavbarIN.jsp"></jsp:include>
    <title>Payment Error</title>
</head>

<body>
<div class="container" style="max-width: 550px">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">
                <h1 style="color: red">Oops!</h1>
                <h2 style="color: red">Non puoi accedere in questa pagina,torna alla Homepage oppure effettua il login</h2>
                <i style="color: red" class="fa fa-exclamation-triangle fa-5x" aria-hidden="true"></i>
                <form action="ControllerView/LoginController.jsp">
                    <div aria-required="true" class="form-group">
                        <label>Email:</label>
                        <input class="form-control" name="Email" id="email" placeholder="Email" type="text" required>
                        <label>Password:</label>
                        <input class="form-control" name="Password" id="pwd" placeholder="Password" type="password"
                               required>
                    </div>
                    <div>
                        <button class="btn btn-primary">Log In</button>
                    </div>
                </form>
                <div class="error-actions">
                    <a href="Homepage.jsp" class="btn btn-primary btn-lg"><i class="fa fa-home" aria-hidden="true"></i>Homepage</a>
                    <%if (session.getAttribute("sessionID") != null){ %>
                    <a href="CartShopping.jsp" class="btn btn-primary btn-lg"><i class="fa fa-home" aria-hidden="true"></i>Carrello</a>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="FooterIN.jsp"></jsp:include>
</body>


</html>