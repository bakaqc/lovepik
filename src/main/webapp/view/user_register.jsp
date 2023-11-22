<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="com.bakaqc.flower.controller.UserRegister"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng Kí User</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/register.css" />
        <script type="text/javascript">
            function redirectToLoginPage() {
                window.location = "user_login.jsp";
            }
        </script>
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

                                    <form>
                                        <%if (request.getAttribute("gmass") != null) {%>
                                        <p style="color: red"><%=request.getAttribute("gmass")%></p>
                                        <% }%>
                                        <div class="form-outline mb-4">
                                            <input type="text" name="fullname" id="form3Example1cg" class="form-control form-control-lg" />
                                            <label class="form-label" for="form3Example1cg">Tên</label>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <input type="text" name="yearOfBirth" id="form3Example3cg" class="form-control form-control-lg" />
                                            <label class="form-label" for="form3Example3cg">Năm Sinh</label>
                                        </div>
                                        <div class="form-outline mb-4 gen">

                                            <p class="mb-2 pb-1">Giới Tính </p>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="femaleGender"
                                                       value="option1" checked />
                                                <label class="form-check-label" for="femaleGender">Nữ</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="maleGender"
                                                       value="option2" />
                                                <label class="form-check-label" for="maleGender">Nam</label>
                                            </div>


                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="text" name="address" id="form3Example4cdg" class="form-control form-control-lg" />
                                            <label class="form-label" for="form3Example4cdg">Địa Chỉ</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="text" name="email" id="form3Example3cg" class="form-control form-control-lg" />
                                            <label class="form-label" for="form3Example3cg">Email</label>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <input type="text" name="password" id="form3Example4cg" class="form-control form-control-lg" />
                                            <label class="form-label" for="form3Example4cg">Mật Khẩu</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="text" name="password" id="form3Example4cg" class="form-control form-control-lg" />
                                            <label class="form-label" for="form3Example4cg">Nhập lại Mật Khẩu</label>
                                        </div>



                                        <div class="d-flex justify-content-center">
                                            <button type="button"
                                                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" action="userregister" method="post" style="background-color: orange; font-weight: bold;">Đăng Kí Ngay</button>
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
    </body>
</html>