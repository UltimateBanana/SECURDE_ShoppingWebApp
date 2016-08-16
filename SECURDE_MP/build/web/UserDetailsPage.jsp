<%-- 
    Document   : UserDetailsPage
    Created on : 12-Aug-2016, 12:21:48
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
        <link rel="stylesheet" href="UserDetailsPage.css">
        
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
                
                // Modals
                $(document).on('click', '.editMe',function(){
                    $('#editModal').modal('show');
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
                        <form action="GeneralIndexServlet" method="post">
                            <div class="btn-group navbar-form navbar-right" role="group" aria-label="...">
                                <input type="submit" class="btn btn-default navbar-btn" id="loginBtn" name="loginBtn" value="<%=userName%>"/>
                                <input type="submit" class="btn btn-default navbar-btn" id="signupBtn" name="signupBtn" value="<%=logoutName%>"/>
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
                            <li class="active"><a id="tabTitle1" href="#tab1" data-toggle="tab">User Details</a></li>
                            <li class=""><a id="tabTitle2" href="#tab2" data-toggle="tab">Credit Card Details</a></li>  
                            <li class=""><a id="tabTitle2" href="#tab3" data-toggle="tab">Change Password</a></li> 
                        </ul>
                    </nav>
                    <!--<div><h2 class="add">Place for your add!</h2></div>-->
                </div>
                
                <!-- tab content -->
                <div class="col-sm-10 tab-content" id="tabDiv">
                    <div class="tab-pane active text-style" id="tab1">
                        <h3>User Details</h3>
                        <hr>
                        <div class="panel-body">
                            <form role="form" id="showuserdetailsForm" name="showuserdetailsForm">
                                <fieldset>
                                    <c:forEach items="${accounts}" var="account">
                                    <!-- Name (First, Middle Initial, Last -->
                                    <div class="col-sm-4 form-group">
                                        <input class="form-control" placeholder="First Name" name="fnameShowUD" id="fnameShowUD" type="text" autofocus="" value="${account.firstName}" readonly>
                                    </div>
                                    <div class="col-sm-4 form-group">
                                        <input class="form-control" placeholder="Middle Initial" name="minitialShowUD" id="minitialShowUD" type="text" autofocus="" value="${account.middleName}" readonly>
                                    </div>
                                    <div class="col-sm-4 form-group">
                                        <input class="form-control" placeholder="Last Name" name="lnameShowUD" id="lnameShowUD" type="text" autofocus="" value="${account.lastName}" readonly>
                                    </div>

                                    <!-- Username, Password, and Email -->
                                    <div class="col-sm-6 form-group">
                                        <input class="form-control" placeholder="Username" name="usernameShowUD" id="usernameShowUD" type="text" autofocus="" value="${account.username}" readonly>
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <input class="form-control" placeholder="E-mail" name="emailShowUD" id="emailShowUD" type="email" value="${account.email}" readonly>
                                    </div>

                                    <!-- Billing Address and Shipping Address -->
                                    <div id="billingAddress">
                                        <label class="col-sm-12">Billing Address</label>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="House #" name="housenumBAShowUD" id="housenumBAShowUD" type="text" autofocus="" value="${account.billingAddress.houseNumber}" readonly>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Street" name="streetBAShowUD" id="streetBAShowUD" type="text" autofocus=""  value="${account.billingAddress.street}" readonly>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Subdivision" name="subdivisionBAShowUD" id="subdivisionBAShowUD" type="text" autofocus=""  value="${account.billingAddress.subdivision}" readonly>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="City" name="cityBAShowUD" id="cityBAShowUD" type="text" autofocus=""  value="${account.billingAddress.city}" readonly>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Postal Code" name="postalcodeBAShowUD" id="postalcodeBAShowUD" type="text" autofocus=""  value="${account.billingAddress.postalCode}" readonly>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Country" name="countryBAShowUD" id="countryBAShowUD" type="text" autofocus=""  value="${account.billingAddress.country}" readonly>
                                        </div>
                                    </div>

                                    <div id="billingAddress">
                                        <label class="col-sm-12">Shipping Address</label>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="House #" name="housenumSAShowUD" id="housenumSAShowUD" type="text" autofocus="" value="${account.shippingAddress.houseNumber}" readonly>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Street" name="streetSAShowUD" id="streetSAShowUD" type="text" autofocus=""  value="${account.shippingAddress.street}" readonly>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Subdivision" name="subdivisionSAShowUD" id="subdivisionSAShowUD" type="text" autofocus="" value="${account.shippingAddress.subdivision}" readonly>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="City" name="citySAShowUD" id="citySAShowUD" type="text" autofocus="" value="${account.shippingAddress.city}" readonly>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Postal Code" name="postalcodeSAShowUD" id="postalcodeSAShowUD" type="text" autofocus="" value="${account.shippingAddress.postalCode}" readonly>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Country" name="countrySAShowUD" id="countrySAShowUD" type="text" autofocus="" value="${account.shippingAddress.country}" readonly>
                                        </div>
                                        
                                        <div class="col-sm-12 form-group">
                                            <input type="button" class="btn btn-primary editMe" id="edituserBtn" name="edituserBtn" value="Edit User Details" />
                                        </div>
                                    </div>
                                    </c:forEach>
                                </fieldset>
                            </form>
                        </div>
                        
                    </div>
                    
                    
                    <div class="tab-pane text-style" id="tab2">
                        <h3>User Details</h3>
                        <hr>
                        <div class="panel-body">
                            <form role="form" id="showuserdetailsForm" name="showuserdetailsForm">
                                <fieldset>
                                    
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    
                    
                    <div class="tab-pane text-style" id="tab3">
                        <h3>User Details</h3>
                        <hr>
                        <div class="panel-body">
                            <form role="form" id="showuserdetailsForm" name="showuserdetailsForm">
                                <fieldset>
                                    
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    
                </div>
            </div>
            <!-- /content -->
            
            <!-- Modal for the Edit User Details -->
            <div class="modal fade" id="editModal" role="dialog">
                <div class="modal-dialog">

                     <!--View User Details Content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit User Details</h4>
                        </div>
                        <form class="form-horizontal" role="form" action="EditUserDetailsServlet" method="post">
                            <div class="modal-body">
                                <!--<form role="form" id="showuserdetailsForm" name="showuserdetailsForm">-->
                                <fieldset>
                                    <c:forEach items="${accounts}" var="account">
                                     <!--Name (First, Middle Initial, Last--> 
                                    <div class="col-sm-4 form-group">
                                        <input class="form-control" placeholder="First Name" name="fnameEditUD" id="fnameEditUD" type="text" autofocus="" value="${account.firstName}" >
                                    </div>
                                    <div class="col-sm-4 form-group">
                                        <input class="form-control" placeholder="Middle Initial" name="minitialEditUD" id="minitialEditUD" type="text" value="${account.middleName}" autofocus="" >
                                    </div>
                                    <div class="col-sm-4 form-group">
                                        <input class="form-control" placeholder="Last Name" name="lnameEditUD" id="lnameEditUD" type="text" value="${account.lastName}" autofocus="" >
                                    </div>

                                     <!--Username, Password, and Email--> 
                                    <div class="col-sm-6 form-group">
                                        <input class="form-control" placeholder="E-mail" name="emailEditUD" id="emailEditUD" type="email" value="${account.email}" autofocus="">
                                    </div>

                                     <!--Billing Address and Shipping Address--> 
                                    <div id="billingAddress">
                                        <label class="col-sm-12">Billing Address</label>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="House #" name="housenumBAEditUD" id="housenumBAEditUD" type="text" value="${account.billingAddress.houseNumber}" autofocus="" >
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Street" name="streetBAEditUD" id="streetBAEditUD" type="text" value="${account.billingAddress.street}" autofocus="" >
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Subdivision" name="subdivisionBAEditUD" id="subdivisionBAEditUD" type="text" value="${account.billingAddress.subdivision}" autofocus="" >
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="City" name="cityBAEditUD" id="cityBAEditUD" type="text" value="${account.billingAddress.city}" autofocus="" >
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Postal Code" name="postalcodeBAEditUD" id="postalcodeBAEditUD" type="text" value="${account.billingAddress.postalCode}" autofocus="" >
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Country" name="countryBAEditUD" id="countryBAEditUD" type="text" value="${account.billingAddress.country}" autofocus="" >
                                        </div>
                                    </div>

                                    <div id="billingAddress">
                                        <label class="col-sm-12">Shipping Address</label>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="House #" name="housenumSAEditUD" id="housenumSAEditUD" type="text" value="${account.shippingAddress.houseNumber}" autofocus="" >
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Street" name="streetSAEditUD" id="streetSAEditUD" type="text" value="${account.shippingAddress.street}" autofocus="" >
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Subdivision" name="subdivisionSAEditUD" id="subdivisionSAEditUD" type="text" value="${account.shippingAddress.subdivision}" autofocus="" >
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="City" name="citySAEditUD" id="citySAEditUD" type="text" value="${account.shippingAddress.city}" autofocus="" >
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Postal Code" name="postalcodeSAEditUD" id="postalcodeSAEditUD" type="text" value="${account.shippingAddress.postalCode}" autofocus="" >
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <input class="form-control" placeholder="Country" name="countrySAEditUD" id="countrySAEditUD" type="text" value="${account.shippingAddress.country}" autofocus="" >
                                        </div>
                                        </c:forEach>
                                </fieldset>
                                <!--</form>-->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <input type="submit" class="btn btn-primary" id="editSave" value="Save changes">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            

            <!-- Modal for the Edit Product -->
<!--            <div class="modal fade" id="editModal" role="dialog">
                <div class="modal-dialog">

                     View Product Content
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit Product</h4>
                        </div>
                        <form class="form-horizontal">
                            <div class="modal-body panel-body">
                                <fieldset>
                                     Product Details 
                                    
                                    <div class="col-sm-6 form-group">
                                        <input class="form-control" placeholder="Product Name" name="nameEditProduct" id="nameEditProduct" type="text" autofocus="">
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <input class="form-control" placeholder="Product Name" name="nameEditProduct" id="nameEditProduct" type="text" autofocus="">
                                    </div>
                                    <div class="col-sm-12 form-group">
                                        <textarea style="resize:none" class="form-control" placeholder="Description" name="descriptionEditProduct" id="descriptionEditProduct" autofocus="" rows="3"></textarea>
                                    </div>
                                    <div class="col-sm-4 form-group">
                                        <input class="form-control" placeholder="Price" name="priceEditProduct" id="priceEditProduct" type="text" autofocus="">
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Category:</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" id="categroryEditProduct" name="categoryEditProduct">
                                                <option value="boots">Boots</option>
                                                <option value="shoes">Shoes</option>
                                                <option value="sandals">Sandals</option>
                                                <option value="slippers">Slippers</option>
                                            </select>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <input type="submit" class="btn btn-primary" id="editSave" value="Save changes">
                            </div>
                        </form>
                    </div>
                </div>
            </div>-->
            
        </div> <!-- /container-fluid BODY -->
    </body>
</html>

