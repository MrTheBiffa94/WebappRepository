<%@ page import="CONTROLLER.DAO.MySQLUserDAO" %>
<%@ page import="MODEL.UserModel" %>

<%
    if (session.getAttribute("sessionID") == null) {
        //dalla richiesta estraggo username e password
        //nel caso in cui non sei loggato
        String usr = request.getParameter("Email"); //prendo la mail dalla jsp
        String pwd = request.getParameter("Password");//prendo la password dalla jsp
        //effettuo la connessione
        MySQLUserDAO ud = new MySQLUserDAO();
        UserModel um = ud.getUser(usr, pwd);
        if (um != null) {
            session.setAttribute("sessionID", um.getUsercode());
            session.setAttribute("count", null);
            response.sendRedirect("../Homepage.jsp");//torno alla pagina principale
        } else {
            //altrimenti le credenziali sono errate/l'utente non è registrato
            response.sendRedirect("../LoginError.jsp");

        }
    } else {
        response.sendRedirect("../Homepage.jsp");
    } //se esiste una sessione vuol dire che è già stato effettuato il login
%>
