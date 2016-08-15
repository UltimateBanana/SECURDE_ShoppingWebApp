<%-- 
    Document   : ProductManagerPage
    Created on : 10-Aug-2016, 19:10:28
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
        <link rel="stylesheet" href="ProductManagerPage.css">
        
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
                
                // For the modals
                $(document).on('click', '.deleteMe',function(){
//                    $('#deleteModal').modal('show');
//                    $('#deleteConfim').on('click', function(){
//                        $(this).closest("tr").remove();
//                    });
                    $(this).closest("tr").remove();
                });

                $(document).on('click', '.editMe',function(){
                    $('#editModal').modal('show');
                });
                
//                $('#deleteConfim').submit(function(){
//                    $(this).closest("tr").remove();
//                });
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
                            <li class="active"><a id="tabTitle1" href="#tab1" data-toggle="tab">Product List</a></li>
                            <li class=""><a id="tabTitle2" href="#tab2" data-toggle="tab">Add Product</a></li>                             
                        </ul>
                    </nav>
                    <!--<div><h2 class="add">Place for your add!</h2></div>-->
                </div>
                
                <!-- tab content -->
                <div class="col-sm-10 tab-content" id="tabDiv">
                    <div class="tab-pane active text-style" id="tab1">
                        <h3>Product List</h3> 
                        <hr>
<!--                        <div class="panel-heading">
                            <h2 class="panel-title">Add Manager</h2>
                        </div>-->
                        <div class="row col-md-12 custyle">
                            <table class="table table-striped custab">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Product Name</th>
                                        <th>Category</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${products}" var="product">
                                    <tr>
                                        <td><c:out value="${product.productId}" /></td>
                                        <td><c:out value="${product.name}" /></td>
                                        <td><c:out value="${product.category}" /></td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-info btn-xs editMe">
                                                <i class="glyphicon glyphicon-edit"></i>
                                                Edit
                                            </button>
                                            <button type="button" class="btn btn-danger btn-xs deleteMe">
                                                <i class="glyphicon glyphicon-remove"></i>
                                                Remove
                                            </button>
<!--                                            <a class="btn btn-info btn-xs editMe" href="#">
                                                <span class="glyphicon glyphicon-edit"></span> 
                                                Edit
                                            </a> 
                                            <a href="#" class="btn btn-danger btn-xs deleteMe">
                                                <span class="glyphicon glyphicon-remove"></span> 
                                                Del
                                            </a>-->
                                        </td>
                                    </tr>
                                </c:forEach>


                            </table>
                        </div>
                        
                    </div>
                    
                    <div class="tab-pane text-style" id="tab2">
                        <h3>Add Product</h3> 
                        <hr>
<!--                        <div class="panel-heading">
                            <h2 class="panel-title">Add Manager</h2>
                        </div>-->
                        <div class="panel-body">
                            <form role="form" id="addproductForm" name="addproductForm">
                                <fieldset>
                                    <!-- Product Details -->
                                    <div class="col-sm-6 form-group">
                                        <input class="form-control" placeholder="Product Name" name="nameAddProduct" id="nameAddProduct" type="text" autofocus="">
                                    </div>
                                    <div class="col-sm-12 form-group">
                                        <textarea style="resize:none" class="form-control" placeholder="Description" name="descriptionAddProduct" id="descriptionAddProduct" autofocus="" rows="3"></textarea>
                                    </div>
                                    <div class="col-sm-4 form-group">
                                        <input class="form-control" placeholder="Price" name="priceAddProduct" id="priceAddProduct" type="text" autofocus="">
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Category:</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" id="categroryAddProduct" name="categoryAddProduct">
                                                <option value="boots">Boots</option>
                                                <option value="shoes">Shoes</option>
                                                <option value="sandals">Sandals</option>
                                                <option value="slippers">Slippers</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- Change this to a button or input when using this as a form -->
<!--                                            <a href="javascript:;" class="btn btn-sm btn-success">Login</a>-->
                                    <div class="col-sm-12 form-group">
                                        <input type="submit" class="btn btn-success" id="addproductSubmit" name="addproductSubmit" value="Add Product" />
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /content -->
            
            <!-- Modal for the Edit Product -->
            <div class="modal fade" id="editModal" role="dialog">
                <div class="modal-dialog">

                    <!-- View Product Content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit Product</h4>
                        </div>
                        <form class="form-horizontal">
                            <div class="modal-body">
                                <fieldset>
                                    <!-- Product Details -->
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
            </div>
            
            <!-- Modal for confirmation to delete product -->
            <div class="modal fade" id="deleteModal" role="dialog">
                <div class="modal-dialog">

                    <!-- View Task Content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Delete Product</h4>
                        </div>
                        <form class="form-horizontal">
                            <div class="modal-body">
                                <p>Do you wish to delete (HOW DO YOU INSERT PRODUCT NAME HERE?)</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <input type="submit" class="btn btn-primary" id="deleteConfirm" value="Confirm">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
        </div> <!-- /container-fluid BODY -->
    </body>
</html>


