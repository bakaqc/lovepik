<nav class="navbar navbar-expand-lg navbar-light bg-light position-fixed top-0 start-0 w-100">
    <div class="container-header">
        <a href="#" class="navbar-brand d-lg-none ">
            LovePik
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse p-2 flex-column" id="navbarContent">                
            <div class="d-flex justify-content-center justify-content-lg-between flex-column flex-lg-row w-100 test">
                <a href="home" class="navbar-brand d-none d-lg-block">LovePik</a>
                <form class="d-flex search">
                    <input type="search" class="form-control me-2 search-input" placeholder="Search" />
                    <button class="btn btn-outline-dark" type="submit">
                        <i class="fas fa-search"></i>
                    </button>
                </form>

                <ul class="navbar-nav">
                    <li class="nav-item d-flex align-items-center">
                        <a href="home" class="nav-link mx-2 hotline">
                            Hotline: 1900 
                        </a>
                    </li>
                    <li class="nav-item d-flex align-items-center">
                        <a href="#" class="nav-link mx-2">
                            <i class="fas fa-user"></i>
                            My Account
                        </a>
                    </li>
                    <li class="nav-item d-flex align-items-center">
                        <a href="#" class="nav-link mx-2">
                            <i class="fas fa-shopping-cart"></i>
                            Cart
                        </a>
                        <span class="badge rounded-pill bg-secondary">0</span>
                    </li>
                </ul>
            </div>
            <div class="d-block w-100">
                <ul class="navbar-nav d-flex justify-content-center align-items-center pt-3 menu">
                    <li class="nav-item mx-2 ">
                        <a href="home" class="nav-link listmenu">
                            Home
                        </a>
                    </li>  
                    <c:forEach items="${listCAT}" var="o">
                        <li class="nav-item mx-2 ${tag == o.id ? "active":""} ">
                            <a href="categories?id=${o.id}" class="nav-link listmenu">
                                ${o.nameCAT}
                            </a>
                        </li>  
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</nav>