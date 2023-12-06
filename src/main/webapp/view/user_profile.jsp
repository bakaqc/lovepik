<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>LovePik | Cài đặt</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">   
        <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.3/components/cards/card-1/assets/css/card-1.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/profile.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/home.css" />

        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/img/icon_web.png">

    </head>
    <body>
        <%@include file="common/header.jsp" %>

        <div class="container">
            <div class="row infor">
                <div class="col-sm-1"></div>

                <div class="col-sm-10">
                    <h3 style="text-align: center;">Thông tin khách hàng</h3>

                    <!--<h4 style="color: green; text-align: center;">${success}</h4>-->

                    <div class="container infor" style="padding: 0;">

                        <form class="form" action="" method="post" id="registrationForm">

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <label for="first_name">
                                        <h4>Họ và Tên</h4>
                                    </label>

                                    <input disabled="" type="text" class="form-control" name="first_name" id="first_name" value="${sessionScope.user.fullName}"  style="font-size: 18px;"/>
                                </div>
                            </div>

                            <div class="row mt-2">
                                <div class="form-group col-6">
                                    <div class="col-xs-6">
                                        <label for="phone">
                                            <h4>Năm Sinh</h4>
                                        </label>

                                        <input disabled="" type="text" class="form-control" name="phone" id="phone" value="${sessionScope.user.yearOfBirth}" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group col-6">
                                    <div class="col-xs-6">
                                        <label for="phone">
                                            <h4>Giới Tính</h4>
                                        </label>

                                        <input disabled="" type="text" class="form-control" name="phone" id="phone" value="${sessionScope.user.gender.toString() == 'male' ? 'Nam' : 'Nữ'}" style="font-size: 18px;"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group mt-4">
                                <div class="col-xs-6">
                                    <label for="email">
                                        <h4>Email</h4>
                                    </label>

                                    <input disabled="" type="email" class="form-control" name="email" id="email" value="${sessionScope.user.email}" style="font-size: 18px;"/>
                                </div>
                            </div>

                            <div class="form-group mt-4">
                                <div class="col-xs-6">
                                    <label for="mobile">
                                        <h4>Số Điện Thoại</h4>
                                    </label>

                                    <input disabled="" type="text" class="form-control" name="mobile" id="mobile" value="${sessionScope.user.phone_number}" style="font-size: 18px;"/>
                                </div>
                            </div>

                            <div class="form-group mt-4">
                                <div class="col-xs-12">
                                    <label for="mobile">
                                        <h4>Địa chỉ</h4>
                                    </label>

                                    <input disabled="" type="text" class="form-control" name="mobile" id="mobile" value="${sessionScope.user.address}" style="font-size: 18px;"/>
                                </div>
                            </div>

                            <div class="row mt-4 mb-2">
                                <div class="form-group col-6">
                                    <div class="col-xs-12 align-items-center"  style="margin-bottom: 30px;">
                                        <br />
                                        <a href="${pageContext.request.contextPath}/edit_profile"> 
                                            <button class="btn btn-lg btn-success col-12" type="button">
                                                Chỉnh sửa thông tin
                                            </button>
                                        </a>
                                    </div>
                                </div>
                                <div class="form-group col-6">
                                    <div class="col-xs-12 align-items-center"  style="margin-bottom: 30px;">
                                        <br />
                                        <a href="${pageContext.request.contextPath}/change_pass"> 
                                            <button class="btn btn-lg btn-success col-12" type="button">
                                                Đổi mật khẩu
                                            </button>
                                        </a>
                                    </div>
                                </div>   
                            </div>   

                        </form>

                    </div>

                    <h3 style="text-align: center; margin-top: 80px;">Thông tin mua hàng</h3>

                    <div class="row gy-4 mb-5">
                        <div class="col-12 col-sm-6">
                            <div class="card widget-card border-light shadow-sm" style="background-color: #bfefc4;">
                                <div class="card-body p-4">
                                    <div class="row">
                                        <div class="col-8">
                                            <h5 class="card-title widget-card-title mb-3">
                                                Đã Mua
                                            </h5>
                                            <h4 class="card-subtitle text-body-secondary m-0">
                                                ${amountS} Sản phẩm
                                            </h4>
                                        </div>
                                        <div class="col-4">
                                            <div class="d-flex justify-content-end">
                                                <i class="fa-solid fa-circle-check" style="font-size: 50px"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-sm-6">
                            <div class="card widget-card border-light shadow-sm" style="background-color: #f9c9cd;">
                                <div class="card-body p-4">
                                    <div class="row">
                                        <div class="col-8">
                                            <h5 class="card-title widget-card-title mb-3">
                                                Đã Hủy
                                            </h5>
                                            <h4 class="card-subtitle text-body-secondary m-0">
                                                ${amountC} Sản phẩm
                                            </h4>
                                        </div>
                                        <div class="col-4">
                                            <div class="d-flex justify-content-end">
                                                <i class="fa-solid fa-xmark" style="font-size: 50px"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-sm-1"></div>
            </div>

        </div>

        <%@include file="common/footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath()%>/js/profile.js"></script>

    </body>
</html>
