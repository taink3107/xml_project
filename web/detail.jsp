<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
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
                            <li class="breadcrumb-item"><a href="http://localhost:8084/RSS_project/manageOrder.jsp">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Detail</li>
                        </ol>
                    </nav>

                    <div class="container-fluid">                        
                        <div class="row">

                            <div class="col-md-4 col-xl-9">
                                <div class="card">
                                    <div class="card-header">                                      
                                        <h5 class="card-title mb-0">Thông tin khách hàng</h5>
                                    </div>
                                    <div class="card-body h-100">

                                        <div class="card-body ">
                                            <div class="row">
                                                <div class="col-xl-6">
                                                    <img  src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="avt" class="img-fluid rounded-circle mb-2 ml-4 text-center" width="90" height="90">
                                                    <div>
                                                        <a class="btn btn-primary btn-sm" href="#">Xem trang cá nhân</a>
                                                    </div>
                                                </div>
                                                <div class="col-xl-6">
                                                    <div>Số điện thoại</div>
                                                    <div>Địa chỉ</div>
                                                    <div>Email</div>
                                                    <div>Trạng thái</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-header">
                                            <h5 class="card-title mb-0">Địa chỉ giao hàng</h5>
                                            <div class="card-body">
                                                hiện chưa có địa chỉ
                                            </div>
                                        </div>
                                        <hr class="my-0">
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-header">                                      
                                        <h5 class="card-title mb-0">Thông tin sản phẩm</h5>
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
                                                <tr>
                                                    <td>Total ( 4 products)</td>
                                                    <td> Hi</td>
                                                </tr>
                                                <tr>
                                                    <td>Discount</td>
                                                    <td> Hello</td>
                                                </tr>
                                                <tr>
                                                    <td>Ship fees</td>
                                                    <td> Ha</td>
                                                </tr>
                                                <tr>
                                                    <td>Customer must pay</td>
                                                    <td> Hi</td>
                                                </tr>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                                
                                
                                <div class="card">
                                    <div class="card-header">
                                        <span class="badge bg-success" style="color: white">Success</span>
                                        <h5 class="card-title mb-0">Đơn hàng đã được thanh toán</h5>
                                    </div>
                                    <div class="card-body h-100">
                                        
                                        <h5>Xác nhận thanh toán</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-xl-3">
                                <div class="card">
                                    <hr class="my-0">
                                    <div class="card-body">
                                        <div>
                                            <span class="badge bg-success" style="color: white">Success</span>
                                            <h5 class="h6 card-title">Thông tin đơn hàng</h5>                                            
                                        </div>
                                       
                                        <h6>Chi nhánh mặc định</h6>
                                    </div>
                                    <hr class="my-0">
                                    <div class="card-body">
                                        <h6>Ghi chú : </h6>
                                    </div>
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