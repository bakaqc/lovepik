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
                    duration: 4000, // Thời gian hiển thị thông báo (miligiây)
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
                <h1>TOTAL</h1>
                <p id="totalValue"><script>

                    var formattedPrice = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(${requestScope.total});
                    document.write(formattedPrice);
                    </script>      </p>

            </div>
            <div class="credit-card">
                <h2>Payment</h2>
                <% String flag_incart = (String) session.getAttribute("flag_incart");

                    if (flag_incart != null) {
                        // làm trường hợp cart 
                        session.removeAttribute("flag_incart");
                        } else {%>
                <form>
 
                    <c:set  var="u"  value="${sessionScope.user}" />
                    <input type="text" placeholder="NAME"value="${u.fullName}" readonly />
                 

                    <!--                    <div class="line"><input type="text" placeholder="CARD" /> <input type="text" placeholder="NUMBER" /> <input
            type="text" /> <input type="text" /></div>
<div class="line">
<input class="litle" type="text" placeholder="EXPIRY" />
     <input class="tall" type="text" placeholder="CCV" />
         </div>-->
                    <input type="text" placeholder="sdt" value="${u.phone_number}" readonly />
                    <input type="text" placeholder="dc" value="${u.address}" readonly />
                    <% 
                    LocalDate curDate=LocalDate.now();
                    String date=curDate.toString();
                    %>
                    <input type="text" placeholder="date" value="<%=date%>" readonly />
                    <button type="submit" class="valid-button" >CHECKOUT</button>
                    
                    </form>
                <%}%>



            </div>
        </section>
   <script>// Thêm đoạn mã JavaScript để đồng bộ kích thước
const totalValue = document.getElementById("totalValue");
const total = document.querySelector(".total");

function updateTotalWidth() {
  total.style.width = totalValue.offsetWidth + "px";
}

// Gọi hàm cập nhật kích thước khi trang tải hoặc nội dung thay đổi
window.addEventListener("load", updateTotalWidth);
window.addEventListener("resize", updateTotalWidth);
</script>
    </body>

</html>