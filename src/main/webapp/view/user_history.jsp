<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>LovePik | Lịch sử mua hàng</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">   
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/home.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/profile.css" />

        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/img/icon_web.png">
    </head>
    <body>
        <%@include file="common/header.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h3 style="text-align: center;">Lịch sử chi tiết</h3>

                    <c:if test="${!listHB.isEmpty()}">

                        <div class="container mt-4" style="width: 100%; margin: 15px 0px 0px; text-align: center; padding: 0;">

                            <div class="table table-lg mt-4">

                                <table class="table table-bordered text-center">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center; font-size: 20px;">Ảnh Sản Phẩm</th>
                                            <th class="max-width" style="text-align: center; font-size: 20px;">Tên Sản Phẩm</th>
                                            <th class="" style="text-align: center; font-size: 20px;">Số Lượng</th>
                                            <th class="" style="text-align: center; font-size: 20px;">Giá</th>
                                            <th class="sortable" style="text-align: center; font-size: 20px;">Thanh toán</th>
                                            <th class="sortable" style="text-align: center; font-size: 20px;">Trạng Thái</th>
                                            <th class="sortable" style="text-align: center; font-size: 20px;">Ngày Mua</th>
                                        </tr>
                                    </thead>

                                    <c:forEach items="${listHB}" var="b">
                                        <tbody>
                                            <tr>
                                                <td class="align-middle text-center">
                                                    <div
                                                        class="bg-light d-inline-flex justify-content-center align-items-center align-top ban"
                                                        style="
                                                        width: 110px;
                                                        height: 120px;
                                                        border-radius: 5px;
                                                        background-image: url(<%=request.getContextPath()%>/${b.bannersP});
                                                        background-size: 110px 120px;
                                                        background-repeat: no-repeat;
                                                        margin: 7px auto;
                                                        ">                                                                            
                                                    </div>
                                                </td>

                                                <td class="text-nowrap" style="vertical-align: middle; font-size: 20px;">${b.nameP}</td>

                                                <td class="text-nowrap" style="vertical-align: middle; font-size: 20px;">
                                                    <span>${b.amountP}</span>
                                                </td>

                                                <td class="text-center" style="vertical-align: middle; font-size: 20px;">
                                                    <span>
                                                        <script>
                                                            var formattedPrice = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(${b.totalPriceP});
                                                            document.write(formattedPrice);
                                                        </script>
                                                    </span>
                                                </td>

                                                <td class="text-center" style="vertical-align: middle; font-size: 20px;">
                                                    <span>${b.paymentP.toString() == 'MoMo' ? 'MoMo' : 'Thanh toán khi nhận hàng'}</span>
                                                </td>

                                                <td class="text-center" style="vertical-align: middle; font-size: 20px;">
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

                                                <td class="text-center" style="vertical-align: middle; font-size: 20px;">
                                                    <span>${b.createAtP}</span>
                                                </td>

                                            </tr>

                                        </tbody>
                                    </c:forEach>


                                </table>

                            </div>
                            <div class="d-flex justify-content-center pag" style="align-items: center;">
                                <c:forEach begin="1" end="${endP}" var="i">
                                    <a class="page-item ${index == i ? "active": ""}" href="${pageContext.request.contextPath}/history?index=${i}">${i}</a>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="row gy-4 align-items-center mb-4">
                            <div class="col-12 col-sm-4"></div>
                            <div class="col-12 col-sm-4" >
                                <a href="home" class="btn btn-outline-dark my-5 view-all" style="display: block; align-items: center; font-size: 20px;">Quay về trang chủ</a>
                            </div>
                            <div class="col-12 col-sm-4"></div>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>

        <%@include file="common/footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath()%>/js/profile.js"></script>

    </body>
</html>
