<%-- 
    Document   : AccountingManagerPage
    Created on : 12-Aug-2016, 10:47:56
    Author     : hannah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                
                $('#filterSubmit').on('click', function(){
                    var saleFilter = $("#filterbyFinancialRecords").val();
                    
                    if(saleFilter == "1")
                    {
//                        var header = ["All Items", "Sales"];
//                        alert("Total Sales");
//                        $.get("UpdateSalesTable1Servlet", function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
//                            $("#salesTable").text(responseText);           // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
//                        });
                        $('#divTable').empty();
                        $.get("UpdateSalesTable1Servlet", function(responseJson) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                            var $table = $("<table class=\"table table-striped custab\">").appendTo($("#divTable")); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
                            
                            //Header
                            $("<thead>").appendTo($table);
                            $("<tr>").appendTo($table)
                                .append($("<th>").text("All Items"))
                                .append($("<th>").text("Sales"));
                            
                            //Content
                            $.each(responseJson, function(index, sale) {    // Iterate over the JSON array.
                                $("<tr>").appendTo($table)                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
                                    .append($("<td>").text(sale.name))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
                                    .append($("<td>").text(sale.totalSales));    // Create HTML <td> element, set its text content with price of currently iterated product and append it to the <tr>.
                            });
                        });
                    }
                    else if(saleFilter == "2")
                    {
//                        alert("Total Sales per Category");
                        $('#divTable').empty();
                        $.get("UpdateSalesTable2Servlet", function(responseJson) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                            var $table = $("<table class=\"table table-striped custab\">").appendTo($("#divTable")); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
                            
                            //Header
                            $("<thead>").appendTo($table);
//                            $("<thead>").appendTo($table);
                            $("<tr>").appendTo($table)
                                .append($("<th>").text("Category"))
                                .append($("<th>").text("Sales"));
                            
                            //Content
                            $.each(responseJson, function(index, sale) {    // Iterate over the JSON array.
                                $("<tr>").appendTo($table)                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
                                    .append($("<td>").text(sale.name))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
                                    .append($("<td>").text(sale.totalSales));    // Create HTML <td> element, set its text content with price of currently iterated product and append it to the <tr>.
                            });
                        });
                    }
                    else if(saleFilter == "3")
                    {
//                        alert("Total Sales per Product");
                        $('#divTable').empty();
                        $.get("UpdateSalesTable3Servlet", function(responseJson) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                            var $table = $("<table class=\"table table-striped custab\">").appendTo($("#divTable")); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
                            
                            //Header
                            $("<thead>").appendTo($table);
                            $("<tr>").appendTo($table)
                                .append($("<th>").text("Product"))
                                .append($("<th>").text("Sales"));
                            
                            //Content
                            $.each(responseJson, function(index, sale) {    // Iterate over the JSON array.
                                $("<tr>").appendTo($table)                     // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
                                    .append($("<td>").text(sale.name))        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
                                    .append($("<td>").text(sale.totalSales));    // Create HTML <td> element, set its text content with price of currently iterated product and append it to the <tr>.
                            });
                        });
                    }
                });
                
            });
            
        </script>
        
        
    </head>
    <body>
        <%
//            if(session.getAttribute("user") == null){
//                response.sendRedirect("index.jsp");
//            }
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
                        
                         <!--Logout buttons--> 
                        <form action="LogoutServlet" method="post">
                            <div class="btn-group navbar-form navbar-right" role="group" aria-label="...">
                               <input type="button" class="btn btn-default navbar-btn" id="userHeaderBtn" name="userHeaderBtn" value="User's name" />
                               <input type="button" class="btn btn-default navbar-btn" id="logoutBtn" name="logoutBtn" value="Sign Out" />
                            </div>
                        </form>
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
                            <li class=""><a id="tabTitle2" href="#tab2" data-toggle="tab">Change Password</a></li>                             
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
                                                <option value="2">Total Sales per Category</option>
                                                <option value="3">Total Sales per Product</option>
                                            </select>
                                        </div>
                                        <div class="col-sm-4">
                                            <input type="button" class="btn btn-success" id="filterSubmit" name="filterSubmit" value="Filter" />
                                        </div>
                                    </div>
                                    
                                </fieldset>
                            </form>
                        </div>
                        <hr>
<!--                        <div class="panel-heading">
                            <h2 class="panel-title">Add Manager</h2>
                        </div>-->
                        <div class="row col-md-12 custyle" id="divTable" name="divTable">
                            <table class="table table-striped custab" id="salesTable" name="salesTable">
                                <thead>
                                    <tr>
                                        <th>All Items</th>
                                        <th>Sales</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${sales}" var="sale">
                                    <tr>
                                        <td><c:out value="${sale.name}" /></td>
                                        <td><c:out value="${sale.totalSales}" /></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                                    
                    <div class="tab-pane text-style" id="tab2">
                        <h3>Change Password</h3>
                        <hr>
                        <div class="panel-body">
                            <form role="form" id="changepasswordForm" name="changepasswordForm" action="ChangePasswordServlet" method="post">
                                <fieldset>
                                    
                                    <label class="col-sm-3 control-label">Enter Current Password:</label>
                                    <div class="col-sm-9 form-group">
                                        <input class="form-control" placeholder="Password" name="currpasswordChangePass" id="currpasswordChangePass" type="password" value="">
                                    </div>
                                    <label class="col-sm-3 control-label">Enter New Password:</label>
                                    <div class="col-sm-9 form-group">
                                        <input class="form-control" placeholder="Password" name="newpasswordChangePass" id="newpasswordChangePass" type="password" value="">
                                    </div>
                                    <label class="col-sm-3 control-label">Confirm New Password:</label>
                                    <div class="col-sm-9 form-group">
                                        <input class="form-control" placeholder="Password" name="confnewpasswordChangePass" id="confnewpasswordChangePass" type="password" value="">
                                    </div>
                                    
                                    <div class="col-sm-12 form-group">
                                        <input type="submit" class="btn btn-primary editMe" id="changepasswordBtn" name="changepasswordBtn" value="Change Password" />
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

