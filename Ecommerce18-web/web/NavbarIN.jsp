<%@ page import="CONTROLLER.DAO.MySQLCartDAO" %>
<%@ page import="CONTROLLER.DAO.MySQLCategoryDAO" %>
<%@ page import="MODEL.CategoryModel" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/mycss/NavBarHome.css">
    <link rel="stylesheet" href="css/mycss/RegPay.css">
    <link rel="stylesheet" href="css/mycss/PageError.css">
</head>
<body>

<!-- Navbar -->
<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">

    <div class="navbar-header">
        <button aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"
                class="navbar-toggler"
                data-target="#navbarSupportedContent" data-toggle="collapse" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="Homepage.jsp">EC-18</a>
    </div>


    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/Progetto2_war_exploded/Homepage.jsp" style="color: white"><i
                        aria-hidden="true" class="fa fa-home"></i>Home<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Products.jsp"><i class="fa fa-shopping-bag"
                                                           aria-hidden="true"></i>Articoli</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" data-target="#helpModal" data-toggle="modal"><i aria-hidden="true"
                                                                                             class="fa fa-question-circle"></i>Help</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#" data-target="#aboutModel" data-toggle="modal"><i aria-hidden="true"
                                                                                              class="fa fa-info-circle"></i>About
                    us</a>
            </li>
        </ul>
        <form action="SearchController.jsp" method="post" class="form-inline ">
            <div class="input-group">
                <input aria-label="Search" name="search" class="form-control mr-sm-2" placeholder="Search"
                       type="search">
                <select class="custom-select mr-sm-2" name="categoria">
                    <%
                        MySQLCategoryDAO mcc = new MySQLCategoryDAO();
                        List<CategoryModel> allCatt = mcc.allCategories();
                    %>
                    <option selected value="">Scegli Categoria</option>
                    <%
                        for (CategoryModel x : allCatt) {
                            String cat = x.getName();%>
                    <option value="<%=cat%>"><%=cat%>
                    </option>
                    <%
                        }
                    %>
                </select>
                <button class=" btn btn-outline-success my-2 my-sm-0" type="submit"><i aria-hidden="true"
                                                                                       class="fa fa-search"></i>
                </button>
            </div>
        </form>

        <!-- Pulsante user con apertura login -->
        <form class="form-inline">
            <div class="user container">
                <% if (session.getAttribute("sessionID") == null) { %>
                <button class="btn btn-success" data-target="#loginModal" data-toggle="modal" type="button"><i
                        aria-hidden="true" class="fa fa-user-o"></i></button>
                <% } else { %>
                <button class="btn btn-success" data-target="#logout" data-toggle="modal" type="button"><i
                        aria-hidden="true" class="fa fa-user-circle-o"></i></button>
                <% } %>

            </div>
        </form>

        <!-- Pulsante user con apertura Cart -->
        <form class="form-inline my-2 my-lg-0">
            <div class="cart container">
                <% if (session.getAttribute("sessionID") == null) { %>
                <a class="btn btn-success" href="CartShopping.jsp"><i aria-hidden="true"
                                                                      class="fa fa-shopping-cart"></i></a>
                <% } else { %>
                <a class="btn btn-success" href="CartShopping.jsp"><i aria-hidden="true"
                                                                      class="fa fa-shopping-cart"></i>
                    <%
                        MySQLCartDAO mcd = new MySQLCartDAO();
                        int cm = mcd.countCart((String) session.getAttribute("sessionID"));
                    %>
                </a><span class="badge badge-pill badge-primary" style="background-color: #3498db"><%=cm%></span>
                <% } %>
            </div>
        </form>
    </div>

</nav>


<!-- modal Login -->
<div class="modal fade" id="loginModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- header -->
            <div class="modal-header">
                <h1 class="modal-title">Login</h1>
            </div>
            <!-- body -->
            <div class="modal-header">
                <form action="ControllerView/LoginController.jsp" method="post" data-toggle="validator">
                    <div aria-required="true" class="form-group">
                        <label>Email:</label>
                        <input class="form-control" name="Email" id="email" placeholder="Email" type="text" required>
                        <label>Password:</label>
                        <input class="form-control" name="Password" id="pwd" placeholder="Password" type="password"
                               required>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary">Log In</button>
                        <button class="btn btn-default" data-dismiss="modal" type="button">Cancel</button>
                    </div>
                </form>
            </div>
            <!-- footer -->


            <div class="login-help">
                <a href="Registration.jsp"
                   onclick="$('#loginModal').modal('hide')">Register</a> / <a href="ResetPassword.jsp">Forgot
                Password?</a>
            </div>

        </div>
    </div>
</div>

<!-- modal Logout-->
<div class="modal fade" id="logout">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- header -->
            <div class="modal-header">
                <h1 class="modal-title">Logout</h1>
            </div>
            <!-- body -->
            <div class="modal-header">
                <form action="ControllerView/LogoutController.jsp" method="post" data-toggle="validator">
                    <div aria-required="true" class="form-group">
                        <label>Vuoi eseguire il logout?</label>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary">Si</button>
                        <button class="btn btn-default" data-dismiss="modal" type="button">No</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- modal Help -->

<div class="modal fade" id="helpModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- header -->
            <div class="modal-header">
                <h1 class="modal-title">Help</h1>
            </div>
            <!-- body -->
            <div class="modal-header">
                <form method="post" role="form">
                    <div aria-required="true" class="form-group">
                        <label>Qui verra inserito il testo di Help</label>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<!-- modal About Us -->

<div class="modal fade" id="aboutModel">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- header -->
            <div class="modal-header">
                <h1 class="modal-title">About Us</h1>
            </div>
            <!-- body -->
            <div class="modal-header">
                <form method="post" role="form">
                    <div aria-required="true" class="form-group">
                        <label>Qui verra inserito il testo di About us</label>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>



<script src="js/myjs/new.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>


