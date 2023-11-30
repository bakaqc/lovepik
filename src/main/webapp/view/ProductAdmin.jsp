
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
    </body>
    <body onload="time()" class="app sidebar-mini rtl">
        <jsp:include page="navbaradmin.jsp"/>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="#" title="Thêm" data-toggle="modal" data-target="#AddProduct"><i class="fas fa-plus"></i>
                                        Tạo mới sản phẩm
                                    </a>
                                </div>
                            </div>
                            <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
                                   id="sampleTable">
                                <thead>
                                    <tr>
                                        <th width="10"><input type="checkbox" id="all"></th>
                                        <th>ID Sản Phẩm</th>
                                        <th width="150">Tên Sản Phẩm</th>
                                        <th width="20">Ảnh</th>
                                        <th>Danh mục</th>
                                        <th>Giá</th>
                                        <th width="100">Tính năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.products}" var="item">
                                        <tr>
                                            <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                            <td>#${item.id}</td>
                                            <td>${item.name}</td>
                                            <td><img class="img-card-person" style="width: 50px" src="<%=request.getContextPath()%>/${item.banners}" alt=""></td>
                                            <td>
                                                <c:forEach items="${requestScope.categories}" var="temp">
                                                    <c:if test="${item.getCategoryId() == temp.id}">
                                                        ${temp.getNameCAT()}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>${item.price}</td>
                                            <td class="table-td-center">
                                                <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                                        onclick="deleteProduct(${item.id})"><i class="fas fa-trash-alt"></i>
                                                </button>
                                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                                        data-toggle="modal" data-target="#EditProduct${item.id}"><i class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    <div class="modal fade" id="EditProduct${item.id}"" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                         data-keyboard="false">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <form action="${pageContext.request.contextPath}/admin/updateProduct" enctype="multipart/form-data" method="post">
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="form-group  col-md-12">
                                                                <span class="thong-tin-thanh-toan">
                                                                    <h5>Chỉnh sửa thông tin sản phẩm</h5>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <input class="form-control" name="id" type="hidden" required value="${item.id}">
                                                            <div class="form-group col-md-6">
                                                                <label class="control-label">Tên sản phẩm</label>
                                                                <input class="form-control" type="text" name="name" required value="${item.name}">
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label for="exampleFormControlSelect1">Danh mục</label>
                                                                <select class="form-control" name="category" id="exampleFormControlSelect1" required="">
                                                                    <c:forEach items="${requestScope.categories}" var="temp">
                                                                        <option value="${temp.id}" ${item.getCategoryId() == temp.id ? 'selected' : ''}>${temp.getNameCAT()}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label class="control-label">Giá</label>
                                                                <input class="form-control" type="number" name="price" required value="${item.price}">
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label class="control-label">Ảnh</label>
                                                                <img src="<%=request.getContextPath()%>/img/product_img/${item.banners}" style="width: 60px" alt="alt" id="image${item.id}"/>
                                                                <input type="file" class="form-control-file" id="exampleFormControlFile1" name="image" onclick="preview(${item.id})">
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label for="inputAddress">Chi tiết sản phẩm</label>
                                                                <textarea class="form-control" id="inputAddress" rows="3" name="detail" required="">${item.detail}</textarea>
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
                                </c:forEach>
                                </tbody>
                                <div class="modal fade" id="AddProduct"" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                     data-keyboard="false">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <form action="${pageContext.request.contextPath}/admin/create-product" enctype="multipart/form-data" method="post">
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="form-group  col-md-12">
                                                            <span class="thong-tin-thanh-toan">
                                                                <h5>Tạo mới sản phẩm</h5>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-md-6">
                                                            <label class="control-label">Tên sản phẩm</label>
                                                            <input class="form-control" type="text" name="name" required>
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label for="exampleFormControlSelect1">Danh mục</label>
                                                            <select class="form-control" name="category" id="exampleFormControlSelect1" required="">
                                                                <c:forEach items="${requestScope.categories}" var="temp">
                                                                    <option value="${temp.id}">${temp.getNameCAT()}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label class="control-label">Giá</label>
                                                            <input class="form-control" type="number" name="price" required min="1">
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label class="control-label">Ảnh</label>
                                                            <img src="<%=request.getContextPath()%>/img/product_img/${item.banners}" style="width: 60px" alt="alt" id="previewImage"/>
                                                            <input type="file" class="form-control-file" id="exampleFormControlFile1" name="image" required="" onclick="previewImage()">
                                                        </div>
                                                        <div class="form-group col-md-12">
                                                            <label for="inputAddress">Chi tiết sản phẩm</label>
                                                            <textarea class="form-control" id="inputAddress" rows="3" name="detail" required=""></textarea>
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
        <script type="text/javascript" src="../js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
        <script>
            var notification = '${requestScope.error}';
            if (notification.length > 0) {
                Toastify({
                    text: '${requestScope.error}',
                    duration: 3000
                }).showToast();
            }
            function deleteRow(r) {
                var i = r.parentNode.parentNode.rowIndex;
                document.getElementById("myTable").deleteRow(i);
            }
            function deleteProduct(i) {
                swal({
                    title: "Cảnh báo",
                    text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
                    buttons: ["Hủy bỏ", "Đồng ý"],
                }).then((willDelete) => {
                    if (willDelete) {
                        $.ajax({
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/admin/deleteProduct',
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
            oTable = $('#sampleTable').dataTable();
            $('#all').click(function (e) {
                $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
                e.stopImmediatePropagation();
            });


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
            function preview(i)
            {
                const selectedFile = event.target.files[0];
                if (selectedFile) {
                    selectedFile.preview = URL.createObjectURL(selectedFile); // Tạo đường dẫn tạm thời cho ảnh
                    console.log(selectedFile);
                    $('#image$' + i).attr('src', selectedFile.preview).load(function () {
                        $(this).width(); // this is how you get new width of image
                    });
                }
            }
            function previewImage()
            {
                const selectedFile = event.target.files[0];
                if (selectedFile) {
                    selectedFile.preview = URL.createObjectURL(selectedFile); // Tạo đường dẫn tạm thời cho ảnh
                    console.log(selectedFile);
                    $('#previewImage').attr('src', selectedFile.preview).load(function () {
                        $(this).width(); // this is how you get new width of image
                    });
                }
            }
        </script>
    </body>
</html>

