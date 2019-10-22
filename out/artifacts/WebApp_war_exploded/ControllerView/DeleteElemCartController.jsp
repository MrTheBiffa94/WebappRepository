<%@ page import="CONTROLLER.DAO.MySQLCartDAO" %>
<%
    if (session.getAttribute("sessionID") == null) {
        //nel caso in cui non sei loggato si ritorna alla pagina di LoginError per eseguire il login
        response.sendRedirect("../LoginError.jsp");
    } else {

        String UserCode = (String) session.getAttribute("sessionID");//stringa che contiene usercode personale
        String ProductCode = request.getParameter("productCode");//stringa che contiene il productcode
        MySQLCartDAO cd = new MySQLCartDAO();
        cd.deleteProductOnTheCart(ProductCode, UserCode);//metodo che cancella il singolo prodotto dal carrello
        response.sendRedirect("../CartShopping.jsp");//ritorna la pagina del carrello
    }
%>