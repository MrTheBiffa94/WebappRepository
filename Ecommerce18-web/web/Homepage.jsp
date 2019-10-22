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
    </ol>

    <div class="carousel-inner" role="listbox">
        <div class="carousel-item active" style="background-image: url(image/7.jpg)"></div>
        <div class="carousel-item " style="background-image: url(image/project_tns-1920x1080.jpg)"></div>

        <div class="carousel-item" style="background-image: url(image/a6.jpg)"></div>
        <div class="carousel-item "style="background-image: url(image/image.webp)"></div>

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
<section class="w3-about text-center" style="margin-bottom: 70px; margin-top: 70px;">
    <div class="container">
        <h3 class="w3l-title">Sviluppiamo</h3>
        <p class="para">
            Ec 18 e' un sistema sviluppato nel 2019
        </p>
        <p class="para">
            E' un sito di e-commerce nel quale si trovano prodotti di vario genere. Dai un'occhiata ai nostri prodotti
        </p>
        <p class="para">
            sfoglia tra le categorie.
        </p>
    </div>
</section>

<jsp:include page="FooterIN.jsp"></jsp:include>

</body>
</html>