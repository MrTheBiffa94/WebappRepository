<%@ page import="CONTROLLER.MailSenderController" %>
<%@ page import="CONTROLLER.PdfController" %>
<%@ page import="MODEL.CartModel" %>
<%@ page import="java.util.List" %>
<%@ page import="CONTROLLER.DAO.MySQLProductDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="MODEL.ProductModel" %>
<%@ page import="CONTROLLER.DAO.MySQLCartDAO" %>
<%@ page import="CONTROLLER.CartController" %>
<%@ page import="CONTROLLER.DAO.MySQLUserDAO" %>
<%@ page import="MODEL.UserModel" %>
<%@ page import="CONTROLLER.DAO.MySQLPurchaseDAO" %>


<%
    if (session.getAttribute("sessionID") == null){
        //...
    } else {

        String email = request.getParameter("Email");
        String nome = request.getParameter("firstname");
        String cognome = request.getParameter("lastname");
        String indirizzo = request.getParameter("indirizzo");

        MySQLCartDAO mcd = new MySQLCartDAO();
        List<CartModel> cm = mcd.getCart((String) session.getAttribute("sessionID"));
        MySQLProductDAO pd = new MySQLProductDAO();
        List<CartModel> vcm = new ArrayList<>();
        CartController cc = new CartController();
        for (CartModel x : cm) {
            ProductModel pm = pd.getProductById(x.getProductCode());
            vcm.add(new CartModel(x.getUserCode(), x.getSelectedQuantity(), x.getProductCode(), pm));
        }
        PdfController pdf = new PdfController();
        pdf.crea(nome, cognome, email,indirizzo,vcm,cc.getTotal(cm));


        MailSenderController msc = new MailSenderController(); // IMPOSTO MAIL

        msc.sendInvoice(email, "Here is your invoice:", PdfController.getFILE());


        MySQLProductDAO mySQLProductDAO = new MySQLProductDAO();
        MySQLPurchaseDAO mySQLPurchaseDAO = new MySQLPurchaseDAO();
        mySQLPurchaseDAO.insertPurchases((String) session.getAttribute("sessionID"),cm);
        mySQLProductDAO.updateProductQuantity(cm);
        mcd.deleteCart((String) session.getAttribute("sessionID"));

        response.sendRedirect("../Homepage.jsp");
    }
%>


