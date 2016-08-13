<%-- 
    Document   : AdminPage
    Created on : 26-Jul-2016, 15:46:03
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
        <link rel="stylesheet" href="AdminPage.css">
        
        <title>Talaria Footwear Company</title>
        
        <!-- Script for functions -->
        <script>
            $(document).ready(function(){
                
                $('#goHome').on('click', function(){
                    window.location.href = "index.jsp";
                });
                
                $('#logoutBtn').on('click', function(){
                    window.location.href = "index.jsp";
                });
                
                $('#userHeaderBtn').on('click', function(){
                    
                });
                
                
                $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
                    e.preventDefault();
                    $(this).siblings('a.active').removeClass("active");
                    $(this).addClass("active");
                    var index = $(this).index();
                    $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
                    $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
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
                        
                         <!--Logout buttons--> 
                        <div class="btn-group navbar-form navbar-right" role="group" aria-label="...">
                            <input type="button" class="btn btn-default navbar-btn" id="userHeaderBtn" name="userHeaderBtn" value="User's name" />
                            <input type="button" class="btn btn-default navbar-btn" id="logoutBtn" name="logoutBtn" value="Sign Out" />
                        </div>
                    </div>
                </div>  <!-- /container-fluid -->
            </nav> <!-- /navbar top header 
            
            <!-- CONTENT -->
            <!-- source: http://bootsnipp.com/snippets/featured/sidebar-with-tabs -->
            <div class="container">
                <div class="col-sm-2">
                    <nav class="nav-sidebar">
                        <!--<h4>Administrator</h4>-->
                        <ul class="nav tabs" id="tabTitle">
                            <li class="active"><a id="tabTitle1" href="#tab1" data-toggle="tab">Add Manager</a></li>
                            <li class=""><a id="tabTitle2" href="#tab2" data-toggle="tab">Unlock Accounts</a></li>                             
                        </ul>
                    </nav>
                    <!--<div><h2 class="add">Place for your add!</h2></div>-->
                </div>
                
                <!-- tab content -->
                <div class="col-sm-10 tab-content" id="tabDiv">
                    <div class="tab-pane active text-style" id="tab1">
                        <h3>Add Manager</h3> 
                        <hr>
<!--                        <div class="panel-heading">
                            <h2 class="panel-title">Add Manager</h2>
                        </div>-->
                        <div class="panel-body">
                            <form role="form" id="createmanagerForm" name="createmanagerForm" action="AddManagerServlet" method="post">
                                <fieldset>
                                    <!-- Name (First, Middle Initial, Last) -->
                                    <div class="col-sm-4 form-group">
                                        <input class="form-control" placeholder="First Name" name="fnameManager" id="fnameManager" type="text" autofocus="">
                                    </div>
                                    <div class="col-sm-4 form-group">
                                        <input class="form-control" placeholder="Middle Initial" name="minitialManager" id="minitialManager" type="text" autofocus="">
                                    </div>
                                    <div class="col-sm-4 form-group">
                                        <input class="form-control" placeholder="Last Name" name="lnameManager" id="lnameManager" type="text" autofocus="">
                                    </div>

                                    <!-- Username, Password, Email, type of manager -->
                                    <div class="col-sm-6 form-group">
                                        <input class="form-control" placeholder="Username" name="usernameManager" id="usernameManager" type="text" autofocus="">
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <input class="form-control" placeholder="Password" name="passwordManager" id="passwordManager" type="password" value="">
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <input class="form-control" placeholder="E-mail" name="emailManager" id="emailManager" type="email" value="">
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">Type:</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" id="typeManager" name="typeManager">
                                                <option value="1">Product Manager</option>
                                                <option value="2">Accounting Manager</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- Change this to a button or input when using this as a form -->
<!--                                            <a href="javascript:;" class="btn btn-sm btn-success">Login</a>-->
                                    <div class="col-sm-12 form-group">
                                        <input type="submit" class="btn btn-success" id="createmanagerSubmit" name="createmanagerSubmit" value="Create Manager Account" />
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        
                    </div>
                    
                    <div class="tab-pane text-style" id="tab2">
                        <h3>Unlock Accounts</h3>
                        <p>
                            May list (combo box? data is taken from database) ng locked accounts tapos admin selects one then click UNLOCK tapos may lalabas dapat na confirmation window. 
                        </p>
                        <hr>
<!--                        <div class="panel-heading">
                            <h2 class="panel-title">Unlock Account</h2>
                        </div>-->
                        <div class="panel-body">
                            <form role="form" id="unlockaccountForm" name="unlockaccountForm">
                                <fieldset>
                                    <div class="form-group">
                                        <label class="col-sm-3">Locked Accounts:</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" name="lockedAccount">
                                                <option value="1">How To Put Account Here?</option>
                                                <option value="2">????</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-12 form-group">
                                        <input type="submit" class="btn btn-success" id="unlockaccountSubmit" name="unlockaccountSubmit" value="Unlock Account" />
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        
<!--                        <img src="http://placehold.it/150x90" class="img-rounded pull-left">-->
                    </div>
                </div>
            </div>
            <!-- /content -->
            
        </div> <!-- /container-fluid BODY -->
    </body>
</html>
