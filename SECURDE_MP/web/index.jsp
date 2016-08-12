<%-- 
    Document   : index
    Created on : 24-Jul-2016, 23:02:13
    Author     : hannah
--%>

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
        <link rel="stylesheet" href="HomePage.css">
        
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
                
                $('#adminBtn').on('click', function(){
                    window.location.href = "AdminPage.jsp";
                });
                
                $('#productmanagerBtn').on('click', function(){
                    window.location.href = "ProductManagerPage.jsp";
                });
                
                $('#accountingmanagerBtn').on('click', function(){
                    window.location.href = "AccountingManagerPage.jsp";
                });
                
                $('#productBtn').on('click', function(){
                    window.location.href = "ProductDetailsPage.jsp";
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
                            <button type="button" class="btn btn-default navbar-btn" id="productBtn" name="productBtn">Product Details Page</button>
                            <button type="button" class="btn btn-default navbar-btn" id="adminBtn" name="adminBtn">Admin Page</button>
                            <button type="button" class="btn btn-default navbar-btn" id="productmanagerBtn" name="productmanagerBtn">Product Manager Page</button>
                            
                            <button type="button" class="btn btn-default navbar-btn" id="accountingmanagerBtn" name="accountingmanagerBtn">Accounting Manager Page</button>
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
                        <h1>
                            How to put the products here? D:
                        </h1>
                    </div>
                    
                    <!-- Image -->
                    <div id="contentimg">
                        
                    </div>
                    
                </div>
            </div><!-- /content -->
            
        </div> <!-- /container-fluid BODY -->
    </body>
</html>
