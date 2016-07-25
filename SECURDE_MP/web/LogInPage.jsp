<%-- 
    Document   : LogInPage
    Created on : 24-Jul-2016, 23:02:39
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
        <link rel="stylesheet" href="LogInPage.css">
        
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
                        
                        <!-- Sign In and Sign Up buttons -->
                        <div class="btn-group navbar-form navbar-right" role="group" aria-label="...">
                            <button type="button" class="btn btn-default navbar-btn" id="loginBtn" name="loginBtn">Sign In</button>
                            <button type="button" class="btn btn-default navbar-btn" id="signupBtn" name="signupBtn">Sign Up</button>
                        </div>
                        
                        
                    </div>
                </div> <!-- /container-fluid -->
            </nav> <!-- /navbar top header -->
            
            <!-- CONTENT -->
            <!-- source: http://bootsnipp.com/snippets/featured/login-in-a-panel -->
            <div class="col-md-12">
                <div class="modal-dialog" style="margin-bottom:0">
                    <div class="modal-content">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Sign In</h3>
                                </div>
                                <div class="panel-body">
                                    <form role="form" id="loginForm" name="loginForm">
                                        <fieldset>
                                            <div class="form-group">
                                                <input class="form-control" placeholder="Username" name="usernameSignIn" id="usernameSignIn" type="text" autofocus="">
                                            </div>
                                            <div class="form-group">
                                                <input class="form-control" placeholder="Password" name="passwordSignIn" id="passwordSignIn" type="password" value="">
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input name="rememberCBoxSignIn" id="rememberCBoxSignIn" type="checkbox" value="Remember Me">Remember Me
                                                </label>
                                            </div>
                                            <!-- Change this to a button or input when using this as a form -->
<!--                                            <a href="javascript:;" class="btn btn-sm btn-success">Login</a>-->
                                            <input type="submit" class="btn btn-success" id="signinSubmit" name="signinSubmit" value="Sign In" />
                                            
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                </div>
            </div>
            <!-- /content -->
            
        </div> <!-- /container-fluid BODY -->
    </body>
</html>
