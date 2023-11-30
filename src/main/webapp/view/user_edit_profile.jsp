<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>LovePik | Chỉnh sửa thông tin</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/profile.css" />

    </head>
    <body style="background-color: antiquewhite;">
        <div class="container bootstrap snippet" style="width: 1500px;">
            <div class="row">
                <div class="col-sm-8 acc" style="padding-left: 20px;">
                    <h2 style="font-weight: bold;">Khách hàng: ${sessionScope.user.fullName}</h2>
                </div>

                <div class="col-sm-2">
                    <button class="return">
                        <a href="../home">Quay về Trang chủ</a>
                    </button>
                </div>

                <div class="col-sm-2">
                    <button class="return">
                        <a href="../logout">Đăng xuất</a>
                    </button>
                </div>

            </div>
            <br>
            <br>
            <br>
            <div class="row infor">
                <div class="col-sm-2"></div>

                <div class="col-sm-8" style="background-color: white!important;">

                    <form class="form" action="edit_profile" method="post" id="changeInfoForm">     
                        <h2 style="text-align: center; font-weight: bold">Chỉnh sửa thông tin</h2>      

                        <div class="form-group">
                            <div class="col-xs-12">
                                <label for="first_name">
                                    <h4>Họ và Tên</h4>
                                </label>

                                <input type="text" class="form-control" name="fullName" id="fullName" style="font-size: 18px;" required value="${sessionScope.user.fullName}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-6">
                                <label for="phone">
                                    <h4>Năm Sinh</h4>
                                </label>

                                <input type="text" class="form-control" name="yearOfBirth" id="yearOfBirth" style="font-size: 18px;" required value="${sessionScope.user.yearOfBirth}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-6">
                                <label for="phone">
                                    <h4>Giới Tính</h4>
                                </label>

                                <div class="row" style="margin-top: 0;">                                                             
                                    <div class="form-check col-sm-3">
                                        <input class="form-check-input" type="radio" name="gender" id="gridRadios1" value="male" ${sessionScope.user.gender.toString() == 'male' ? 'checked' : ''}>
                                        <label class="form-check-label" for="gridRadios1">
                                            Nam
                                        </label>
                                    </div>
                                    <div class="form-check col-sm-3">
                                        <input class="form-check-input" type="radio" name="gender" id="gridRadios2" value="female" ${sessionScope.user.gender.toString() == 'female' ? 'checked' : ''}>
                                        <label class="form-check-label" for="gridRadios2">
                                            Nữ
                                        </label>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-12">
                                <label for="email">
                                    <h4>Email</h4>
                                </label>

                                <input disabled type="email" class="form-control" name="email" id="email" style="font-size: 18px;" required value="${sessionScope.user.email}"/>
                            </div>
                        </div>

                        <div id="error-message" class="text-danger err">${errEmail}</div>

                        <div class="form-group">
                            <div class="col-xs-12">
                                <label for="mobile">
                                    <h4>Số Điện Thoại</h4>
                                </label>

                                <input type="text" class="form-control" name="phoneNumber" id="phoneNumber" style="font-size: 18px;" required value="${sessionScope.user.phone_number}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-12">
                                <label for="mobile">
                                    <h4>Địa chỉ</h4>
                                </label>

                                <input type="text" class="form-control" name="address" id="address" style="font-size: 18px;" required value="${sessionScope.user.address}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-12">
                                <label class="form-label" for="form3Example4cg">
                                    <h4>Xác nhận Mật khẩu</h4>
                                </label>

                                <input type="password" class="form-control" name="password" id="password" style="font-size: 18px;" required/>
                            </div>
                            <br>
                            <div id="error-message" class="text-danger err">${errPass}</div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-6 save"  style="margin-bottom: 30px;">
                                <br />
                                <button class="btn btn-lg btn-success col-xs-12 save" type="submit">
                                    <i class=""></i> Lưu thay đổi
                                </button>
                            </div>

                            <div class="col-xs-6 can"  style="margin-bottom: 30px;">
                                <br />
                                <a href="${pageContext.request.contextPath}/profile"> 
                                    <button class="btn btn-lg btn-cancel col-xs-12 can" type="button">
                                        <i class=""></i> Hủy thay đổi
                                    </button>
                                </a>
                            </div>

                        </div>   

                    </form>

                </div>

                <div class="col-sm-2"></div>
            </div>

        </div>

        <script src="<%=request.getContextPath()%>/js/profile.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
