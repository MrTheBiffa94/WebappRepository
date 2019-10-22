<%@ page import="CONTROLLER.DAO.MySQLCategoryDAO" %>
<%@ page import="CONTROLLER.DAO.MySQLKeyWordDAO" %>

<%@page import="CONTROLLER.DAO.MySQLProductDAO" import="CONTROLLER.SearchController" %>
<%@ page import="MODEL.ProductModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>


<%
    //dalla richiesta estraggo username e password
    String src = request.getParameter("search");
    String category = request.getParameter("categoria");
    RequestDispatcher rd;

    MySQLKeyWordDAO mskd = new MySQLKeyWordDAO();
    MySQLProductDAO mspd = new MySQLProductDAO();
    MySQLCategoryDAO mscd = new MySQLCategoryDAO();
    List<ProductModel> products = new ArrayList<>();

    if (src.equals("")) {
        if (category.equals("")) {
            rd = request.getRequestDispatcher("ErrorSearch.jsp");
            rd.forward(request, response);
        } else {
            products = mspd.searchByCategory(mscd.getCategoryIdByName(category));
        }
    } else {
        SearchController sc = new SearchController(src);
        List<String> parole = sc.getKeyNames(sc.getQuery());
        List<String> codici = mskd.getKeyCodes(parole);


        if (category.equals("")) {
            products = mspd.searchByKeywords(codici);
        } else {
            products = mspd.searchByKeysAndCategory(codici, mscd.getCategoryIdByName(category));
        }


    }


    if (products.isEmpty()) {
        rd = request.getRequestDispatcher("ErrorSearch.jsp");
        rd.forward(request, response);
    } else {
        request.setAttribute("Prodotti", products);
        rd = request.getRequestDispatcher("SearchProduct.jsp");
        rd.forward(request, response);
    }
%>


