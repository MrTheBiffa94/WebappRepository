<%@ page import="CONTROLLER.DAO.MySQLProductDAO" %>
<%@ page import="MODEL.ProductModel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!--Includo NavbarIN dove è contenuto tutto il codice jsp per la navbar-->
    <jsp:include page="NavbarIN.jsp"></jsp:include>
    <title>HomePage</title>
</head>
<body>

<!-- Carousel -->
<div class="carousel slide" data-ride="carousel" id="carousel" >
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li class="active" data-slide-to="0" data-target="#carousel"></li>
        <li  data-slide-to="1" data-target="#carousel"></li>
        <li data-slide-to="2" data-target="#carousel"></li>
        <li data-slide-to="3" data-target="#carousel"></li>
        <li data-slide-to="4" data-target="#carousel"></li>
        <li data-slide-to="5" data-target="#carousel"></li>
        <li data-slide-to="6" data-target="#carousel"></li>

    </ol>

    <div class="carousel-inner" role="listbox">
        <%
            MySQLProductDAO p = new MySQLProductDAO();
            List<ProductModel> carousel = p.getCarouselItems();
            boolean isFirst = true;
            for (ProductModel x : carousel) {
                if (x.getImageUrl().equals("NA")) {
                    if (isFirst) {
                        isFirst = false;
        %>
            <div class="carousel-item active" style="background-image: url(image/NotAvailable.png)"></div>

    <%
    } else {%>
            <div class="carousel-item " href="Products.jsp" style="background-image: url(image/NotAvailable.png)"></div>
    <%
                }
            }
        }
    %>
    </div>


<!-- Controls -->
<a class="carousel-control-prev" data-slide="prev" href="#carousel" role="button">
    <span aria-hidden="true" class="carousel-control-prev-icon"></span>
    <span class="sr-only">Previous</span>
</a>
<a class="carousel-control-next" data-slide="next" href="#carousel" role="button">
    <span aria-hidden="true" class="carousel-control-next-icon"></span>
    <span class="sr-only">Next</span>
</a>

</div>

<jsp:include page="FooterIN.jsp"></jsp:include>

</body>
</html>