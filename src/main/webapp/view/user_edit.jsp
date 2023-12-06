<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>LovePik | Chỉnh sửa thông tin</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">   
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/home.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/profile.css" />


    </head>
    <body>
        <%@include file="common/header.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-sm-1"></div>

                <div class="col-sm-10">
                    <h3 style="text-align: center;">Chỉnh sửa thông tin</h3>

                    <div class="container infor">
                        <form class="form" action="edit_profile" method="post" id="changeInfoForm">     

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <label for="first_name">
                                        <h4>Họ và Tên</h4>
                                    </label>

                                    <input type="text" class="form-control" name="fullName" id="fullName" style="font-size: 18px;" required value="${sessionScope.user.fullName}"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-6">
                                    <div class="col-xs-12">
                                        <label for="phone">
                                            <h4>Năm Sinh</h4>
                                        </label>

                                        <input type="number" class="form-control" name="yearOfBirth" id="yearOfBirth" style="font-size: 18px;" required value="${sessionScope.user.yearOfBirth}"/>

                                        <div id="error-message" class="text-danger err" style="margin-bottom: 15px;">${errorNewYear}</div>
                                    </div>
                                </div>

                                <div class="form-group col-6">
                                    <div class="col-xs-12">
                                        <label for="phone">
                                            <h4>Giới Tính</h4>
                                        </label>

                                        <div class="row" style="margin-top: 7px; margin-left: 0.5rem">                                                             
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
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <label for="email">
                                        <h4>Email</h4>
                                    </label>

                                    <input disabled type="email" class="form-control" name="email" id="email" style="font-size: 18px;" required value="${sessionScope.user.email}"/>                           
                                </div>
                            </div>



                            <div class="form-group">
                                <div class="col-xs-12">
                                    <label for="mobile">
                                        <h4>Số Điện Thoại</h4>
                                    </label>

                                    <input type="text" class="form-control" name="phoneNumber" id="phoneNumber" style="font-size: 18px;" required value="${sessionScope.user.phone_number}"/>

                                    <div id="error-message" class="text-danger err" style="margin-bottom: 15px;">${errorNewPhone}</div>
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
                                    
                                    <div id="error-message" class="text-danger err" style="margin-bottom: 15px;">${errorMissingNewPass}</div>
                                    <div id="error-message" class="text-danger err" style="margin-bottom: 15px;">${errPass}</div>
                                </div>


                            </div>

                            <div class="row">
                                <div class="form-group col-6">
                                    <div class="col-xs-12 save"  style="margin-bottom: 30px;">                      
                                        <button class="btn btn-lg btn-success col-12 save" type="submit">
                                            <i class=""></i> Lưu thay đổi
                                        </button>
                                    </div>
                                </div>
                                <div class="form-group col-6">
                                    <div class="col-xs-12 can"  style="margin-bottom: 30px;">                            
                                        <a href="${pageContext.request.contextPath}/profile"> 
                                            <button class="btn btn-lg col-12 can" type="button" style="background-color: red; color: white;">
                                                <i class=""></i> Hủy thay đổi
                                            </button>
                                        </a>
                                    </div>
                                </div>   
                            </div>   

                        </form>

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
