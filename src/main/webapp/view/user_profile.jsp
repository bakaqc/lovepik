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
                    <ul class="nav nav-tabs" style="margin-top: 40px; ">
                        <li class="active">
                            <a data-toggle="tab" href="#home">Thông tin </a>
                        </li>

                        <li>
                            <a data-toggle="tab" href="#history">Lịch sử mua hàng</a>
                        </li>

                        <li>
                            <a data-toggle="tab" href="#change">Chỉnh sửa thông tin</a>
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

                                        <input type="text" class="form-control" name="first_name" id="first_name" value="${sessionScope.user.fullName}"  style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="phone">
                                            <h4>Năm Sinh</h4>
                                        </label>

                                        <input type="text" class="form-control" name="phone" id="phone" value="${sessionScope.user.yearOfBirth}" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="phone">
                                            <h4>Giới Tính</h4>
                                        </label>

                                        <input type="text" class="form-control" name="phone" id="phone" value="${sessionScope.user.gender}" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="email">
                                            <h4>Email</h4>
                                        </label>

                                        <input type="email" class="form-control" name="email" id="email" value="${sessionScope.user.email}" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="mobile">
                                            <h4>Số Điện Thoại</h4>
                                        </label>

                                        <input type="text" class="form-control" name="mobile" id="mobile" value="${sessionScope.user.phone_number}" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="mobile">
                                            <h4>Địa chỉ</h4>
                                        </label>

                                        <input type="text" class="form-control" name="mobile" id="mobile" value="${sessionScope.user.address}" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-4 align-items-center"  style="margin-bottom: 40px;">
                                        <br />
                                        <button class="btn btn-lg btn-success col-xs-12" type="submit">
                                            <i class=""></i> Chỉnh sửa thông tin
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
                                                                <th>Ảnh Sản Phẩm</th>
                                                                <th class="max-width">Tên Sản Phẩm</th>
                                                                <th class="">Số Lượng</th>
                                                                <th class="sortable">Ngày Mua</th>
                                                                <th class="sortable">Trạng Thái</th>
                                                                <th class="">Giá</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <tr>
                                                                <td class="align-middle text-center">
                                                                    <div
                                                                        class="bg-light d-inline-flex justify-content-center align-items-center align-top ban"
                                                                        style="
                                                                        width: 135px;
                                                                        height: 150px;
                                                                        border-radius: 5px;
                                                                        background-image: url(./img/product_img/hoa-hong.png);
                                                                        background-size: 135px 150px;
                                                                        background-repeat: no-repeat;
                                                                        margin: 7px auto;
                                                                        ">                                                                            
                                                                    </div>
                                                                </td>

                                                                <td class="text-nowrap align-middle">Hoa Hồng</td>

                                                                <td class="text-nowrap align-middle">
                                                                    <span>1</span>
                                                                </td>

                                                                <td class="text-center align-middle">
                                                                    <span>13:30 27/11/2023</span>
                                                                </td>

                                                                <td class="text-center align-middle">
                                                                    <span>Shipping</span>
                                                                </td>

                                                                <td class="text-center align-middle">
                                                                    <span>400.000đ</span>
                                                                </td>

                                                            </tr>

                                                        </tbody>

                                                        <tbody>
                                                            <tr>
                                                                <td class="align-middle text-center">
                                                                    <div
                                                                        class="bg-light d-inline-flex justify-content-center align-items-center align-top ban"
                                                                        style="
                                                                        width: 135px;
                                                                        height: 150px;
                                                                        border-radius: 5px;
                                                                        background-image: url(./img/product_img/hoa-hong.png);
                                                                        background-size: 135px 150px;
                                                                        background-repeat: no-repeat;
                                                                        margin: 7px auto;
                                                                        ">                                                                            
                                                                    </div>
                                                                </td>

                                                                <td class="text-nowrap align-middle">Hoa Hồng</td>

                                                                <td class="text-nowrap align-middle">
                                                                    <span>1</span>
                                                                </td>

                                                                <td class="text-center align-middle">
                                                                    <span>13:30 27/11/2023</span>
                                                                </td>

                                                                <td class="text-center align-middle">
                                                                    <span>Shipping</span>
                                                                </td>

                                                                <td class="text-center align-middle">
                                                                    <span>400.000đ</span>
                                                                </td>

                                                            </tr>

                                                        </tbody>

                                                        <tbody>
                                                            <tr>
                                                                <td class="align-middle text-center">
                                                                    <div
                                                                        class="bg-light d-inline-flex justify-content-center align-items-center align-top ban"
                                                                        style="
                                                                        width: 135px;
                                                                        height: 150px;
                                                                        border-radius: 5px;
                                                                        background-image: url(./img/product_img/hoa-hong.png);
                                                                        background-size: 135px 150px;
                                                                        background-repeat: no-repeat;
                                                                        margin: 7px auto;
                                                                        ">                                                                            
                                                                    </div>
                                                                </td>

                                                                <td class="text-nowrap align-middle">Hoa Hồng</td>

                                                                <td class="text-nowrap align-middle">
                                                                    <span>1</span>
                                                                </td>

                                                                <td class="text-center align-middle">
                                                                    <span>13:30 27/11/2023</span>
                                                                </td>

                                                                <td class="text-center align-middle">
                                                                    <span>Shipping</span>
                                                                </td>

                                                                <td class="text-center align-middle">
                                                                    <span>400.000đ</span>
                                                                </td>

                                                            </tr>

                                                        </tbody>

                                                    </table>

                                                </div>
                                                <div class="d-flex justify-content-center" style="align-items: center;">
                                                    <ul class="pagination mt-3 mb-0">
                                                        <li class="disabled page-item">
                                                            <a href="#" class="page-link">‹</a>
                                                        </li>
                                                        <li class="active page-item">
                                                            <a href="#" class="page-link">1</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a href="#" class="page-link">2</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a href="#" class="page-link">3</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a href="#" class="page-link">›</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane" id="change">

                            <form class="form" action="" method="post" id="registrationForm">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="first_name">
                                            <h4>Họ và Tên</h4>
                                        </label>

                                        <input type="text" class="form-control" name="first_name" id="first_name" value="${sessionScope.user.fullName}"  style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="phone">
                                            <h4>Năm Sinh</h4>
                                        </label>

                                        <input type="text" class="form-control" name="phone" id="phone" value="${sessionScope.user.yearOfBirth}" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="phone">
                                            <h4>Giới Tính</h4>
                                        </label>

                                        <input type="text" class="form-control" name="phone" id="phone" value="${sessionScope.user.gender}" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="email">
                                            <h4>Email</h4>
                                        </label>

                                        <input type="email" class="form-control" name="email" id="email" value="${sessionScope.user.email}" style="font-size: 18px;"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="mobile">
                                            <h4>Số Điện Thoại</h4>
                                        </label>

                                        <input type="text" class="form-control" name="mobile" id="mobile" value="${sessionScope.user.phone_number}" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="mobile">
                                            <h4>Địa chỉ</h4>
                                        </label>

                                        <input type="text" class="form-control" name="mobile" id="mobile" value="${sessionScope.user.address}" style="font-size: 18px;"/>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <div class="col-xs-4">
                                        <label for="mobile">
                                            <h4>Mật khẩu cũ</h4>
                                        </label>

                                        <input type="password" class="form-control" name="mobile" id="mobile" value="" style="font-size: 18px;"/>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <div class="col-xs-4">
                                        <label for="mobile">
                                            <h4>Mật khẩu mới</h4>
                                        </label>

                                        <input type="text" class="form-control" name="mobile" id="mobile" value="" style="font-size: 18px;"/>
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <div class="col-xs-4">
                                        <label for="mobile">
                                            <h4>Nhập lại Mật khẩu mới</h4>
                                        </label>

                                        <input type="text" class="form-control" name="mobile" id="mobile" value="" style="font-size: 18px;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-4"  style="margin-bottom: 40px;">
                                        <br />
                                        <button class="btn btn-lg btn-success col-xs-12" type="submit">
                                            <i class=""></i> Lưu thay đổi
                                        </button>
                                    </div>

                                </div>   

                            </form>

                        </div>

                    </div>

                </div>

            </div>

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>