<div class ="footers mt-5">
    <footer class="d-flex justify-content-between my-5 text-start flex-wrap home-footer">
        <ul class="nav flex-column">
            <li class="fw-bold nav-item">
                <a href="#" class="nav-link text-dark">
                    Sản phẩm
                </a>
        </li>

            <c:forEach items="${listCAT}" var="o">
                <li class="nav-item mx-0 ${tag == o.id ? "active":""} ">
                    <a href="categories?id=${o.id}" class="nav-link listmenu">
                        ${o.nameCAT}
                    </a>
                </li>  
            </c:forEach>

        </ul>
        <ul class="nav flex-column">
            <li class="fw-bold nav-item text-dark">
                <a href="#" class="nav-link text-dark">Hỗ trợ</a>
            </li>
            <li class="nav-item ">
                <a href="home" class="nav-link text-blue">Hotline:  1900</a>
            </li>
            <li class="nav-item ">
                <a href="https://github.com/bakaqc/flower" target="_blank" class="nav-link text-blue">Github</a>
            </li>
            <li class="nav-item ">
                <a href="https://www.facebook.com/dqchuongbk" target="_blank" class="nav-link text-blue">Facebook</a>
            </li>
        </ul>
        <ul class="nav flex-column">
            <li class="fw-bold nav-item text-dark">
                <a href="#" class="nav-link text-dark">Thông tin</a>
            </li>
            <li class="nav-item ">
                <a href="about" class="nav-link text-blue">Giới thiệu</a>
            </li>
        </ul>        
    </footer>
</div>