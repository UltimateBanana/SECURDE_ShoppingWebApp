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
    <link rel="stylesheet" href="foundation.min.css">
    <link rel="stylesheet" href="bootstrap.min.css">
    <link rel="stylesheet" href="ShoppingCartPage.css">

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
                      <button type="submit" class="btn btn-default navbar-btn" id="submitsearchBtn" name="submitsearchBtn">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </form>

                <!-- Sign In and Sign Up buttons -->
                <div class="btn-group navbar-form navbar-right" role="group" aria-label="...">
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
                    <button type="button" class="btn btn-default navbar-btn" id="loginBtn" name="loginBtn">Sign In</button>
                    <button type="button" class="btn btn-default navbar-btn" id="signupBtn" name="signupBtn">Sign Up</button>
                </div>

            </div>
        </div> <!-- /container-fluid -->
    </nav> <!-- /navbar top header -->

    <!-- CONTENT -->
    <div id="content">
        <div class="container-fluid">

            <!-- Text -->
            <div id="contenttext">
                <section id="cart_items">
                    <h2>Your Shopping Cart</h2>
                    <div class="container">
                      <div class="table cart_info">
                        <table class="table table-condensed">
                            <thead>
                                <tr class="cart_menu">
                                    <td class="image">Item</td>
                                    <td class="description"></td>
                                    <td class="price">Price</td>
                                    <td class="quantity">Quantity</td>
                                    <td class="total">Total</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="cart_product">
                                        <a href="ProductDetailsPage.jsp"><img src="./assets/pictures/100x100" alt=""></a>
                                    </td>
                                    <td class="cart_description">
                                        <h4><a href="ProductDetailsPage.jsp">Vans Old Skool</a></h4>
                                        <p>Size 10</p>
                                    </td>
                                    <td class="cart_price">
                                        <p>60$</p>
                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">60$</p>
                                    </td>
                                    <td class="cart_delete">
                                        <a class="cart_quantity_delete" href="ProductDetailsPage.jsp"><i class="glyphicon glyphicon-remove"></i></a>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="cart_product">
                                        <a href="ProductDetailsPage.jsp"><img src="./assets/pictures/100x100" alt=""></a>
                                    </td>
                                    <td class="cart_description">
                                        <h4><a href="ProductDetailsPage.jsp">Vans Old Skool</a></h4>
                                        <p>Size 10</p>
                                    </td>
                                    <td class="cart_price">
                                        <p>60$</p>
                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">60$</p>
                                    </td>
                                    <td class="cart_delete">
                                        <a class="cart_quantity_delete" href="ProductDetailsPage.jsp"><i class="glyphicon glyphicon-remove"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cart_product">
                                        <a href="ProductDetailsPage.jsp"><img src="./assets/pictures/100x100" alt=""></a>
                                    </td>
                                    <td class="cart_description">
                                        <h4><a href="ProductDetailsPage.jsp">Vans Old Skool</a></h4>
                                        <p>Size 10</p>
                                    </td>
                                    <td class="cart_price">
                                        <p>60$</p>
                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">60$</p>
                                    </td>
                                    <td class="cart_delete">
                                        <a class="cart_quantity_delete" href="#"><i class="glyphicon glyphicon-remove"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section> <!--/#cart_items-->
            <section id="do_action">
                <div class="container">
                <div class="heading">
                <h3>Cart Total</h3>
                
            </div>
                            <div class="total_area">
                                <ul>
                                    <li>Cart Sub Total <span>180$</span></li>
                                    <li>Shipping Cost <span>20$</span></li>
                                    <li>Total <span>200$</span></li>
                                </ul>
                                <a class="btn btn-default check_out" href="CheckoutPage.jsp">Check Out</a>
                            </div>
                </div>
            </section><!--/#do_action-->
        </div><!-- /content -->

    </div> <!-- /container-fluid BODY -->
</div>
</body>
</html>
