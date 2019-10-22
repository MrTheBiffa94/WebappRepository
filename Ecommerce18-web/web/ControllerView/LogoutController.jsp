<%
    //vanno semplicemente resettati i valori della sessione
    session.setAttribute("sessionID", null);
    session.setAttribute("count", null);
    session.invalidate();
    response.sendRedirect("../Homepage.jsp");//torno alla pagina principale
%>