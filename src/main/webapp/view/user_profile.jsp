<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>LovePik | Cài đặt</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/profile.css" />

    </head>
    <body style="background-color: antiquewhite;">
        <div class="container bootstrap snippet" style="width: 1500px;">
            <div class="row">
                <div class="col-sm-8 acc" style="padding-left: 20px;">
                    <h2 style="font-weight: bold;">${sessionScope.user.fullName}</h2>
                </div>

                <div class="col-sm-2">
                    <button class="return">
                        <a href="home">Quay về Trang chủ</a>
                    </button>
                </div>

                <div class="col-sm-2">
                    <button class="return">
                        <a href="logout">Đăng xuất</a>
                    </button>
                </div>

            </div>
            <div class="row infor">
                <div class="col-sm-2">
                    <div class="panel panel-default">
                        <div class="panel-heading"style="background-color: orange;">
                            Website <i class="fa fa-link fa-1x"></i>
                        </div>

                        <div class="panel-body shop-name">
                            <a href="home">LovePik</a>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color: orange;">Hoạt Động</div>

                        <li class="list-group-item text-right">
                            <span class="pull-left">
                                <strong>
                                    <a class="cart" href="#">Giỏ Hàng</a>
                                </strong>
                            </span> 0
                        </li>

                        <li class="list-group-item text-right">
                            <span class="pull-left">
                                <strong>Đã Mua</strong>
                            </span> ${amountS}
                        </li>

                        <li class="list-group-item text-right">
                            <span class="pull-left">
                                <strong>Đã Hủy</strong>
                            </span> ${amountC}
                        </li>
                    </div>
                </div>


                <div class="col-sm-10" style="background-color: white!important;">
                    <ul class="nav nav-tabs" style="margin-top: 30px; ">
                        <li class="active">
                            <a data-toggle="tab" href="#home">Thông tin </a>
                        </li>

                        <li>
                            <a data-toggle="tab" href="#history">Lịch sử mua hàng</a>
                        </li>

                        <li>
                            <a data-toggle="tab" href="#changeInfo">Chỉnh sửa thông tin</a>
                        </li>

                        <li>
                            <a data-toggle="tab" href="#changePass">Đổi mật khẩu</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane active" id="home">

                            <form class="form" action="" method="post" id="registrationForm">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="first_name">
                                            <h4>Họ và Tên</h4>
                                        </label>

                                        <input disabled="" type="text" class="form-control" name="first_name" id="first_name" value="${sessionScope.user.fullName}"  style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="phone">
                                            <h4>Năm Sinh</h4>
                                        </label>

                                        <input disabled="" type="text" class="form-control" name="phone" id="phone" value="${sessionScope.user.yearOfBirth}" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="phone">
                                            <h4>Giới Tính</h4>
                                        </label>

                                        <input disabled="" type="text" class="form-control" name="phone" id="phone" value="${sessionScope.user.gender.toString() == 'male' ? 'Nam' : 'Nữ'}" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="email">
                                            <h4>Email</h4>
                                        </label>

                                        <input disabled="" type="email" class="form-control" name="email" id="email" value="${sessionScope.user.email}" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="mobile">
                                            <h4>Số Điện Thoại</h4>
                                        </label>

                                        <input disabled="" type="text" class="form-control" name="mobile" id="mobile" value="${sessionScope.user.phone_number}" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="mobile">
                                            <h4>Địa chỉ</h4>
                                        </label>

                                        <input disabled="" type="text" class="form-control" name="mobile" id="mobile" value="${sessionScope.user.address}" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6 align-items-center"  style="margin-bottom: 30px;">
                                        <br />
                                        <button class="btn btn-lg btn-success col-xs-12" onclick="activateTab('changeInfo')" type="button">
                                            Chỉnh sửa thông tin
                                        </button>
                                    </div>

                                    <div class="col-xs-6 align-items-center"  style="margin-bottom: 30px;">
                                        <br />
                                        <button class="btn btn-lg btn-success col-xs-12" onclick="activateTab('changePass')" type="button">
                                            Đổi mật khẩu
                                        </button>
                                    </div>
                                </div>   

                            </form>

                        </div>

                        <div class="tab-pane" id="history">

                            <div class="container" style="width: 100%; margin: 15px 10px 0px; text-align: center;">

                                <div class="row flex-lg-nowrap" style="width: 100%;">

                                    <div class="col mb-3">

                                        <div class="card-body">

                                            <div class="e-table">

                                                <div class="table-responsive table-lg mt-3">

                                                    <table class="table table-bordered text-center">
                                                        <thead>
                                                            <tr>
                                                                <th style="text-align: center;">Ảnh Sản Phẩm</th>
                                                                <th class="max-width" style="text-align: center;">Tên Sản Phẩm</th>
                                                                <th class="" style="text-align: center;">Số Lượng</th>
                                                                <th class="" style="text-align: center;">Giá</th>
                                                                <th class="sortable" style="text-align: center;">Thanh toán</th>
                                                                <th class="sortable" style="text-align: center;">Trạng Thái</th>
                                                                <th class="sortable" style="text-align: center;">Ngày Mua</th>
                                                            </tr>
                                                        </thead>

                                                        <c:forEach items="${listHB}" var="b">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="align-middle text-center">
                                                                        <div
                                                                            class="bg-light d-inline-flex justify-content-center align-items-center align-top ban"
                                                                            style="
                                                                            width: 100px;
                                                                            height: 110px;
                                                                            border-radius: 5px;
                                                                            background-image: url(<%=request.getContextPath()%>/${b.bannersP});
                                                                            background-size: 100px 110px;
                                                                            background-repeat: no-repeat;
                                                                            margin: 7px auto;
                                                                            ">                                                                            
                                                                        </div>
                                                                    </td>

                                                                    <td class="text-nowrap" style="vertical-align: middle;">${b.nameP}</td>

                                                                    <td class="text-nowrap" style="vertical-align: middle;">
                                                                        <span>${b.amountP}</span>
                                                                    </td>

                                                                    <td class="text-center" style="vertical-align: middle;">
                                                                        <span>
                                                                            <script>
                                                                                var formattedPrice = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(${b.totalPriceP});
                                                                                document.write(formattedPrice);
                                                                            </script>
                                                                        </span>
                                                                    </td>

                                                                    <td class="text-center" style="vertical-align: middle;">
                                                                        <span>${b.paymentP.toString() == 'MoMo' ? 'MoMo' : 'Thanh toán khi nhận hàng'}</span>
                                                                    </td>

                                                                    <td class="text-center" style="vertical-align: middle;">
                                                                        <c:if test="${b.statusP.toString() == 'processing'}">
                                                                            <span class="badge bg-info">Chờ xử lý</span>
                                                                        </c:if>
                                                                        <c:if test="${b.statusP.toString() == 'shipping'}">
                                                                            <span class="badge bg-warning">Đang vận chuyển</span>
                                                                        </c:if>
                                                                        <c:if test="${b.statusP.toString() == 'done'}">
                                                                            <span class="badge bg-success">Đã hoàn thành</span>
                                                                        </c:if>
                                                                        <c:if test="${b.statusP.toString() == 'canceled'}">
                                                                            <span class="badge bg-danger">Đã hủy</span>
                                                                        </c:if>
                                                                    </td>

                                                                    <td class="text-center" style="vertical-align: middle;">
                                                                        <span>${b.createAtP}</span>
                                                                    </td>

                                                                </tr>

                                                            </tbody>
                                                        </c:forEach>


                                                    </table>

                                                </div>
                                                <div class="d-flex justify-content-center pag" style="align-items: center;">
                                                    <c:forEach begin="1" end="${endP}" var="i">
                                                        <a class="page-item ${index == i ? "active": ""}" href="${pageContext.request.contextPath}/profile?index=${i}">${i}</a>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane" id="changeInfo">

                            <form class="form" action="profile" method="post" id="changeInfoForm">                                     
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="first_name">
                                            <h4>Họ và Tên</h4>
                                        </label>

                                        <input type="text" class="form-control" name="fullName" id="fullName" value="${sessionScope.user.fullName}"  style="font-size: 18px;" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="phone">
                                            <h4>Năm Sinh</h4>
                                        </label>

                                        <input type="text" class="form-control" name="yearOfBirth" id="yearOfBirth" value="${sessionScope.user.yearOfBirth}" style="font-size: 18px;" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="phone">
                                            <h4>Giới Tính</h4>
                                        </label>

                                        <div class="row" style="margin-top: 0;">                                                             
                                            <div class="form-check col-sm-2">
                                                <input class="form-check-input" type="radio" name="gender" id="gridRadios1" value="male" ${sessionScope.user.gender.toString() == 'male' ? 'checked' : ''}>
                                                <label class="form-check-label" for="gridRadios1">
                                                    Nam
                                                </label>
                                            </div>
                                            <div class="form-check col-sm-2">
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

                                        <input disabled type="email" class="form-control" name="email" id="email" value="${sessionScope.user.email}" style="font-size: 18px;" required/>
                                    </div>
                                </div>

                                <div id="error-message" class="text-danger err">${errEmail}</div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="mobile">
                                            <h4>Số Điện Thoại</h4>
                                        </label>

                                        <input type="text" class="form-control" name="phoneNumber" id="phoneNumber" value="${sessionScope.user.phone_number}" style="font-size: 18px;" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="mobile">
                                            <h4>Địa chỉ</h4>
                                        </label>

                                        <input type="text" class="form-control" name="address" id="address" value="${sessionScope.user.address}" style="font-size: 18px;" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="mobile">
                                            <h4>Xác nhận Mật khẩu</h4>
                                        </label>

                                        <input type="password" class="form-control" name="password" id="password" value="" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div id="error-message" class="text-danger err">${errPass}</div>

                                <div class="form-group">
                                    <div class="col-xs-6"  style="margin-bottom: 30px;">
                                        <br />
                                        <button class="btn btn-lg btn-success col-xs-12" type="submit">
                                            <i class=""></i> Lưu thay đổi
                                        </button>
                                    </div>

                                    <div class="col-xs-6"  style="margin-bottom: 30px;">
                                        <br />
                                        <button class="btn btn-lg btn-cancel col-xs-12" type="button">
                                            <i class=""></i> Hủy thay đổi
                                        </button>
                                    </div>

                                </div>   

                            </form>

                        </div>

                        <div class="tab-pane" id="changePass">

                            <form class="form" action="" method="post" id="registrationForm">                                     

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="mobile">
                                            <h4>Mật khẩu cũ</h4>
                                        </label>

                                        <input type="password" class="form-control" name="password" id="password" value="" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="mobile">
                                            <h4>Mật khẩu mới</h4>
                                        </label>

                                        <input type="text" class="form-control" name="newPassword" id="newPassword" value="" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="mobile">
                                            <h4>Nhập lại Mật khẩu mới</h4>
                                        </label>

                                        <input type="text" class="form-control" name="rePassword" id="rePassword" value="" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6"  style="margin-bottom: 30px;">
                                        <br />
                                        <button class="btn btn-lg btn-success col-xs-12" type="button">
                                            <i class=""></i> Lưu thay đổi
                                        </button>
                                    </div>

                                    <div class="col-xs-6"  style="margin-bottom: 30px;">
                                        <br />
                                        <button class="btn btn-lg btn-cancel col-xs-12" type="button">
                                            <i class=""></i> Hủy thay đổi
                                        </button>
                                    </div>

                                </div>   

                            </form>

                        </div>

                    </div>

                </div>

            </div>

        </div>

        <script src="<%=request.getContextPath()%>/js/profile.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
