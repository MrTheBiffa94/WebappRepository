<!DOCTYPE html>
<html lang="en">

<head>

    <!--Includo NavbarIN dove è contenuto tutto il codice jsp per la navbar-->
    <jsp:include page="NavbarIN.jsp"></jsp:include>
    <title>Cart Error</title>
</head>

<body>
<div class="container" style="max-width: 550px">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">
                <h1 style="color: red">Oops!</h1>
                <h2 style="color: red">Devi effettuare il login per visualizzare il carrello</h2>
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
            </div>

        </div>
    </div>
</div>

</body>
</html>