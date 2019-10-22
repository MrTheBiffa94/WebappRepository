<!DOCTYPE html>
<html lang="en">

<head>
    <!--Includo NavbarIN dove è contenuto tutto il codice jsp per la navbar-->
    <jsp:include page="NavbarIN.jsp"></jsp:include>

    <link rel="stylesheet" href="css/mycss/PageError.css">
    <title>Reset Password</title>
</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">
                <h2>Forgot Password</h2>
                <div class="error-details">
                    Inserisci la tua mail per resettare la password
                </div>
                <form action="ControllerView/ResetPassController.jsp" method="post" style="margin: auto">
                    <div class="error-actions">
                        <input class="form-control" name="Email" id="email" placeholder="Email" type="text" required/>
                    </div>
                    <div>
                        <button class="btn btn-primary">Reset</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="FooterIN.jsp"></jsp:include>
</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</html>