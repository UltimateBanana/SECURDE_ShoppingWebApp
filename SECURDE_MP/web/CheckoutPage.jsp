<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Bootstrap stuff -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <!-- Link to CSS file --><!-- 
    <link rel="stylesheet" href="ProductDetailsPage.css"> -->
    <link rel="stylesheet" href="CheckoutPage.css">

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
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                          <input type="text" class="form-control" id="searchInput" name="searchInput" placeholder="Search">
                      </div>
                      <button type="submit" class="btn default navbar-btn" id="submitsearchBtn" name="submitsearchBtn">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
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
<!--                    <button type="button" class="btn btn-default navbar-btn" id="loginBtn" name="loginBtn">Sign In</button>
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
    <div id="content">
        <div class="container-fluid">
            <div class="container wrapper">
                <div class="row cart-head">
                    <div class="container">
                        <div class="row">
                            <p></p>
                        </div>
                        <div class="row">
                            <p></p>
                        </div>
                    </div>
                </div>    
                <div class="row cart-body">
                    <!--<form class="form-horizontal" method="post" action="">-->
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
                            <!--REVIEW ORDER-->
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    Review Order <div class="pull-right"><small></div>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="col-sm-3 col-xs-3">
                                            <img class="img-responsive" src="./assets/pictures/100x70" />
                                        </div>
                                        <div class="col-sm-6 col-xs-6">
                                            <div class="col-xs-12">Vans Old Skool</div>
                                            <div class="col-xs-12"><small>Quantity:<span>1</span></small></div>
                                        </div>
                                        <div class="col-sm-3 col-xs-3 text-right">
                                            <h6><span>$</span>60.00</h6>
                                        </div>
                                    </div>
                                    <div class="form-group"><hr /></div>
                                    <div class="form-group">
                                        <div class="col-sm-3 col-xs-3">
                                            <img class="img-responsive" src="./assets/pictures/100x70" />
                                        </div>
                                        <div class="col-sm-6 col-xs-6">
                                            <div class="col-xs-12">Vans Old Skool</div>
                                            <div class="col-xs-12"><small>Quantity:<span>1</span></small></div>
                                        </div>
                                        <div class="col-sm-3 col-xs-3 text-right">
                                            <h6><span>$</span>60.00</h6>
                                        </div>
                                    </div>
                                    <div class="form-group"><hr /></div>       
                                    <c:forEach items="${cart}" var="product">
                                    <div class="form-group">
                                        <div class="col-sm-3 col-xs-3">
                                            <img class="img-responsive" src="./assets/pictures/100x70" />
                                        </div>
                                        <div class="col-sm-6 col-xs-6">
                                            <div class="col-xs-12">${product.name}</div>
                                            <div class="col-xs-12"><small>Quantity:<span>1</span></small></div>
                                        </div>
                                        <div class="col-sm-3 col-xs-3 text-right">
                                            <h6><span>$</span>${product.price}</h6>
                                        </div>
                                    </div>
                                    <div class="form-group"><hr /></div>
                                    </c:forEach>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <strong>Order Total</strong>
                                            <div class="pull-right"><span>$</span><span>${subtotal}</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--REVIEW ORDER END-->
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
                            <!--SHIPPING METHOD-->
                            <form id="checkout" method="post" action="FinalCheckoutServlet">
                                <!--CREDIT CART PAYMENT-->
                                <div class="panel panel-info">
                                    <div class="panel-heading"><span><i class="glyphicon glyphicon-lock"></i></span> Secure Payment</div>
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <div class="col-md-12"><strong>Credit Card Number:</strong></div>
                                            <div class="col-md-12"><input type="text" class="form-control" name="cardNumber" value="" id="cardNumber"/></div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12"><strong>Card CVV:</strong></div>
                                            <div class="col-md-12"><input type="text" class="form-control" name="cardCode" value="" id="cardCode"/></div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <strong>Expiration Date</strong>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <select class="form-control" name="expirationMonth" id="expirationMonth">
                                                    <option value="">Month</option>
                                                    <option value="01">01</option>
                                                    <option value="02">02</option>
                                                    <option value="03">03</option>
                                                    <option value="04">04</option>
                                                    <option value="05">05</option>
                                                    <option value="06">06</option>
                                                    <option value="07">07</option>
                                                    <option value="08">08</option>
                                                    <option value="09">09</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                    <option value="12">12</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <select class="form-control" name="expirationYear" id="expirationYear">
                                                    <option value="">Year</option>
                                                    <option value="2016">2016</option>
                                                    <option value="2017">2017</option>
                                                    <option value="2018">2018</option>
                                                    <option value="2019">2019</option>
                                                    <option value="2020">2020</option>
                                                    <option value="2021">2021</option>
                                                    <option value="2022">2022</option>
                                                    <option value="2023">2023</option>
                                                    <option value="2024">2024</option>
                                                    <option value="2025">2025</option>
                                                    <option value="2026">2026</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-primary btn-submit-fix" value="Place Order" name="submitBtn">
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!--CREDIT CART PAYMENT END-->
                        </div>

                    <!--</form>-->
                </div>
                <div class="row cart-footer">

                </div>
            </div>
            <!-- Text -->
            <div id="contenttext">

            </div><!-- /content -->

        </div> <!-- /container-fluid BODY -->
    </div>
</body>
</html>
