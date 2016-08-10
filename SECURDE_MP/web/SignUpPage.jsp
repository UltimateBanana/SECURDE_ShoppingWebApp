<%-- 
    Document   : SignUpPage
    Created on : 24-Jul-2016, 23:02:52
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
        <link rel="stylesheet" href="SignUpPage.css">
        
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
                            <h3 class="panel-title">Sign Up</h3>
                        </div>
                        <div class="panel-body">
                            <form role="form" id="signupForm" name="signupForm">
                                <fieldset>
                                    <!-- Name (First, Middle Initial, Last -->
                                    <div class="col-sm-4 form-group">
                                        <input class="form-control" placeholder="First Name" name="fnameSignUp" id="fnameSignUp" type="text" autofocus="">
                                    </div>
                                    <div class="col-sm-4 form-group">
                                        <input class="form-control" placeholder="Middle Initial" name="minitialSignUp" id="minitialSignUp" type="text" autofocus="">
                                    </div>
                                    <div class="col-sm-4 form-group">
                                        <input class="form-control" placeholder="Last Name" name="lnameSignUp" id="lnameSignUp" type="text" autofocus="">
                                    </div>

                                    <!-- Username, Password, and Email -->
                                    <div class="col-sm-6 form-group">
                                        <input class="form-control" placeholder="Username" name="usernameSignUp" id="usernameSignUp" type="text" autofocus="">
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <input class="form-control" placeholder="Password" name="passwordSignUp" id="passwordSignUp" type="password" value="">
                                    </div>
                                    <div class="col-sm-12 form-group">
                                        <input class="form-control" placeholder="E-mail" name="emailSignUp" id="emailSignUp" type="email" value="">
                                    </div>

                                    <!-- Billing Address and Shipping Address -->
                                    <div id="billingAddress">
                                        <label class="col-sm-12">Billing Address</label>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="House #" name="housenumBA" id="housenumBA" type="text" autofocus="">
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Street" name="streetBA" id="streetBA" type="text" autofocus="">
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Subdivision" name="subdivisionBA" id="subdivisionBA" type="text" autofocus="">
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="City" name="cityBA" id="cityBA" type="text" autofocus="">
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Postal Code" name="postalcodeBA" id="postalcodeBA" type="text" autofocus="">
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Country" name="countryBA" id="countryBA" type="text" autofocus="">
                                        </div>
                                    </div>

                                    <div id="billingAddress">
                                        <label class="col-sm-12">Shipping Address</label>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="House #" name="housenumSA" id="housenumSA" type="text" autofocus="">
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Street" name="streetSA" id="streetSA" type="text" autofocus="">
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Subdivision" name="subdivisionSA" id="subdivisionSA" type="text" autofocus="">
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="City" name="citySA" id="citySA" type="text" autofocus="">
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Postal Code" name="postalcodeSA" id="postalcodeSA" type="text" autofocus="">
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Country" name="countrySA" id="countrySA" type="text" autofocus="">
                                        </div>
                                    </div>

                                    <!-- Change this to a button or input when using this as a form -->
<!--                                            <a href="javascript:;" class="btn btn-sm btn-success">Login</a>-->
                                    <div class="col-sm-12 form-group">
                                        <input type="submit" class="btn btn-success" id="signupSubmit" name="signupSubmit" value="Sign Up" />
                                    </div>
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
