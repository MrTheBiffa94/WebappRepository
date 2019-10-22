<%@ page import="CONTROLLER.DAO.MySQLUserDAO" %>
<%@ page import="CONTROLLER.UserController" %>
<%@ page import="MODEL.UserModel" %>

<%
    if (session.getAttribute("sessionID") == null) {
        //estraggo tutti i parametri per la registrazione dalla jsp

        String firstn = request.getParameter("FirstName");
        String lastn = request.getParameter("LastName");
        String fiscalcod = request.getParameter("FiscalCode");
        String gender = request.getParameter("Gender");
        String address = request.getParameter("Address");
        String birthplace = request.getParameter("BirthPlace");
        String birthdate = request.getParameter("BirthDate");
        String usr = request.getParameter("Email");
        String pwd = request.getParameter("Password");
        String pwd2 = request.getParameter("Cpassword");
        //effettuo la connessione

        UserController uc = new UserController();
        UserModel u = new UserModel(firstn.toUpperCase(), lastn.toUpperCase(), gender.toUpperCase(), birthplace.toUpperCase(), birthdate.toUpperCase());
        MySQLUserDAO ud = new MySQLUserDAO();
        if (uc.checkFiscalCode(u, fiscalcod)) {
            //controllo se esiste gia un utente con quella mail e con quel codice fiscale
            if (!ud.userExists(usr) && !ud.CfExists(fiscalcod)) {
                //controllo che le password inserite siano uguali
                if (pwd.equals(pwd2)) {
                    UserModel newUser = new UserModel(usr, pwd, firstn, lastn, fiscalcod, gender, address, birthplace, birthdate);
                    ud.insertUser(newUser);
                    response.sendRedirect("../Homepage.jsp");
                } else {
                    System.out.println("Le password non coincidono");
                    response.sendRedirect("../Registration.jsp");
                }
            } else {
                System.out.println("Codice fiscale o Email gia presenti");
                response.sendRedirect("../Registration.jsp");
            }
        }
    } else {
        response.sendRedirect("../Homepage.jsp");
    } //se esiste una sessione vuol dire che è già stato effettuato il login
%>
