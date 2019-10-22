<%@ page import="CONTROLLER.DAO.MySQLUserDAO" %>
<%@ page import="CONTROLLER.MailSenderController" %>

<%
    //Recupero password con inserimento della mail
    String usr = request.getParameter("Email");
    //effettuo la connessione
    MySQLUserDAO ud = new MySQLUserDAO();

    MailSenderController ms = new MailSenderController();
    String pass = ud.getPassword(usr);
    ms.sendForgottenPassword(usr, pass); //metodo che invia una mail per il reset della password

    response.sendRedirect("../Homepage.jsp");
%>
