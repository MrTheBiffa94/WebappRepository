<%@ page import="CONTROLLER.DAO.MySQLProductDAO" %>
<%@ page import="MODEL.ProductModel" %>
<%@ page import="MODEL.CartModel" %>
<%@ page import="CONTROLLER.DAO.MySQLCartDAO" %>
<%
    if (session.getAttribute("sessionID") == null) {
        response.sendRedirect("../LoginError.jsp");
    } else {

        //prendo i parametri principali dalla form della jsp
        String UserCode = (String) session.getAttribute("sessionID");
        String selectedQuantity = request.getParameter("quantity");
        System.out.println(selectedQuantity);
        int SelectedQuantity = Integer.parseInt(selectedQuantity);
        String ProductCode = request.getParameter("productCode");
        MySQLProductDAO mpd = new MySQLProductDAO();
        ProductModel pm = mpd.getProductById(ProductCode);
        if(SelectedQuantity > pm.getQuantity()){
            //error page
        }else{
            CartModel cm1 = new CartModel(ProductCode,SelectedQuantity,UserCode);
            MySQLCartDAO muc = new MySQLCartDAO();
            CartModel cm2 = muc.getCartItemByIds(ProductCode,UserCode);
            if(cm2 == null){
                muc.insertInCart(cm1);
            }else {
                if (cm1.equals(cm2)) {
                    if(SelectedQuantity<=10 && SelectedQuantity > 0 ){
                        muc.updateQuantity(ProductCode,UserCode,SelectedQuantity);
                    }else{
                        // errore quantità totale maggiore di 10;
                        muc.updateQuantity(cm1.getProductCode(),cm1.getUserCode(),10);
                    }
                }
            }
        }


        //eseguo la connessione e passo i parametri al metodo
        response.sendRedirect("../CartShopping.jsp");//torno alla pagina dei prodotti
    }
%>
