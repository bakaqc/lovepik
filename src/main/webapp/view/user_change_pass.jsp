<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>LovePik | Đổi mật khẩu</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">   
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/home.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/profile.css" />


    </head>
    <body>
        <%@include file="common/header.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-sm-4"></div>

                <div class="col-sm-4">
                    <h3 style="text-align: center;">Đổi mật khẩu</h3>

                    <div class="container infor">
                        <form class="form" action="change_pass" method="post" id="changeInfoForm">          

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
                                    <div id="error-message" class="text-danger err">${errGotPass}</div>
                                    <div id="error-message" class="text-danger err">${errOldPass}</div>
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

                            <div class="row mt-3">

                                <div class="form-group col-6">
                                    <div class="col-xs-12 save">
                                        <br />
                                        <button class="btn btn-lg btn-success col-12 save" type="submit">
                                            Đổi mật khẩu
                                        </button>
                                    </div>
                                </div>  
                                <div class="form-group col-6">
                                    <div class="col-xs-12 can"  style="margin-bottom: 30px;">
                                        <br />
                                        <a href="${pageContext.request.contextPath}/profile"> 
                                            <button class="btn btn-lg col-12 can" type="button" style="background-color: red; color: white;">
                                                Hủy thay đổi
                                            </button>
                                        </a>
                                    </div>
                                </div>  

                            </div>

                        </form>

                    </div>
                </div>

                <div class="col-sm-4"></div>
            </div>

        </div>

        <%@include file="common/footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath()%>/js/profile.js"></script>

    </body>
</html>
