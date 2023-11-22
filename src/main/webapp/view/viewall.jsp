<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>LovePik</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/home.css" />
    </head>
    <body>
        <%@include file="common/header.jsp" %>

        <div class="container position-relative text-center">

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
                                        Add To Cart
                                    </a>
                                </div>
                                <div class="card-body">
                                    <p class="card-text fw-bold namep">
                                        ${p.name}
                                    </p>
                                    <small class="text-secondary pricep">
                                        ${p.price} VNĐ
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
        <%@include file="common/footer.jsp" %>
    </body>
</html>
