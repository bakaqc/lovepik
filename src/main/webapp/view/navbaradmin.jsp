

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="app-header" style="background-color: #f8d7da">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                    aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">


        <!-- User Menu-->
        <li><a class="app-nav__item" href="${pageContext.request.contextPath}/logout"><i class='bx bx-log-out bx-rotate-180'></i> Đăng xuất </a>

        </li>
    </ul>
</header>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar" style="background-color: #f8d7da">

    <div>
        <p class="app-sidebar__user-name"><b>${sessionScope.user.getUserName()}</b></p>
        <h5 class="app-sidebar__user-designation">Chào mừng bạn trở lại ^.^</h5>
    </div>

    <hr>
    <ul class="app-menu">
        <li><a class="app-menu__item ${sessionScope.isActive == 0 ? 'active' : ''}" href="${pageContext.request.contextPath}/admin"><i class='app-menu__icon bx bx-tachometer' style="color: black"></i><span
                    class="app-menu__label " style="color: black">Bảng điều khiển</span></a></li>
        <li><a class="app-menu__item ${sessionScope.isActive == 1 ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/list-account"><i class='app-menu__icon bx bx-id-card' style="color: black"></i> <span
                    class="app-menu__label" style="color: black">Quản lý tài khoản</span></a></li>
        <li><a class="app-menu__item ${sessionScope.isActive == 2 ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/list-product"><i
                    class='app-menu__icon bx bx-purchase-tag-alt' style="color: black"></i><span class="app-menu__label" style="color: black">Quản lý sản phẩm</span></a>
        </li>
        <li><a class="app-menu__item ${sessionScope.isActive == 3 ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/list-order"><i
                    class='app-menu__icon bx bx-purchase-tag-alt' style="color: black"></i><span class="app-menu__label" style="color: black">Quản lý đơn hàng</span></a>
        </li>
        <c:if test="${sessionScope.user.role.toString() == 'SuperAdmin'}">
            <li><a class="app-menu__item ${sessionScope.isActive == 4 ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/list-admin"><i
                       class='app-menu__icon bx bx-id-card' style="color: black"></i><span class="app-menu__label" style="color: black">Quản lý admin</span></a>
            </li>
        </c:if>
    </ul>
</aside>
