<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>LovePik | Trang chủ</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/home.css" />

    </head>
    <body>
        <%@include file="common/header.jsp" %>

        <div class="container position-relative text-center">
            <header class="position-relative text-center text-white mb-5 banner">
                <img src="./img/banner_home.png" alt="Banner" class="w-100" height="350">
            </header>

            <h1>Danh mục sản phẩm</h1>

            <div class="listp">
                <c:forEach items="${listP}" var="p">
                    <div class="col-sm-3">
                        <div class="d-flex justify-content-between align-items-center flex-column flex-lg-row my-5" id="new"> 
                            <div class="card m-2 card-pro">

                                <div class="product">
                                    <a href ="detail?pid=${p.id}" class="product-img">
                                        <img src="<%=request.getContextPath()%>/${p.banners}" alt="Product" class="card-img-top p-img"
                                             height="200" >
                                    </a>
                                    <a href="#" class="buy">
                                        Thêm vào Giỏ
                                    </a>
                                </div>
                                <div class="card-body">
                                    <p class="card-text fw-bold namep"  >
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

            <a href="allproduct?index=1" class="btn btn-outline-dark my-5 view-all">Tất cả sản phẩm</a>

        </div>
        <%@include file="common/footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
