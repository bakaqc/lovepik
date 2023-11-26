<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.bakaqc.flower.controller.AdminController"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LovePik | Đăng Nhập Admin</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/login.css" />

    </head>
    <body>
        <section class="vh-100 gradient-custom">

            <div class="container py-5 h-100">

                <div class="row d-flex justify-content-center align-items-center h-100">

                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">

                        <div class="card bg-dark text-white form-login" style="border-radius: 1rem;border:solid 5px white;">

                            <div class="card-body p-5 text-center"style="border-radius: 1rem;background-color: antiquewhite;border:solid 5px white;">

                                <form action="admin_login" method="post" > 

                                    <div class="mb-md-5 mt-md-4 pb-5">

                                        <h2 class="fw-bold mb-2 text-uppercase">Đăng Nhập Admin</h2>
                                        <p class="text-black-50 mb-5">Vui lòng nhập Tài khoản và Mật khẩu!</p>

                                        <div class="form-outline form-white mb-4">
                                            <label class="form-label" for="typeEmailX" style="color: black">Tài khoản</label>
                                            <input type="username" name="username" id="typeEmailX" class="form-control form-control-lg" required value="${username}" />

                                        </div>

                                        <div class="form-outline form-white mb-4">
                                            <label class="form-label" for="typePasswordX" style="color: black">Mật khẩu</label>
                                            <input type="password" name="password" id="typePasswordX" class="form-control form-control-lg" />

                                        </div>

                                        <div id="error-message" class="text-danger err">${errorMsg}</div>
                                        <input class="btn btn-outline-light btn-lg px-5" type="submit"  value="Đăng Nhập Ngay" action="admin" method="post" style="font-weight: bold; color: black; background-color: orange;"/>

                                    </div>

                                </form>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>
    </body>
</html>