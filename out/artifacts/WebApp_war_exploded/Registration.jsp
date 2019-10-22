<!DOCTYPE html>
<html lang="en">
<head>
    <!--Includo NavbarIN dove è contenuto tutto il codice jsp per la navbar-->
    <jsp:include page="NavbarIN.jsp"></jsp:include>
    <!--CSS-->
    <!--Titolo Pagina-->
    <title>Registrazione</title>
</head>
<body>


<!--Form per la registrazione di un nuovo utente-->

<form action="ControllerView/RegistrationController.jsp" method="post">
    <div class="reg form-group">
        <div aria-required="true" class="row">
            <div class="form-group col-6">
                <label>First Name:</label>
                <input class="form-control" name="FirstName" id="firstname" placeholder="First Name" type="text"
                       required></div>
            <div class="form-group col-6">
                <label>Last Name:</label>
                <input class="form-control" name="LastName" id="lastname" placeholder="Last Name" type="text" required>
            </div>
            <div class="form-group col-6">
                <label>Fiscal Code:</label>
                <input class="form-control" name="FiscalCode" id="fiscalcode" placeholder="Fiscal Code" type="text"
                       required></div>
            <div class="form-group col-6">
                <label>Addresse:</label>
                <input class="form-control" name="Address" id="addresse" placeholder="Address" type="text" required>
            </div>
            <div class="form-group col-6">
                <label>Birth Place:</label>
                <input class="form-control" name="BirthPlace" id="birthplace" placeholder="Birth Place" type="text"
                       required></div>
        </div>

        <div class="row">
            <div class="col-6">
                <label>Gender:</label>
                <div class="form-check">
                    <input name="Gender" type="radio" id="gender" value="M" required>
                    <label>Male</label>
                </div>
                <div class="form-check">
                    <input name="Gender" type="radio" id="gender1" value="F" required>
                    <label>Female</label>
                </div>
            </div>
            <div class="it-datepicker-wrapper col-6">
                <div class="form-group">
                    <label>Birth Date:</label>
                    <input class="form-control it-date-datepicker" name="BirthDate" id="birthDate" type="date"
                           placeholder="Formato gg/mm/aaaa">
                </div>
            </div>
        </div>

        <div aria-required="true" class="row">
            <div class="form-group col-6">
                <label>Email:</label>
                <input class="form-control" name="Email" id="email" placeholder="Email" type="text" required></div>
            <div class="form-group col-6">
                <label>Password:</label>
                <input class="form-control" name="Password" id="password" placeholder="Password" type="password"
                       required></div>
            <div class="form-group col-6">
                <label>Conferm Password:</label>
                <input class="form-control" name="Cpassword" id="Cpassword" placeholder="Cpassword" type="password"
                       required></div>
        </div>


        <div class="reg">
            <label><input id="myCheckbox" type="checkbox" onclick="checkboxReg()">I agreee</label>
            <button type="submit" class="btn btn-primary" onclick="checkpassequal()" id="myReg" disabled>Registrazione
            </button>
            <button class="btn btn-default" type="reset">Cancel</button>
        </div>

        <div>

        </div>
    </div>
</form>

<jsp:include page="FooterIN.jsp"></jsp:include>
</body>
</html>