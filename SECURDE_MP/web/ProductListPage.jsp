<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Bootstrap stuff -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <!-- Link to CSS file -->
    <link rel="stylesheet" href="ProductListPage.css">
    <link rel="stylesheet" href="foundation.min.css">

    <title>Talaria Footwear Company</title>

    <!-- Script for functions -->
    <script>
        $(document).ready(function(){

            $('#goHome').on('click', function(){
                window.location.href = "index.jsp";
            });

            $('#signupBtn').on('click', function(){
                window.location.href = "SignUpPage.jsp";
            });

            $('#loginBtn').on('click', function(){
                window.location.href = "LogInPage.jsp";
            });
            
            // For the Search bar part
            $('.dropdown-menu').on('click', function(event) {
                event.stopPropagation();
            });
            
            $('.selectpicker').selectpicker({
                container: 'body'
            });
            
            $('body').on('click', function(event) {
                var target = $(event.target);
                if (target.parents('.bootstrap-select').length) {
                    event.stopPropagation();
                    $('.bootstrap-select.open').removeClass('open');
                }
            });	
            
            $(document).on('click', '.buyMe',function(){
                    // get id of the button clicked
                    var id = $('#prodID').val();
                    // set the value of hidden input
                    $('#idfield').val(id);
                    // submit the form
                    $('#viewproductform').submit();
                });
        });
    </script>
</head>
<body>
    <%
            //if(session.getAttribute("user") == null){
            //    response.sendRedirect("index.jsp");
            //}
            String userName = "Sign In";
            String logoutName = "Sign Up";
            
            Cookie[] cookies = request.getCookies();
            if(cookies !=null){
                for(Cookie cookie : cookies){
                    if(cookie.getName().equals("user"))
                    {
                        userName = cookie.getValue();
                        logoutName = "Sign Out";
                    }
                }
            }
        %>

    <div class="container-fluid">

        <!-- The HEADER and the buttons/links in it -->
        <nav class="navbar navbar-default navbar-fixed-top" id="topheader">
            <div class="container-fluid">
                <div class="navbar-header">

                    <!-- Brand (aka the app name) -->
                    <a class="navbar-brand" href="#" id="goHome" name="goHome"> 
                        Talaria Footwear
                    </a>

                    <!-- Search Bar -->
                    <form class="navbar-form navbar-left form-horizontal" role="search" action="ProductListServlet" method="post">
                        <div class="input-group" id="adv-search">
                            <input type="text" class="form-control" name="searchproductInput" id="searchproductInput" placeholder="Search for Product Name" />
                            <div class="input-group-btn">
                                <div class="btn-group" role="group">
                                    <div class="dropdown dropdown-lg">
                                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
                                        <div class="dropdown-menu dropdown-menu-right" role="menu">
                                            <!--<fieldset>-->
                                            <!--<form class="form-horizontal" role="form">-->
                                            <div class="col-md-6 form-group">
                                                <label for="price">Filter Price By</label>
                                                <select class="selectpicker form-control" name="pricefilterSearch" id="pricefilterSearch">
                                                    <option value="Equal to" selected>Equal To</option>
                                                    <option value="Not equal to">Not Equal To</option>
                                                    <option value="Greater than or equal to">Greater Than or Equal To</option>
                                                    <option value="Greater than">Greater Than</option>
                                                    <option value="Less than or equal to">Less Than or Equal To</option>
                                                    <option value="Less than">Less Than</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <label for="price">Price</label>
                                                <input class="col-md-6 form-control" type="text" placeholder="Price" name="priceSearch" id="priceSearch"/>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <label for="category">Category</label>
                                                <select class="selectpicker form-control" name="categorySearch" id="categorySearch">
                                                    <option value="-" selected>-</option>
                                                    <option value="Boots" >Boots</option>
                                                    <option value="Shoes">Shoes</option>
                                                    <option value="Sandals">Sandals</option>
                                                    <option value="Slippers">Slippers</option>
                                                </select>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <label for="orderby">Order by</label>
                                                <select class="selectpicker form-control" name="orderbySearch" id="orderbySearch">
                                                    <option value="Ascending" selected>Ascending</option>
                                                    <option value="Descending">Descending</option>
                                                </select>
                                            </div>
                                            <!--</fieldset>-->
                                                <!--<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>-->
                                            <!--</form>-->
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary" name="submitSearch" id="submitSearch"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                </div>
                            </div>
                        </div>
                    </form>

                    <!-- Sign In and Sign Up buttons -->
                    <!--<div class="btn-group navbar-form navbar-right" role="group" aria-label="...">-->
                 <!--        <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Salman khan <span class="glyphicon glyphicon-user pull-right"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Account Settings <span class="glyphicon glyphicon-cog pull-right"></span></a></li>
                                <li class="divider"></li>
                                <li><a href="#">User stats <span class="glyphicon glyphicon-stats pull-right"></span></a></li>
                                <li class="divider"></li>
                                <li><a href="#">Messages <span class="badge pull-right"> 42 </span></a></li>
                                <li class="divider"></li>
                                <li><a href="#">Favourites Snippets <span class="glyphicon glyphicon-heart pull-right"></span></a></li>
                                <li class="divider"></li>
                                <li><a href="#">Sign Out <span class="glyphicon glyphicon-log-out pull-right"></span></a></li>
                            </ul>
                        </li>
                    </ul> -->
