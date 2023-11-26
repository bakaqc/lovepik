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
    <body>
        <div class="container bootstrap snippet">
            <div class="row">
                <div class="col-sm-8 acc">
                    <h2>${sessionScope.user.fullName}</h2>
                </div>

                <div class="col-sm-2">
                    <button class="return">
                        <a href="logout">Đăng xuất</a>
                    </button>
                </div>

                <div class="col-sm-2">
                    <button class="return">
                        <a href="home">Quay về Trang chủ</a>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Website <i class="fa fa-link fa-1x"></i>
                        </div>

                        <div class="panel-body shop-name">
                            <a href="home">LovePik</a>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">Hoạt Động</div>

                        <li class="list-group-item text-right">
                            <span class="pull-left">
                                <strong>
                                    <a class="cart" href="#">Giỏ Hàng</a>
                                </strong>
                            </span> 5
                        </li>

                        <li class="list-group-item text-right">
                            <span class="pull-left">
                                <strong>Đã Mua</strong>
                            </span> 10
                        </li>

                        <li class="list-group-item text-right">
                            <span class="pull-left">
                                <strong>Đã Hủy</strong>
                            </span> 0
                        </li>
                    </div>
                </div>


                <div class="col-sm-9">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a data-toggle="tab" href="#home">Thông tin </a>
                        </li>

                        <li>
                            <a data-toggle="tab" href="#history">Lịch sử mua hàng</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane active" id="home">

                            <form class="form" action="##" method="post" id="registrationForm">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="first_name">
                                            <h4>Họ và Tên</h4>
                                        </label>

                                        <input type="text" class="form-control" name="first_name" id="first_name" value="${sessionScope.user.fullName}" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="phone">
                                            <h4>Năm Sinh</h4>
                                        </label>

                                        <input type="text" class="form-control" name="phone" id="phone" value="${sessionScope.user.yearOfBirth}" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="phone">
                                            <h4>Giới Tính</h4>
                                        </label>

                                        <input type="text" class="form-control" name="phone" id="phone" value="${sessionScope.user.gender}" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="mobile">
                                            <h4>Địa chỉ</h4>
                                        </label>

                                        <input type="text" class="form-control" name="mobile" id="mobile" value="${sessionScope.user.address}" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="mobile">
                                            <h4>Số Điện Thoại</h4>
                                        </label>

                                        <input type="text" class="form-control" name="mobile" id="mobile" value="${sessionScope.user.phone_number}" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="email">
                                            <h4>Email</h4>
                                        </label>

                                        <input type="email" class="form-control" name="email" id="email" value="${sessionScope.user.email}" />
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <div class="col-xs-6">
                                        <br />
                                        <button class="btn btn-lg btn-success col-xs-12" type="submit">
                                            <i class=""></i> Chỉnh sửa thông tin
                                        </button>
                                    </div>

                                    <div class="col-xs-6">
                                        <br />
                                        <button class="btn btn-lg btn-success col-xs-12" type="submit">
                                            <i class=""></i> Đổi mật khẩu
                                        </button>
                                    </div>
                                </div>   
                                    
                            </form>

                        </div>

                        <div class="tab-pane" id="history">

<!--                            <form class="form" action="##" method="post" id="registrationForm">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="first_name">
                                            <h4>Tên Sản Phẩm</h4>
                                        </label>

                                        <input type="text" class="form-control" name="first_name" id="first_name" placeholder="Nhập Họ và Tên"title="enter your first name if any."/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="phone">
                                            <h4>Năm Sinh</h4>
                                        </label>

                                        <input type="text" class="form-control" name="phone" id="phone" placeholder="Nhập Năm Sinh" title="enter your phone number if any." />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-6">
                                        <label for="email">
                                            <h4>Giới Tính</h4>
                                        </label>

                                        <select name="" id="" class="form-control">
                                            <option value="">Male (Nam)</option>
                                            <option value="">Female (Nữ)</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="mobile">
                                            <h4>Địa chỉ</h4>
                                        </label>

                                        <input type="text" class="form-control" name="mobile" id="mobile" placeholder="Nhập Địa Chỉ" title="enter your mobile number if any." />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="mobile">
                                            <h4>Số Điện Thoại</h4>
                                        </label>

                                        <input type="text" class="form-control" name="mobile" id="mobile" placeholder="Nhập Số Điện Thoại" title="enter your mobile number if any." />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="email">
                                            <h4>Email</h4>
                                        </label>

                                        <input type="email" class="form-control" name="email" id="email" placeholder="Nhập Email" title="enter your email." />
                                    </div>
                                </div>

                            </form>-->

                        </div>

                    </div>

                </div>

            </div>

        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
