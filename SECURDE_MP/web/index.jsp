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
                
//                $('#signupBtn').on('click', function(){
//                    if($('#signupBtn').val() == "Sign Up")
//                    {
//                        window.location.href = "SignUpPage.jsp";
//                    }
//                    else if($('#signupBtn').val() == "Log Out")
//                    {
//                        
//                    }
//                });
//                
//                $('#loginBtn').on('click', function(){
//                    window.location.href = "LogInPage.jsp";
//                });
                
//                $('#adminBtn').on('click', function(){
//                    window.location.href = "AdminPage.jsp";
//                });
//                
//                $('#productmanagerBtn').on('click', function(){
//                    window.location.href = "ProductManagerPage.jsp";
//                });
//                
//                $('#accountingmanagerBtn').on('click', function(){
//                    window.location.href = "AccountingManagerPage.jsp";
//                });
//                
//                $('#userdetailsBtn').on('click', function(){
//                    window.location.href = "UserDetailsPage.jsp";
//                });
                
//                $('#productBtn').on('click', function(){
//                    window.location.href = "ProductDetailsPage.jsp";
//                });
                
//                $('#productListBtn').on('click', function(){
//                    window.location.href = "ProductListPage.jsp";
//                });
                
//                $('#shoppingCartBtn').on('click', function(){
//                    window.location.href = "ShoppingCartPage.jsp";
//                });
//            });
        </script>
    </head>
    <body>
        <%
            String user = null;
//            if(session.getAttribute("user") == null){
//                response.sendRedirect("index.jsp");
//            }
            if(session.getAttribute("user") != null){
                user = session.getAttribute("user").toString();
            }
            
            String userName = "Sign In";
            String logoutName = "Sign Up";
            String sessionID = null;
            
            Cookie[] cookies = request.getCookies();
            if(cookies !=null){
                for(Cookie cookie : cookies){
                    if(cookie.getName().equals("user"))
                    {
                        userName = cookie.getValue();
                        logoutName = "Sign Out";
                    }
                    if(cookie.getName().equals("JSESSIONID"))
                    {
                        sessionID = cookie.getValue();
                    }
                }
            }
//            if(userName == null)
//            {
//                response.sendRedirect("index.jsp");
//            }
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
                            <button type="submit" class="btn btn-default navbar-btn" id="submitsearchBtn" name="submitsearchBtn">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                        </form>

                        <!-- Sign In and Sign Up buttons -->
                        <form action="GeneralIndexServlet" method="post">
                            <div class="btn-group navbar-form navbar-right" role="group" aria-label="...">
                                <!--<input type="button" class="btn btn-default navbar-btn" id="productBtn" name="productBtn" value="Product Details Page"/>-->
                                <input type="submit" class="btn btn-default navbar-btn" id="productListBtn" name="productListBtn" value="Product List Page"/>
                                <!--<input type="button" class="btn btn-default navbar-btn" id="shoppingCartBtn" name="shoppingCartBtn" value="Shopping Cart Page"/>-->
                                <input type="submit" class="btn btn-default navbar-btn" id="adminBtn" name="adminBtn" value="Admin Page"/>
                                <input type="submit" class="btn btn-default navbar-btn" id="productmanagerBtn" name="productmanagerBtn" value="Product Manager Page"/>
                                <input type="submit" class="btn btn-default navbar-btn" id="accountingmanagerBtn" name="accountingmanagerBtn" value="Accounting Manager Page"/>
                                <!--<input type="submit" class="btn btn-default navbar-btn" id="userdetailsBtn" name="userdetailsBtn" value="User Details Page"/>-->
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
