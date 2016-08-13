<<<<<<< HEAD
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
                <br><br>
                <div class="row column text-center">
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
                <hr>
                <div class="row column text-center">
                    <h2>Some Other Neat Products</h2>
                    <hr>
                </div>
                <div class="row small-up-2 medium-up-3 large-up-6">
                    <div class="column">
                        <img class="thumbnail" src="./assets/pictures/300x400">
                        <h5>Nulla At Nulla Justo, Eget</h5>
                        <p>$400</p>
                        <a href="ProductDetailsPage.jsp" class="button small expanded hollow">Buy</a>
                    </div>
                    <div class="column">
                        <img class="thumbnail" src="./assets/pictures/300x400">
                        <h5>Nulla At Nulla Justo, Eget</h5>
                        <p>$400</p>
                        <a href="ProductDetailsPage.jsp" class="button small expanded hollow">Buy</a>
                    </div>
                    <div class="column">
                        <img class="thumbnail" src="./assets/pictures/300x400">
                        <h5>Nulla At Nulla Justo, Eget</h5>
                        <p>$400</p>
                        <a href="ProductDetailsPage.jsp" class="button small expanded hollow">Buy</a>
                    </div>
                    <div class="column">
                        <img class="thumbnail" src="./assets/pictures/300x400">
                        <h5>Nulla At Nulla Justo, Eget</h5>
                        <p>$400</p>
                        <a href="ProductDetailsPage.jsp" class="button small expanded hollow">Buy</a>
                    </div>
                    <div class="column">
                        <img class="thumbnail" src="./assets/pictures/300x400">
                        <h5>Nulla At Nulla Justo, Eget</h5>
                        <p>$400</p>
                        <a href="ProductDetailsPage.jsp" class="button small expanded hollow">Buy</a>
                    </div>
                    <div class="column">
                        <img class="thumbnail" src="./assets/pictures/300x400">
                        <h5>Nulla At Nulla Justo, Eget</h5>
                        <p>$400</p>
                        <a href="ProductDetailsPage.jsp" class="button small expanded hollow">Buy</a>
                    </div>
                </div>
            </div>
        </div><!-- /content -->

    </div> <!-- /container-fluid BODY -->
</body>
=======
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
                <br><br>
                <div class="row column text-center">
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
                <hr>
                <div class="row column text-center">
                    <h2>Some Other Neat Products</h2>
                    <hr>
                </div>
                <div class="row small-up-2 medium-up-3 large-up-6">
                    <div class="column">
                        <img class="thumbnail" src="./assets/pictures/300x400">
                        <h5>Nulla At Nulla Justo, Eget</h5>
                        <p>$400</p>
                        <a href="ProductDetailsPage.jsp" class="button small expanded hollow">Buy</a>
                    </div>
                    <div class="column">
                        <img class="thumbnail" src="./assets/pictures/300x400">
                        <h5>Nulla At Nulla Justo, Eget</h5>
                        <p>$400</p>
                        <a href="ProductDetailsPage.jsp" class="button small expanded hollow">Buy</a>
                    </div>
                    <div class="column">
                        <img class="thumbnail" src="./assets/pictures/300x400">
                        <h5>Nulla At Nulla Justo, Eget</h5>
                        <p>$400</p>
                        <a href="ProductDetailsPage.jsp" class="button small expanded hollow">Buy</a>
                    </div>
                    <div class="column">
                        <img class="thumbnail" src="./assets/pictures/300x400">
                        <h5>Nulla At Nulla Justo, Eget</h5>
                        <p>$400</p>
                        <a href="ProductDetailsPage.jsp" class="button small expanded hollow">Buy</a>
                    </div>
                    <div class="column">
                        <img class="thumbnail" src="./assets/pictures/300x400">
                        <h5>Nulla At Nulla Justo, Eget</h5>
                        <p>$400</p>
                        <a href="ProductDetailsPage.jsp" class="button small expanded hollow">Buy</a>
                    </div>
                    <div class="column">
                        <img class="thumbnail" src="./assets/pictures/300x400">
                        <h5>Nulla At Nulla Justo, Eget</h5>
                        <p>$400</p>
                        <a href="ProductDetailsPage.jsp" class="button small expanded hollow">Buy</a>
                    </div>
                </div>
            </div>
        </div><!-- /content -->

    </div> <!-- /container-fluid BODY -->
</body>
>>>>>>> origin/servlets2
</html>