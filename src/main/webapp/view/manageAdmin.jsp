

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản trị Admin</title>
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
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap4.min.css">
    </head>
    <body onload="time()" class="app sidebar-mini rtl">
        <jsp:include page="navbaradmin.jsp"/>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách tài khoản quản trị</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="#" title="Thêm" data-toggle="modal" data-target="#ModalAdd"><i class="fas fa-plus"></i>
                                        Tạo mới tài khoản quản trị
                                    </a>
                                </div>
                            </div>
                            <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0">
                                <thead>
                                    <tr>
                                        <th width="10"><input type="checkbox" id="all"></th>
                                        <th width="100">ID Khách Hàng</th>
                                        <th width="150">Username</th>
                                        <th width="30">Tính năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.list}" var="item">
                                        <tr>
                                            <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                            <td>#${item.id}</td>
                                            <td>${item.getUserName()}</td>
                                            <td class="table-td-center">
                                                <c:if test="${item.getUserName()!='superadmin'}">
                                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                                            onclick="deleteAdmin(${item.id})"><i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </c:if>


                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <div class="modal fade" id="ModalAdd"" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                     data-keyboard="false">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <form action="${pageContext.request.contextPath}/admin/createAccountAdmin" method="post">
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="form-group  col-md-12">
                                                            <span class="thong-tin-thanh-toan">
                                                                <h5>Tạo mới tài khoản</h5>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-md-6">
                                                            <label class="control-label">Tài khoản</label>
                                                            <input class="form-control" type="text" name="username" required >
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label class="control-label">Mật khẩu</label>
                                                            <input class="form-control" type="password" name="password" required >
                                                        </div>

                                                    </div>
                                                    <BR>
                                                    <BR>
                                                    <BR>
                                                    <button class="btn btn-save" type="submit">Lưu lại</button>
                                                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                                                    <BR>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </table>
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
        <script type="text/javascript" src="..  /js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <script>
                                                                function deleteRow(r) {
                                                                    var i = r.parentNode.parentNode.rowIndex;
                                                                    document.getElementById("myTable").deleteRow(i);
                                                                }
                                                                function deleteAdmin(i) {
                                                                    swal({
                                                                        title: "Cảnh báo",
                                                                        text: "Bạn có chắc chắn là muốn xóa tài khoản này?",
                                                                        buttons: ["Hủy bỏ", "Đồng ý"]
                                                                    }).then((willDelete) => {
                                                                        if (willDelete) {
                                                                            $.ajax({
                                                                                type: 'POST',
                                                                                url: '${pageContext.request.contextPath}/admin/deleteAdmin',
                                                                                data: {
                                                                                    id: i
                                                                                },
                                                                                success: function (data, textStatus, jqXHR) {
                                                                                    swal("Đã xóa thành công.!", {
                                                                                    });
                                                                                    location.reload();
                                                                                }
                                                                            })
                                                                        }
                                                                    });
                                                                }

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
                                                                $("#show-emp").on("click", function () {
                                                                    $("#ModalUP").modal({backdrop: false, keyboard: false})
                                                                });
        </script>
    </body>
</html>
