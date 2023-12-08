<%@page import="com.bakaqc.flower.model.Product"%>
<%@page import="com.bakaqc.flower.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>LovePik | Thanh toán</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">   
        <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.3/components/cards/card-1/assets/css/card-1.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/profile.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/home.css" />

        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/img/icon_web.png">

    </head>
    <body>
        <%@include file="common/header.jsp" %>

        <div class="container">
            <div class="row infor">
                <div class="col-sm-1"></div>

                <div class="col-sm-10">
                    <h3 style="text-align: center;">Thanh toán</h3>

                    <!--<h4 style="color: green; text-align: center;">${success}</h4>-->

                    <div class="container infor" style="padding: 0;">

                        <form class="form" action="payment" method="post" id="registrationForm">

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <label for="first_name">
                                        <h4>Họ và Tên</h4>
                                    </label>

                                    <input disabled="" type="text" class="form-control" name="first_name" id="first_name" value="${sessionScope.user.fullName}"  style="font-size: 18px;"/>
                                </div>
                            </div>

                            <div class="form-group mt-4">
                                <div class="col-xs-6">
                                    <label for="mobile">
                                        <h4>Số Điện Thoại</h4>
                                    </label>

                                    <input disabled="" type="text" class="form-control" name="mobile" id="mobile" value="${sessionScope.user.phone_number}" style="font-size: 18px;"/>
                                </div>
                            </div>

                            <div class="form-group mt-4">
                                <div class="col-xs-12">
                                    <label for="mobile">
                                        <h4>Địa chỉ</h4>
                                    </label>

                                    <input disabled="" type="text" class="form-control" name="mobile" id="mobile" value="${sessionScope.user.address}" style="font-size: 18px;"/>
                                </div>
                            </div>
                                
                            <div class="form-group mt-4">
                                <div class="col-xs-12">
                                    <label for="mobile">
                                        <h4>Hình thức thanh toán</h4>
                                    </label>

                                    <input disabled="" type="text" class="form-control" name="mobile" id="mobile" value="Thanh toán khi nhận hàng" style="font-size: 18px;"/>
                                </div>
                            </div>

                            <c:if test="${sessionScope.cart.size() > 0}">
                                <%
                                    Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

                                    int totalPrice = 0;
                                    for (Integer key : cart.keySet()) {
                                        Integer value = cart.get(key);

                                        Product product = ProductDAO.getInstance().getById(key);
                                        String nameCAT = ProductDAO.getInstance().getNameCAT(key);
                                        int total = product.getPrice() * value;
                                        totalPrice += total;
                                    }
                                %>

                                <h2 style="margin-top: 40px; text-align: end;">Tổng tiền: 
                                    <script>
                                        var formattedPrice = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(<%=totalPrice%>);
                                        document.write(formattedPrice);
                                    </script>
                                </h2>
                            </c:if>
                            <div class="row mt-4">
                                <div class="form-group col-6">
                                    <div class="col-xs-12 align-items-center">
                                        <br />
                                        <a href="${pageContext.request.contextPath}/edit_profile"> 
                                            <button class="btn btn-lg btn-success col-12" type="button">
                                                Chỉnh sửa thông tin
                                            </button>
                                        </a>
                                    </div>
                                </div>

                                <div class="form-group col-6">
                                    <div class="col-xs-12 align-items-center">
                                        <br />                               
                                        <button class="btn btn-lg btn-success col-12" type="submit">
                                            Thanh toán
                                        </button>
                                    </div>
                                </div>   

                                <div class="form-group col-12">
                                    <div class="col-xs-12 align-items-center"  style="margin-bottom: 30px;">
                                        <a href="cart"> 
                                            <button class="btn btn-lg btn-danger col-12" type="button">
                                                Quay lại giỏ hàng
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
