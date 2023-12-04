<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="com.bakaqc.flower.controller.UserRegister"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LovePik | Đăng Kí User</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/register.css" />

    </head>
    <body>
        <section class="vh-100 bg-image">

            <div class="mask d-flex align-items-center h-100 gradient-custom-3">

                <div class="container h-100">

                    <div class="row d-flex justify-content-center align-items-center h-100">

                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">

                            <div class="card" style="border-radius: 15px;background-color: antiquewhite;">

                                <div class="card-body p-5">

                                    <h2 class="fw-bold text-uppercase text-center mb-5">Đăng Kí User</h2>

                                    <form id="register-form" action="register" method="post">

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form3Example1cg">Họ và Tên</label>
                                            <input name="fullname" type="text"  id="fullname" class="form-control form-control-lg" required value="${fullName}"/>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form3Example3cg">Năm Sinh</label>
                                            <input name="yearOfBirth" type="number" id="yearOfBirth" min="1900" max="2023" maxlength="4" minlength="4" class="form-control form-control-lg" required value="${yearOfBirth}"/>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label for="gender">Giới tính<span class="text-danger"></span></label>

                                            <select name="gender" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" style="margin-top: 8px;">
                                                <option value="male">Nam</option>
                                                <option value="female">Nữ</option>
                                            </select>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form3Example4cdg">Địa Chỉ</label>
                                            <input name="address" type="text" id="address" class="form-control form-control-lg" required value="${address}"/>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form3Example4cdg">Số Điện Thoại</label>
                                            <input name="phone_number" type="number" id="phone_number" class="form-control form-control-lg" required value="${phoneNumber}"/>
                                            
                                            <!--<div id="phone_error" class="error hidden" style="margin-left: 15px; color: red;">Please enter a valid phone number</div>-->
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form3Example3cg">Email</label>
                                            <input name="email" type="email" id="email" class="form-control form-control-lg" required value="${email}"/>

                                            <div id="error-message" class="text-danger err" style="color: red;">${errorEmail}</div>
                                        </div>



                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form3Example4cg">Mật Khẩu</label>
                                            <input name="password" type="password" id="form3Example4cg" class="form-control form-control-lg" required/>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form3Example4cg">Nhập lại Mật Khẩu</label>
                                            <input name="re-password" type="password" id="form3Example4cg" class="form-control form-control-lg" required/>

                                            <div id="error-message" class="text-danger err" style="color: red;">${errorPass}</div>
                                        </div>



                                        <div class="d-flex justify-content-center">
                                            <button type="submit"                                                  
                                                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" 
                                                    style="background-color: orange; font-weight: bold;">Đăng Kí Ngay
                                            </button>
                                        </div>

                                        <p class="text-center text-muted mt-5 mb-0 login-here-pr">Đã có tài khoản? 
                                            <button onclick="redirectToLoginPage()"><a href="login"class="fw-bold text-body login-here">Đăng Nhập Ngay</a></button>
                                        </p>

                                    </form>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <script src="<%=request.getContextPath()%>/js/register.js"></script>
    </body>
</html>