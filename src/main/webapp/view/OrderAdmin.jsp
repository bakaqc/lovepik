<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản lí đơn hàng </title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="../style/admin.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <jsp:include page="navbaradmin.jsp"/> 
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách đơn hàng</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <h3 class="tile-title">Tình trạng đơn hàng</h3>
                            <div>
                                <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
                                       id="sampleTable">
                                    <thead>
                                        <tr>
                                            <th width="30">ID</th>
                                            <th>Tên khách hàng</th>
                                            <th>Tổng tiền</th>
                                            <th>Trạng thái</th>
                                            <th width="80">Tính năng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.orders}" var="item">
                                            <tr>
                                                <td>${item.id}</td>
                                                <td>
                                                    <c:forEach items="${requestScope.users}" var="temp">
                                                        <c:if test="${temp.id == item.getUserID()}">
                                                            ${temp.getFullName()}
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <script>
                                                        var formattedPrice = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(${item.getTotalPrice()});
                                                        document.write(formattedPrice);
                                                    </script>
                                                </td>
                                                <td>
                                                    <c:if test="${item.status.toString() == 'processing'}">
                                                        <span class="badge bg-info">Chờ xử lý</span>
                                                    </c:if>
                                                    <c:if test="${item.status.toString() == 'shipping'}">
                                                        <span class="badge bg-warning">Đang vận chuyển</span>
                                                    </c:if>
                                                    <c:if test="${item.status.toString() == 'done'}">
                                                        <span class="badge bg-success">Đã hoàn thành</span>
                                                    </c:if>
                                                    <c:if test="${item.status.toString() == 'canceled'}">
                                                        <span class="badge bg-danger">Đã hủy</span>
                                                    </c:if>
                                                </td>
                                                <td class="table-td-center">
                                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                                            data-toggle="modal" data-target="#ModalUP${item.id}"><i class="fas fa-edit"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        <div class="modal fade" id="ModalUP${item.id}"" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                             data-keyboard="false">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <form action="${pageContext.request.contextPath}/admin/updateOrder" method="post">
                                                        <div class="modal-body">
                                                            <div class="row">
                                                                <div class="form-group  col-md-12">
                                                                    <span class="thong-tin-thanh-toan">
                                                                        <h5>Chỉnh sửa trạng thái đơn hàng</h5>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <input class="form-control" name="id" type="hidden" required value="${item.id}">
                                                                <div class="form-group col-md-6">
                                                                    <div class="form-check col-sm-6">
                                                                        <input class="form-check-input" type="radio" name="status" id="gridRadios1" value="processing" ${item.status.toString() == 'processing' ? 'checked' : ''}>
                                                                        <label class="form-check-label" for="gridRadios1">
                                                                            Chờ xử lý
                                                                        </label>
                                                                    </div>
                                                                    <BR>
                                                                    <div class="form-check col-sm-6">
                                                                        <input class="form-check-input" type="radio" name="status" id="gridRadios1" value="shipping" ${item.status.toString() == 'shipping' ? 'checked' : ''}>
                                                                        <label class="form-check-label" for="gridRadios1">
                                                                            <div style="white-space: nowrap">
                                                                                Đang vận chuyển
                                                                            </div>
                                                                        </label>
                                                                    </div>
                                                                    <BR>
                                                                    <div class="form-check col-sm-6">
                                                                        <input class="form-check-input" type="radio" name="status" id="gridRadios1" value="done" ${item.status.toString() == 'done' ? 'checked' : ''}>
                                                                        <label class="form-check-label" for="gridRadios1">
                                                                            <div style="white-space: nowrap">
                                                                                Đã hoàn thành
                                                                            </div>
                                                                        </label>
                                                                    </div>
                                                                    <BR>
                                                                    <div class="form-check col-sm-6">
                                                                        <input class="form-check-input" type="radio" name="status" id="gridRadios2" value="canceled" ${item.status.toString() == 'canceled' ? 'checked' : ''}>
                                                                        <label class="form-check-label" for="gridRadios2">
                                                                            Đã hủy
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <BR>
                                                            <button class="btn btn-save" type="submit">Lưu lại</button>
                                                            <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                                                            <BR>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </main>
        <script src="../js/jquery-3.2.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="../js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="../js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="../js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
        <script>
            $('#sampleTable').DataTable();
            var data = {
                labels: ["Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11"],
                datasets: [{
                        label: "Dữ liệu đầu tiên",
                        fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
                        strokeColor: "rgb(255, 212, 59)",
                        pointColor: "rgb(255, 212, 59)",
                        pointStrokeColor: "rgb(255, 212, 59)",
                        pointHighlightFill: "rgb(255, 212, 59)",
                        pointHighlightStroke: "rgb(255, 212, 59)",
                        data: [20, 59, 90, 51, 56, 100]
                    },
                    {
                        label: "Dữ liệu kế tiếp",
                        fillColor: "rgba(9, 109, 239, 0.651)  ",
                        pointColor: "rgb(9, 109, 239)",
                        strokeColor: "rgb(9, 109, 239)",
                        pointStrokeColor: "rgb(9, 109, 239)",
                        pointHighlightFill: "rgb(9, 109, 239)",
                        pointHighlightStroke: "rgb(9, 109, 239)",
                        data: [48, 48, 49, 39, 86, 10]
                    }
                ]
            };
            var ctxl = $("#lineChartDemo").get(0).getContext("2d");
            var lineChart = new Chart(ctxl).Line(data);
            var ctxb = $("#barChartDemo").get(0).getContext("2d");
            var barChart = new Chart(ctxb).Bar(data);
        </script>
        <script type="text/javascript">
            //Thời Gian
            function time() {
                var today = new Date();
                var weekday = new Array(7);
                weekday[0] = "Chủ Nhật";
                weekday[1] = "Thứ Hai";
                weekday[2] = "Thứ Ba";
                weekday[3] = "Thứ Tư";
                weekday[4] = "Thứ Năm";
                weekday[5] = "Thứ Sáu";
                weekday[6] = "Thứ Bảy";
                var day = weekday[today.getDay()];
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                nowTime = h + " giờ " + m + " phút " + s + " giây";
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                        '</span>';
                document.getElementById("clock").innerHTML = tmp;
                clocktime = setTimeout("time()", "1000", "Javascript");
                function checkTime(i) {
                    if (i < 10) {
                        i = "0" + i;
                    }
                    return i;
                }
            }
        </script>
    </body>
</html>