<!--                        <button type="button" class="btn btn-default navbar-btn" id="loginBtn" name="loginBtn">Sign In</button>
                        <button type="button" class="btn btn-default navbar-btn" id="signupBtn" name="signupBtn">Sign Up</button>
                    </div>-->
                    <form action="GeneralIndexServlet" method="post">
                        <div class="btn-group navbar-form navbar-right" role="group" aria-label="...">
                            <input type="submit" class="btn btn-default navbar-btn" id="loginBtn" name="loginBtn" value="<%=userName%>"/>
                            <input type="submit" class="btn btn-default navbar-btn" id="signupBtn" name="signupBtn" value="<%=logoutName%>"/>
                        </div>
                    </form>
                </div>
            </div> <!-- /container-fluid -->
        </nav> <!-- /navbar top header -->

        <!-- CONTENT -->
        <div id="contentProduct">
            <div class="container-fluid">

                <!-- Text -->
                <div id="contenttext">
                    <br><br>
<!--                    <div class="row column text-center">
                        <h2>Our Newest Products</h2>
                        <hr>
                    </div>
                    <div class="row small-up-2 large-up-4">
                        <div class="column">
                            <img class="thumbnail" src="./assets/pictures/300x400">
                            <h5>Nulla At Nulla Justo, Eget</h5>
                            <p>$400</p>
                            <a href="ProductDetailsPage.jsp" class="button expanded">Buy</a>
                        </div>
                        <div class="column">
                            <img class="thumbnail" src="./assets/pictures/300x400">
                            <h5>Nulla At Nulla Justo, Eget</h5>
                            <p>$400</p>
                            <a href="ProductDetailsPage.jsp" class="button expanded">Buy</a>
                        </div>
                        <div class="column">
                            <img class="thumbnail" src="./assets/pictures/300x400">
                            <h5>Nulla At Nulla Justo, Eget</h5>
                            <p>$400</p>
                            <a href="ProductDetailsPage.jsp" class="button expanded">Buy</a>
                        </div>
                        <div class="column">
                            <img class="thumbnail" src="./assets/pictures/300x400">
                            <h5>Nulla At Nulla Justo, Eget</h5>
                            <p>$400</p>
                            <a href="ProductDetailsPage.jsp" class="button expanded">Buy</a>
                        </div>
                    </div>
                    <hr>-->
                    <div class="row column text-center">
                        <h2>Our Newest Products</h2>
                        <hr>
                    </div>
                    <div class="row small-up-2 medium-up-3 large-up-6">
<!--                        <div class="column">
                            <img class="thumbnail" src="./assets/pictures/300x400">
                            <h5>Nulla At Nulla Justo, Eget</h5>
                            <p>$400</p>
                            <a href="ProductDetailsPage.jsp" class="button small expanded hollow">Buy</a>
                        </div>-->
                        <c:forEach items="${products}" var="product">
                            <div class="column">
                                <form id="viewproductform" action="ViewProductServlet" method="post">
                                <img class="thumbnail" src="./assets/pictures/300x400">
                                <h5>${product.name}</h5>
                                <p>$${product.price}</p>
                                <input type="hidden" name="prodID" id="prodID" value="${product.productId}">
                                <button type="submit" id="buyMeBtn" name="buyMeBtn" class="button small expanded hollow buyMe">Buy</button>
                                </form>
                            </div>
                        </c:forEach>
<!--                        <form id="viewproductform" action="ViewProductServlet" method="post">
			<input type=hidden id="idfield" name="id"/>
			</form>-->
                    </div>
                    
                </div>
            </div><!-- /content -->

        </div> <!-- /container-fluid BODY -->
    </div>
</body>
</html>