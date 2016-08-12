<%-- 
    Document   : AccountingManagerPage
    Created on : 12-Aug-2016, 10:47:56
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
        <link rel="stylesheet" href="AccountingManagerPage.css">
        
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
                
                //source: http://bootsnipp.com/snippets/featured/sidebar-with-tabs
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
                            <li class="active"><a id="tabTitle1" href="#tab1" data-toggle="tab">Financial Records</a></li>
<!--                            <li class=""><a id="tabTitle2" href="#tab2" data-toggle="tab">Add Product</a></li>                             -->
                        </ul>
                    </nav>
                    <!--<div><h2 class="add">Place for your add!</h2></div>-->
                </div>
                
                <!-- tab content -->
                <div class="col-sm-10 tab-content" id="tabDiv">
                    <div class="tab-pane active text-style" id="tab1">
                        <h3>Financial Records</h3> 
                        <div class="panel-body">
                            <form role="form" id="financialrecordsForm" name="financialrecordsForm">
                                <fieldset>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Filter By:</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" id="filterbyFinancialRecords" name="filterbyFinancialRecords">
                                                <option value="1">Total Sales</option>
                                                <option value="2">Sales per Category</option>
                                                <option value="3">Sales per Product</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-4">
                                            <input type="submit" class="btn btn-success" id="filterSubmit" name="filterSubmit" value="Filter" />
                                        </div>
                                    </div>
                                    
                                </fieldset>
                            </form>
                        </div>
                        <hr>
<!--                        <div class="panel-heading">
                            <h2 class="panel-title">Add Manager</h2>
                        </div>-->
                        <div class="row col-md-12 custyle">
                            <table class="table table-striped custab">
                                <thead>
                                    <tr>
                                        <th>??</th>
                                        <th>??</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td>1</td>
                                    <td>Banana Slippers</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Converse</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Tsinelas Bruh</td>
                                </tr>
                                
                                <!-- Format for the show all product in list -->
<!--                                <c:forEach items="${tasks}" var="task">
                                    <li class="list-group-item">
                                        <c:out value="${task.title}" />
                                        <span class="glyphicon glyphicon-trash pull-right deleteMe"> </span> 
                                        <span class="glyphicon glyphicon-edit pull-right editMe"> </span>
                                    </li>
                                </c:forEach>-->
                                
                                <c:forEach items="${products}" var="task">
                                    <tr>
                                        <td><c:out value="${product.id}" /></td>
                                        <td><c:out value="${product.title}" /></td>
                                    </tr>
                                </c:forEach>


                            </table>
                        </div>
                        
                    </div>
                    
                </div>
            </div>
            <!-- /content -->
            
        </div> <!-- /container-fluid BODY -->
    </body>
</html>

