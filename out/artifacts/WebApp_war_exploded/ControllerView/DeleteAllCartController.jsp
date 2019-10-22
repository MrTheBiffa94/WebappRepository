<%@ page import="CONTROLLER.DAO.MySQLCartDAO" %>
<%
    if (session.getAttribute("sessionID") == null){
        //nel caso in cui non sei loggato si ritorna alla pagina di LoginError per eseguire il login
        response.sendRedirect("../LoginError.jsp");
    }
    else
    {
    String UserCode = (String)session.getAttribute("sessionID"); //stringa che contiene usercode personale
    MySQLCartDAO cd = new MySQLCartDAO();
    cd.deleteCart(UserCode);//metodo deleteCart che elimina tutti gli elementi dal carrello
    response.sendRedirect("../CartShopping.jsp");//ritorna alla pagina del carrello
    }
%>