<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>LovePik | Giới thiệu</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/home.css" /> 
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style/about.css" /> 

        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/img/icon_web.png">

    </head>
    <body>
        <%@include file="common/header.jsp" %>

        <section class="py-5 my-5">
            <div class="container">
                <div class="row py-3">
                    <div class="col-lg-6 col-md-12 py-1">
                        <h6 class="display-6 mb-4">
                            Chào mừng bạn đến với LovePik
                        </h6>
                        <p>
                            Shop hoa ở Bình Định LovePik dịch vụ giao hoa tận nhà nhanh chóng uy tín nhất, 
                            khách hàng đều hài lòng về dịch vụ tại shop. Cam kết giao hoa đúng thời gian 
                            địa điểm và đúng mẫu mã sản phẩm.
                        </p>
                        <p>
                            LovePik hiểu rằng, hoa tươi dù không mang nhiều giá trị về mặt vật chất, 
                            nhưng lại có ý nghĩa rất lớn về mặt tinh thần. Mỗi một bó hoa gửi đi gửi gắm rất nhiều tình cảm, 
                            thông điệp yêu thương mà bạn muốn gửi đến những người thân. 
                        </p>
                        <p>
                            Chính vì thế, 
                            LovePik luôn nỗ lực nâng cao chất lượng sản phẩm và dịch vụ để mang đến bạn những 
                            trải nghiệm tuyệt vời nhất khi sử dụng dịch vụ của LovePik.
                        </p>
                    </div>
                    <div class="col-lg-6 col-md-12 py-1">
                        <img class="card-img" src="./img/banner_about.png">
                    </div>
                </div>
                <div class="py-3 text-center justify-content-center position-relative">
                    <h6 class="display-6 mb-4 mt-4">
                        Đội ngũ phát triển LovePik
                    </h6>

                    <a href="https://github.com/bakaqc/flower/graphs/contributors" target="_blank"> 
                        <img src="https://contrib.rocks/image?repo=bakaqc/flower"/>
                    </a>
                </div>
            </div>
        </section>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
