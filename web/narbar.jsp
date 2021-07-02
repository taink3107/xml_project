<%-- 
    Document   : narbar.jsp
    Created on : Jul 2, 2021, 5:21:15 PM
    Author     : taink
--%>
<nav id="sidebar" class="active">
    <div class="custom-menu">
        <button type="button" id="sidebarCollapse" class="btn btn-primary">
            <i class="fa fa-bars"></i>
            <span class="sr-only">Toggle Menu</span>
        </button>
    </div>
    <div class="p-4">
        <h1><a href="index.html" class="logo">Bike Store</a></h1>
        <ul class="list-unstyled components mb-5">
            <li class="active">
                <a href="http://localhost:8084/RSS_project/oder"><span class="fa fa-home mr-3"></span> Manage Order</a>
            </li>
            <li>
                <a href="manageCustomer.jsp"><span class="fa fa-user mr-3"></span> Manage Customer</a>
            </li>
            <li>
                <a href="manageProduct.jsp"><span class="fa fa-briefcase mr-3"></span> Manage Product</a>
            </li>
            <li>
                <a href="manageStore.jsp"><span class="fa fa-paper-plane mr-3"></span> Manage Store</a>
            </li>
            <li>
                <a href="manageStaff.jsp"><span class="fa  fa-sticky-note mr-3"></span> Manage Staff</a>
            </li>
        </ul>
    </div>
</nav>