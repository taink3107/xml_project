<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Detail</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/detail.css">
    <body>
        <div class="wrapper d-flex align-items-stretch">
            <%@include file="narbar.jsp" %>
            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5 pt-5">
                <div>
                    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/RSS_project/oder">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Detail</li>
                        </ol>
                    </nav>

                    <div class="container-fluid">                        
                        <div class="row">

                            <div class="col-md-4 col-xl-9">
                                <div class="card">
                                    <div class="card-header">                                      
                                        <h5 class="card-title mb-0">Customer Information</h5>
                                    </div>
                                    <div class="card-body h-100">

                                        <div class="card-body ">
                                            <div class="row">
                                                <div class="col-xl-6">
                                                    <img  src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="avt" class="img-fluid rounded-circle mb-2 ml-4 text-center" width="90" height="90">
                                                    <div>
                                                        <h5>${item.customer.first_name} ${item.customer.last_name}</h5>
                                                        <a class="btn btn-primary btn-sm" href="#">View profile</a>
                                                    </div>
                                                </div>
                                                <div class="col-xl-6">

                                                    <div> <h6><i>Phone Number</i></h6>${item.customer.phone}</div>
                                                    <br>
                                                    <div><h6><i>Address</i></h6>${item.customer.street} ${item.customer.state}</div>
                                                    <br>
                                                    <div><h6><i>Email</i></h6>  ${item.customer.email}</div>
                                                    <br>
                                                    <div><h6><i>Status</i></h6> Active</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-header">
                                            <h5 class="card-title mb-0">Delivery address</h5>
                                            <div class="card-body">
                                                No address yet
                                            </div>
                                        </div>
                                        <hr class="my-0">
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-header">                                      
                                        <h5 class="card-title mb-0">Product information</h5>
                                    </div>
                                    <div class="card-body h-100">
                                        <table class=" table table-striped ">
                                            <thead>
                                                <tr class="table-secondary">
                                                    <th class="text-center">ID</th>
                                                    <th class="text-center ">Product</th>
                                                    <th class="text-center">Quantity</th>
                                                    <th class="text-center ">Price</th>
                                                    <th class="text-center">Discount</th>
                                                    <th class="text-center ">Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${item.items}" var="it">
                                                <span class="d-none"> ${totalcount =totalcount+ 1}</span> 
                                                <tr>

                                                    <td class="text-center">${it.item_id}</td>
                                                    <td class="text-center">${it.product.product_name}</td>
                                                    <td class="text-center">${it.quantity}</td>
                                                    <td class="text-center">${it.list_price}</td>
                                                    <td class="text-center">
                                                        <fmt:formatNumber value="${it.discount*100}" type="currency" maxFractionDigits="0" currencySymbol=""/>%
                                                    </td>

                                                    <td class="text-center"><fmt:formatNumber value="${totalLine = (it.list_price - (it.list_price*it.discount))*it.quantity}" type="currency" maxFractionDigits="2" /></td>
                                                <span class="d-none"> ${totalPrice = totalPrice + totalLine}</span>
                                                </tr>
                                            </c:forEach>


                                            </tbody>

                                        </table>
                                        <table >
                                            <tr >
                                                <td class="text-start">Total ( ${totalcount} products)</td>
                                                <td class="border-left text-end"> <fmt:formatNumber value="${totalPrice}" type="currency" maxFractionDigits="" /></td>
                                            </tr>
                                            <tr >
                                                <td class="text-start">Discount</td>
                                                <td class="border-left text-end"></td>
                                            </tr>
                                            <tr >
                                                <td class="text-start">Ship fees</td>
                                                <td class="border-left text-end"></td>
                                            </tr>
                                            <tr >
                                                <td class="text-start">Customer must pay</td>
                                                <td class="border-left text-end"><fmt:formatNumber value="${totalPrice}" type="currency" maxFractionDigits="0" /></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>


                                <div class="card">
                                    <c:if test="${item.order_status eq 4}">
                                        <div class="card-header">
                                            <span class="badge bg-success" style="color: white">Success</span>
                                            <h5 class="card-title mb-0">Order has been paid  </h5>
                                        </div>
                                        <div class="card-body">                                       
                                            Payment confirmation <b><fmt:formatNumber value="${totalPrice}" type="currency" maxFractionDigits="0" /></b> success
                                        </div>
                                    </c:if>
                                    <c:if test="${item.order_status eq 3}">
                                        <div class="card-header">
                                            <span class="badge bg-warning" style="color: white">warning</span>
                                            <h5 class="card-title mb-0">The order has not been paid</h5>
                                        </div>

                                    </c:if>

                                </div>
                            </div>
                            <div class="col-md-4 col-xl-3">
                                <div class="card">
                                    <hr class="my-0">
                                    <div class="card-body">
                                        <c:if test="${item.order_status eq 4}">
                                            <div>
                                                <span class="badge bg-success" style="color: white">Success</span>
                                                <h5 class="h6 card-title">
                                                    Information line</h5>                                            
                                            </div>
                                            <div> Required : ${item.required_date}</div>
                                            <div> Shipped : ${item.shipped_date}</div>
                                            <div>
                                                 <h6>Default address</h6>
                                            </div>                                           
                                        </div>
                                        <hr class="my-0">
                                        <div class="card-body">
                                            <h6>Note : </h6>
                                        </div>
                                    </c:if>
                                    <c:if test="${item.order_status eq 3}">
                                        <div>
                                            <span class="badge bg-warning" style="color: white">Process</span>
                                            <h5 class="h6 card-title">Information line</h5>                                            
                                        </div>
                                        <div> Required : ${item.shipped_date}</div>
                                        <div> Shipped : none</div>
                                        <h6>Default address</h6>
                                    </div>
                                    <hr class="my-0">
                                    <div class="card-body">
                                        <h6>Ghi chú : </h6>
                                    </div>
                                </c:if>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>