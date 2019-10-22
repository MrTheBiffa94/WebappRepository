<%@ page import="CONTROLLER.DAO.MySQLUserDAO" %>
<%@ page import="MODEL.UserModel" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <!--Includo NavbarIN dove è contenuto tutto il codice jsp per la navbar-->
    <jsp:include page="NavbarIN.jsp"></jsp:include>
    <title>Pagamento</title>
</head>

<body>
<% if (session.getAttribute("sessionID") == null || request.getParameter("controller") == null || request.getParameter("controller").equals(0)) {%>
<!--codice nel caso in cui l'utente non + loggato-->
<jsp:include page="Error.jsp"></jsp:include>

<%}else {%>
<div class="container" style="max-width: 550px">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">
                <%
                    MySQLUserDAO mud = new MySQLUserDAO();
                    UserModel us = mud.getName((String) session.getAttribute("sessionID"));

                %>
                <form action="ControllerView/PdfController.jsp?email=<%%>" method="post" id="sendPDF">
                   <h1 style="color: green">Gentile <%=us.getFirstName()%>, Il pagamento e' andato a buon fine</h1>
                    <i style="color: green" class="fa fa-check-circle-o fa-5x" aria-hidden="true"></i>
                    <h2>Inserisci i tuoi dati e la tua mail per ricevere la fattura</h2>
                    <form action="ControllerView/PdfController.jsp" method="post">
                        <label>Email:</label>
                        <input class="form-control" name="Email" id="email" placeholder="Email" type="text" required>
                        <label>Indirizzo</label>
                        <input class="form-control" name="indirizzo" id="ind" placeholder="Indirizzo" type="text" required>
                        <label>Nome:</label>
                        <input class="form-control" name="firstname" id="firstname" placeholder="Nome" type="text" required>
                        <label>Cognome:</label>
                        <input class="form-control" name="lastname" id="lastname" placeholder="Cognome" type="text"
                               required>
                        <div>
                            <button class="btn  btn-success ">Invia Fattura</button >
                        </div>
                    </form>
                </form>

            </div>
        </div>
    </div>
</div>
<%}%>

</body>
</html>