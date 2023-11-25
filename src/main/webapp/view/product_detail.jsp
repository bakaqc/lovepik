<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>LovePik | Thông tin sản phẩm</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/home.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/product_detail.css" />
    </head>
    <body>
        <%@include file="common/header.jsp" %>
        <div class="container">
            <div class="p-3 justify-content-center bg-white">

                <div class="row border m-2 detail">
                    <div class="col-lg-4 left-side-product-box pb-3 product-banner">
                        <img src="<%=request.getContextPath()%>/${pro.banners}" alt="Product" class="p-3 bann" height="500">
                    </div>
                    <div class="col-lg-8">
                        <div class="right-side-pro-detail p-3 m-0">
                            <div class="row">
                                <div class="col-lg-12 product-name">
                                    <p class="m-0 p-0">${pro.name}</p>
                                </div>
                                <div class="col-lg-12 product-price">
                                    <p class="m-0 p-0 price-pro">
                                        <script>
                                            var formattedPrice = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(${pro.price});
                                            document.write(formattedPrice);
                                        </script>
                                    </p>

                                </div>

                                <div class="col-lg-12 pt-2 product-type">
                                    <h5>Loại:</h5>
                                    <span>${nameCAT}</span>

                                </div>
                                <div class="col-lg-12 pt-2 product-desc">
                                    <h5>Mô tả:</h5>
                                    <span>${pro.detail}</span>
                                </div>
                                <div class="col-lg-12 call">
                                    <h5>Gọi ngay: </h5>
                                    <h5 class="call-now">1900</h5>
                                </div>   
                                <div class="col-lg-12 ship">
                                    <h5>Giao hàng nhanh trong khu vực Tỉnh Bình Định </h5>
                                </div>   
                                <div class="col-lg-12 product-amount">
                                    <h5>Số lượng :</h5>
                                    <input type="number" min="1" class="form-control text-center w-100 amount" value="1">
                                </div>
                                <div class="col-lg-12 mt-3">
                                    <div class="row">
                                        <div class="col-lg-6 pb-2 ">
                                            <a href="#" class="btn btn-danger w-100">Thêm vào Giỏ</a>
                                        </div>
                                        <div class="col-lg-6">
                                            <a href="#" class="btn btn-success w-100 shop-now">Mua Ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container position-relative text-center more">
                    <h1>Sản phẩm khác</h1>
                    <div class="listp">
                        <c:forEach items="${listP}" var="p">
                            <div class="col-sm-3">
                                <div class="d-flex justify-content-between align-items-center flex-column flex-lg-row my-5" id="new"> 
                                    <div class="card m-2 card-pro">

                                        <div class="product">
                                            <a href ="detail?pid=${p.id}" class="product-img">
                                                <img src="${p.banners}" alt="Product" class="card-img-top p-img"
                                                     height="200" >
                                            </a>
                                            <a href="#" class="buy">
                                                Thêm vào Giỏ
                                            </a>
                                        </div>
                                        <div class="card-body">
                                            <p class="card-text fw-bold namep">
                                                ${p.name}
                                            </p>
                                            <small class="text-secondary pricep">
                                                <script>
                                                    var formattedPrice = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(${p.price});
                                                    document.write(formattedPrice);
                                                </script>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </div>

        </div>
        <%@include file="common/footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
