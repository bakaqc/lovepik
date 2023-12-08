<%-- 
    Document   : payment
    Created on : Dec 4, 2023, 7:54:13 PM
    Author     : Admin
--%>

<%@page import="com.bakaqc.flower.model.User"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    session.setAttribute("flag", "payment");


%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width = device-width, initial-scale=1, shrink-to-fit-no">
        <title>Payment</title>

        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/payment.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        
        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/img/icon_web.png">
    </head>

    <body>
        <script type="text/javascript">

            var isLoggedIn = <%= session.getAttribute("user") != null%>;

            // Kiểm tra và điều khiển hiển thị nội dung
            if (isLoggedIn) {
                // Code khi đã đăng nhập
                document.body.style.display = 'block'; // Hiển thị nội dung trang
            } else {


                Toastify({
                    text: "Bạn cần đăng nhập để thanh toán",
                    duration: 3500, // Thời gian hiển thị thông báo (miligiây)
                    destination: "http://localhost:8080/flower/login", // Đường dẫn đến trang đăng nhập
                    newWindow: true,
                    close: true,
                    gravity: "bottom", // "top" or "bottom"
                    position: "right", // "left", "center", "right"
                    callback: function () {
                        // Chuyển hướng đến trang đăng nhập sau khi thông báo đã được hiển thị
                        window.location.href = "http://localhost:8080/flower/login";
                    }
                }).showToast();
            }
        </script>
        <section class="component">
            <div class="total">
               

            </div>
            <div class="credit-card">
                <h1 style="color: orange;">Thanh toán</h1>

                <form>

                    <c:set  var="u"  value="${sessionScope.user}" />
                    <input type="text" placeholder="FULLNAME"value="${u.fullName}" readonly />



                    <input type="text" placeholder="PHONE" value="${u.phone_number}" readonly />
                    <input type="text" placeholder="ADDRESS" value="${u.address}" readonly />
                    <%
                        LocalDate curDate = LocalDate.now();
                        String date = curDate.toString();
                    %>
                    <input type="text" placeholder="DATE" value="<%=date%>" readonly />
                    <input type="text" value="Thanh toán khi nhận hàng" readonly />
                    <div>  
                        <h2>Tổng tiền: 
                            <script>
                                var formattedPrice = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(${requestScope.total});
                                document.write(formattedPrice);
                            </script>
                        </h2>

                    </div>

                    <div class="row checkout-buttons">

                        <div class="col-sm-4">
                            <button type="button" class="valid-button" style="background-color: orange; color: black;" onclick="redirectToDetail()">Quay lại</button>
                        </div>

                        <div class="col-sm-4">
                            <button type="button" class="valid-button" style="background-color: orange; color: black;" onclick="redirectToEdit()">Chỉnh sửa thông tin</button>
                        </div>

                        <div class="col-sm-4">
                            <button type="button" class="valid-button" style="background-color: orange; color: black" onclick="checkout()">Thanh toán</button>
                        </div>

                    </div>

                </form>




            </div>
        </section>

        <script>
            function redirectToDetail() {
                var pid = "${requestScope.pid}";
                window.location.href = "detail?pid=" + encodeURIComponent(pid);
            }
        </script>
        <script>
            function redirectToEdit() {
                var pid = "${requestScope.pid}";

                window.location.href = "edit_profile?pid=" + encodeURIComponent(pid);
            }
        </script>


        <script>
            function checkout() {
                var pid = "${requestScope.pid}";

                window.location.href = "checkout?pid=" + encodeURIComponent(pid);
            }
        </script>

    </body>

</html>