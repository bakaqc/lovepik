<%@page import="java.util.Locale.Category"%>
<%@page import="com.bakaqc.flower.dao.CategoriesDAO"%>
<%@page import="com.bakaqc.flower.model.Categories"%>
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

        <title>LovePik | Giỏ hàng</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">   
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/home.css" />

        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/img/icon_web.png">

    </head>
    <body>
        <%@include file="common/header.jsp" %>

        <div class="container">
            <section class="h-100" >
                <div class="container h-100 py-5">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-10" style="padding: 0;">
                            <section class="pb-5">
                                <div class="container p-0">
                                    <h2 class="fw-normal mb-5 text-black" style="text-align: center;">Giỏ hàng của bạn</h2>

                                    <c:if test="${sessionScope.cart.size() == 0}">
                                        <div class="container my-5 mt-5">
                                            <br>
                                            <h6 class="display-6 mb-5 mt-5 d-flex justify-content-center">
                                                Không có sản phẩm nào
                                            </h6>
                                            <br>
                                            <div class="row">
                                                <div class="form-group col-3 mt-1"></div>
                                                <div class="form-group col-6">
                                                    <div class="col-xs-12 mt-5 mb-4 can">                            
                                                        <a href="home"> 
                                                            <button class="btn btn-lg col-12 can" type="button" style="background-color: #FFCC66; color: black;">
                                                                <i class=""></i> Tiếp tục mua hàng
                                                            </button>
                                                        </a>
                                                    </div>
                                                </div>   
                                                <div class="form-group col-3 mt-1"></div>
                                            </div>  
                                        </div>
                                    </c:if>

                                    <c:if test="${sessionScope.cart.size() > 0}">
                                        <%--<c:forEach items="${sessionScope.cart}" var="item">--%>
                                        <table id="shoppingCart" class="table table-condensed table-responsive">
                                            <thead style="font-size: 20px;">
                                                <tr>
                                                    <th style="width: 50%; padding-left: 170px">Sản phẩm</th>                                           
                                                    <th style="width: 10%; text-align: center">Số lượng</th>
                                                    <th style="width: 15%; text-align: center">Tổng Giá</th>
                                                    <th style="width: 10%; text-align: center">Thao tác</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <%
                                                    Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

                                                    int amountCart = 0;
                                                    int totalPrice = 0;
                                                    for (Integer key : cart.keySet()) {
                                                        Integer value = cart.get(key);

                                                        Product product = ProductDAO.getInstance().getById(key);
                                                        String nameCAT = ProductDAO.getInstance().getNameCAT(key);
                                                        int total = product.getPrice() * value;
                                                        totalPrice += total;
                                                        amountCart += value;

                                                %>
                                                <tr>
                                                    <td data-th="Product">
                                                        <div class="row">

                                                            <div
                                                                class="bg-light d-inline-flex justify-content-center align-items-center align-top ban"
                                                                style="
                                                                width: 80px;
                                                                height: 95px;
                                                                border-radius: 5px;
                                                                background-image: url(<%=request.getContextPath()%>/<%=product.getBanners()%>);
                                                                background-size: 80px 95px;
                                                                background-repeat: no-repeat;
                                                                margin: 7px auto;
                                                                ">                                                                            
                                                            </div>
                                                            <div class="col-md-9 text-left mt-sm-4">
                                                                <h5><%=product.getName()%></h5>
                                                                <p class="font-weight-light">Loại: <%=nameCAT%></p>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td data-th="Quantity" style="text-align: center; font-size: 20px;">     
                                                        <div class="mt-4">
                                                            <%=value%>   
                                                        </div>
                                                    </td>
                                                    <td data-th="Price" style="text-align: center; font-size: 20px;">
                                                        <div class="mt-4">
                                                            <script>
                                                                var formattedPrice = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(<%=total%>);
                                                                document.write(formattedPrice);
                                                            </script>
                                                        </div>
                                                    </td>
                                                    <td class="actions" data-th="">
                                                        <div class="text-center">
                                                            <a href="removefromcart?id=<%=key%>"
                                                               class="btn btn-white border-secondary bg-white btn-md mt-4"
                                                               >
                                                                Xóa <i class="fa-solid fa-trash-can" style="font-size: 15px;"></i>
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                            </tbody>

                                        </table>                                

                                        <h3 style="text-align: end;">Tổng tiền: 
                                            <script>
                                                var formattedPrice = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(<%=totalPrice%>);
                                                document.write(formattedPrice);
                                            </script>
                                        </h3>
                                        <div class="row">
                                            <div class="form-group col-6 mt-1">
                                                <div class="col-xs-12 can"  style="margin-bottom: 30px;">                            
                                                    <a href="home"> 
                                                        <button class="btn btn-lg col-12 can" type="button" style="background-color: #FFCC66; color: black;">
                                                            <i class=""></i> Tiếp tục mua hàng
                                                        </button>
                                                    </a>
                                                </div>
                                            </div>   
                                            <div class="form-group col-6 mt-1">
                                                <div class="col-xs-12 can"  style="margin-bottom: 30px;">                            
                                                    <a href="#"> 
                                                        <button class="btn btn-lg col-12 can" type="button" style="background-color: #33CC66; color: black;">
                                                            <i class=""></i> Thanh toán
                                                        </button>
                                                    </a>
                                                </div>
                                            </div>   

                                        </div>  
                                        <%--</c:forEach>--%>
                                    </c:if>
                                </div>
                            </section>


                        </div>
                    </div>
                </div>
            </section>
        </div>

        <%@include file="common/footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
