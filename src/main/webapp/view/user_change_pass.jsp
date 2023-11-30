<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>LovePik | Đổi mật khẩu</title>

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
                <div class="col-sm-3"></div>

                <div class="col-sm-6" style="background-color: white!important;">

                    <form class="form" action="change_pass" method="post" id="changeInfoForm">     
                        <h2 style="text-align: center; font-weight: bold">Đổi mật khẩu</h2>      

                        <div class="row">
                            <div class="col-xs-3"></div>

                            <div class="col-xs-6">
                                <label class="form-label" for="form3Example4cg">
                                    <h4 style="text-align: center;">Mật khẩu cũ</h4>
                                </label>
                                <input type="password" class="form-control" name="oldPassword" id="password" style="font-size: 18px;" required/>
                                <div id="error-message" class="text-danger err">${errPass}</div>
                            </div>

                            <div class="col-xs-3"></div>
                        </div>

                        <div class="row">
                            <div class="col-xs-3"></div>  

                            <div class="col-xs-6">
                                <label class="form-label" for="form3Example4cg">
                                    <h4>Mật khẩu mới</h4>
                                </label>
                                <input type="password" class="form-control" name="newPassword" id="password" style="font-size: 18px;" required/>
                            </div>

                            <div class="col-xs-3"></div>  
                        </div>

                        <div class="row">
                            <div class="col-xs-3"></div>  

                            <div class="col-xs-6">
                                <label class="form-label" for="form3Example4cg">
                                    <h4>Xác nhận Mật khẩu mới</h4>
                                </label>
                                <input type="password" class="form-control" name="conPassword" id="password" style="font-size: 18px;" required/>
                                <div id="error-message" class="text-danger err">${errConfPass}</div>
                            </div>

                            <div class="col-xs-3"></div>  
                        </div>                           
                        <br>
                        <div class="row">
                            <div class="col-xs-3"> </div> 

                            <div class="form-group">
                                <div class="col-xs-6 save">
                                    <br />
                                    <button class="btn btn-lg btn-success col-xs-12 save" type="submit">
                                        Đổi mật khẩu
                                    </button>
                                </div>
                            </div>  

                            <div class="col-xs-3"> </div>  
                        </div>

                        <div class="row">
                            <div class="col-xs-3"> </div>  

                            <div class="form-group">
                                <div class="col-xs-6 can"  style="margin-bottom: 30px;">
                                    <br />
                                    <a href="${pageContext.request.contextPath}/profile"> 
                                        <button class="btn btn-lg btn-cancel col-xs-12 can" type="button">
                                            Hủy thay đổi
                                        </button>
                                    </a>
                                </div>
                            </div>  

                            <div class="col-xs-3"> </div>  
                        </div>
                    </form>

                </div>

                <div class="col-sm-3"></div>
            </div>

        </div>

        <script src="<%=request.getContextPath()%>/js/profile.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
