<%@ page import="CONTROLLER.DAO.MySQLCartDAO" %>
<%@ page import="MODEL.CartModel" %>
<%@ page import="MODEL.ProductModel" %>
<%@ page import="CONTROLLER.DAO.MySQLProductDAO" %>

<%
    if (session.getAttribute("sessionID") == null) {
        response.sendRedirect("../Error.jsp");
    } else {

        //prendo i parametri principali dalla form della jsp
        String UserCode = (String) session.getAttribute("sessionID");
        String selectedQuantity = request.getParameter("quantity");
        int SelectedQuantity = Integer.parseInt(selectedQuantity);
        String ProductCode = request.getParameter("productCode");
        MySQLProductDAO mpd = new MySQLProductDAO();
        ProductModel pm = mpd.getProductById(ProductCode);
        if(SelectedQuantity > pm.getQuantity()){
                //
        }else{
            CartModel cm1 = new CartModel(ProductCode,SelectedQuantity,UserCode);
            MySQLCartDAO muc = new MySQLCartDAO();
            CartModel cm2 = muc.getCartItemByIds(ProductCode,UserCode);
            if(cm2 == null){
                muc.insertInCart(cm1);
            }else {
                if (cm1.equals(cm2)) {
                    int totQuantity = SelectedQuantity + cm2.getSelectedQuantity();
                    if(totQuantity<=10){
                        muc.updateQuantity(ProductCode,UserCode,totQuantity);
                    }else{
                        // errore quantità totale maggiore di 10;
                        muc.updateQuantity(cm1.getProductCode(),cm1.getUserCode(),10);
                    }
                }
            }
        }


        //eseguo la connessione e passo i parametri al metodo
        response.sendRedirect("../Products.jsp");//torno alla pagina dei prodotti
    }
%>