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
    <link rel="stylesheet" href="ProductDetailsPage.css">
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
                        <br><br><br><br>
                        <div class="row">
                            <div class="medium-6 columns">
                                <img class="thumbnail" src="./assets/pictures//650x350">
                                <div class="row small-up-4">
                                    <div class="column">
                                        <img class="thumbnail" src="./assets/pictures//250x200">
                                    </div>
                                    <div class="column">
                                        <img class="thumbnail" src="./assets/pictures//250x200">
                                    </div>
                                    <div class="column">
                                        <img class="thumbnail" src="./assets/pictures//250x200">
                                    </div>
                                    <div class="column">
                                        <img class="thumbnail" src="./assets/pictures//250x200">
                                    </div>
                                </div>
                            </div>
                            <div class="medium-6 large-5 columns">
                                <h4>Vans Old Skool</h4>
                                <p>Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor.</p>
                                <form id="addToCart" method="post" action="addToCart">
                                    <label>Size
                                        <select name="size">
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                    </label>
                                    <label>Color
                                        <select name="color">
                                            <option value="red">Red</option>
                                            <option value="blue">Blue</option>
                                            <option value="green">Green</option>
                                        </select>
                                    </label>
                                    <div class="row">
                                        <div class="medium-5 columns">
                                            <h3>
                                                Price: 60$
                                            </h3>
                                        </div>
                                        <div class="medium-6 columns">
                                        <input id="addToCartBtn" class="button large expanded" type="submit" value="Add To Cart">
                                        </div>
                                    </div>
                                    <!-- <a href="http://foundation.zurb.com/templates-previews-sites-f6/product-page.html#" class="button large expanded">Add To Cart</a> -->
                                </form>
                                <div class="small secondary expanded button-group">

                                </div>
                            </div>
                        </div>
                        <div class="column row">
                            <hr>
                            <div class="tabs-content" data-tabs-content="example-tabs">
                                <div class="tabs-panel is-active" id="panel1" aria-hidden="false">
                                    <h4>Reviews</h4>
                                    <div class="media-object stack-for-small">
                                        <div class="media-object-section">
                                            <img class="thumbnail" src="./assets/pictures//200x200">
                                        </div>
                                        <div class="media-object-section">
                                            <h5>Mike Stevenson</h5>
                                            <p>I'm going to improvise. Listen, there's something you should know about me... about inception. An idea is like a virus, resilient, highly contagious. The smallest seed of an idea can grow. It can grow to define or destroy you.</p>
                                        </div>
                                    </div>
                                    <div class="media-object stack-for-small">
                                        <div class="media-object-section">
                                            <img class="thumbnail" src="./assets/pictures//200x200">
                                        </div>
                                        <div class="media-object-section">
                                            <h5>Mike Stevenson</h5>
                                            <p>I'm going to improvise. Listen, there's something you should know about me... about inception. An idea is like a virus, resilient, highly contagious. The smallest seed of an idea can grow. It can grow to define or destroy you</p>
                                        </div>
                                    </div>
                                    <div class="media-object stack-for-small">
                                        <div class="media-object-section">
                                            <img class="thumbnail" src="./assets/pictures//200x200">
                                        </div>
                                        <div class="media-object-section">
                                            <h5>Mike Stevenson</h5>
                                            <p>I'm going to improvise. Listen, there's something you should know about me... about inception. An idea is like a virus, resilient, highly contagious. The smallest seed of an idea can grow. It can grow to define or destroy you</p>
                                        </div>
                                    </div>
                                    <label>
                                        My Review
                                        <textarea placeholder="None"></textarea>
                                    </label>
                                    <button class="button">Submit Review</button>
                                </div>
                            </div>
                        </div>

                        <!-- Image -->
                        <div id="contentimg">

                        </div>

                    </div>
                </div><!-- /content -->

            </div> <!-- /container-fluid BODY -->
        </div>
        </body>
        </html>
