<%-- 
    Document   : index
    Created on : Jul 2, 2021, 9:44:41 AM
    Author     : taink
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage Order</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    
    <body>
        <div class="wrapper d-flex align-items-stretch">
            <%@include file="narbar.jsp" %>
            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5 pt-5">
                <div>
                    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="http://localhost:8084/RSS_project/manageOrder.jsp">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Manage Order</li>
                        </ol>
                    </nav>
                    <c:import var="myvar" url="http://localhost:8084/RSS_project/order" charEncoding="UTF-8"/>
                    <x:parse var="mydata" xml="${myvar}"/>
                    <table class=" table table-hover ">
                        <thead>
                            <tr style="background-color: #f4f6f8">
                                <th class="text-center">ID</th>
                                <th class="text-center ">Customer</th>
                                <th class="text-center">Order Date</th>
                                <th class="text-center ">Store</th>
                                <th class="text-center">Status</th>
                                <th class="text-center ">Staff</th>
                            </tr>
                        </thead>
                        <tbody>
                            <x:forEach select="$mydata/orders/orders"  var="od">
                                <tr class="border">
                                    <td class=" text-center"  name="order_id"> <x:out select="$od/order_id" /> </td>
                                    <td class="text-center " name="cus_id"> 
                                        <a href="#"><x:out select="$od/customer/first_name"/> <x:out select="$od/customer/last_name"/></a>
                                    </td>
                                    <td class="text-center " name="order_date"><x:out select="$od/order_date" /></td>
                                    <td class="text-centert " name="store_id">
                                        <x:out select="$od/store/store_name" />
                                    </td>
                                    <td class=" text-center" name="status">
                                        <x:if select="$od/order_status=4">
                                            <span class="text-success">Complete</span>
                                        </x:if>
                                        <x:if select="$od/order_status=3">
                                            <span class="text-warning">Process</span>
                                        </x:if>
                                    </td>
                                    <td class="text-center border" name="staff_id"><x:out select="$od/staff/first_name" /> <x:out select="$od/customer/last_name"/></td>                    
                                </tr>
                            </x:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
