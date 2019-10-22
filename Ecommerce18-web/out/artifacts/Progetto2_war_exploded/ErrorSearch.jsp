<!DOCTYPE html>
<html lang="en">

<head>
    <!--Includo NavbarIN dove è contenuto tutto il codice jsp per la navbar-->
    <jsp:include page="NavbarIN.jsp"></jsp:include>
    <title>Error Search</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">
                <h1 style="color: red">Oops!</h1>
                <h1 style="color: red">BAD SEARCH</h1>
                <i style="color: red" class="fa fa-exclamation-triangle fa-5x" aria-hidden="true"></i>
                <div class="error-actions">
                    <a href="Homepage.jsp" class="btn btn-primary btn-lg"><i class="fa fa-home" aria-hidden="true"></i>Homepage
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>