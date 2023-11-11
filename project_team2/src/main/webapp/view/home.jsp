<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Flower Shop</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <style><%@include file="/style/home.css" %></style>
        <!--<link rel="stylesheet" type="text/css" href="/style/home.css">--> 
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light position-fixed top-0 start-0 w-100">
            <div class="container-header">
                <a href="#" class="navbar-brand d-lg-none">
                    Flower Shop
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse p-2 flex-column" id="navbarContent">
                    <div class="d-flex justify-content-center justify-content-lg-between flex-column flex-lg-row w-100">
                        <form class="d-flex">
                            <input type="search" class="form-control me-2" placeholder="Search" />
                            <button class="btn btn-outline-dark" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                        <a href="home" class="navbar-brand d-none d-lg-block">Flower Shop</a>
                        <ul class="navbar-nav">
                            <li class="nav-item d-flex align-items-center">
                                <a href="#" class="nav-link mx-2">
                                    Contact
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
                        <ul class="navbar-nav d-flex justify-content-center align-items-center pt-3">
                            <li class="nav-item mx-2">
                                <a href="#" class="nav-link">
                                    Hoa sinh nhật
                                </a>
                            </li>
                            <li class="nav-item mx-2">
                                <a href="#" class="nav-link">
                                    Hoa chúc mừng
                                </a>
                            </li>
                            <li class="nav-item mx-2">
                                <a href="#" class="nav-link">
                                    Hoa tình yêu
                                </a>
                            </li>
                            <li class="nav-item mx-2">
                                <a href="#" class="nav-link">
                                    Hoa tang lễ
                                </a>
                            </li>
                            <li class="nav-item mx-2">
                                <a href="#" class="nav-link">
                                    Hoa ngày Tết
                                </a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <div class="container position-relative text-center">
            <header class="position-relative text-center text-white mb-5">
                <img src="https://dummyimage.com/1920x600/e3cae3/fff.jpg" alt="Banner" class="w-100">
                <div class="position-absolute top-50 start-50 translate-middle-x w-100 px-3">
                    <h1 class="display-4">
                        Fall Collection 2023
                    </h1>
                    <a href="#new" class="btn btn-light">
                        Explore Now
                    </a>
                </div>
            </header>

            <h2 class="display-6 py-5">
                Most Popular
            </h2>

            <div class="d-flex justify-content-between align-items-center flex-column flex-lg-row my-5" id="new">
                <div class="card m-2">
                    <a href="#">
                        <img src="https://dummyimage.com/400x300/e3cae3/fff.jpg" alt="Product" class="card-img-top"
                             height="300">
                    </a>
                    <div class="card-body">
                        <p class="card-text fw-bold">
                            Tera Dress
                        </p>
                        <small class="text-secondary">
                            USD 449$
                        </small>
                    </div>
                </div>
                <div class="card m-2">
                    <a href="#">
                        <img src="https://dummyimage.com/400x300/e3cae3/fff.jpg" alt="Product" class="card-img-top"
                             height="300">
                    </a>
                    <div class="card-body">
                        <p class="card-text fw-bold">
                            Tera Dress
                        </p>
                        <small class="text-secondary">
                            USD 449$
                        </small>
                    </div>
                </div>
                <div class="card m-2">
                    <a href="#">
                        <img src="https://dummyimage.com/400x300/e3cae3/fff.jpg" alt="Product" class="card-img-top"
                             height="300">
                    </a>
                    <div class="card-body">
                        <p class="card-text fw-bold">
                            Tera Dress
                        </p>
                        <small class="text-secondary">
                            USD 449$
                        </small>
                    </div>
                </div>
                <div class="card m-2">
                    <a href="#">
                        <img src="https://dummyimage.com/400x300/e3cae3/fff.jpg" alt="Product" class="card-img-top"
                             height="300">
                    </a>
                    <div class="card-body">
                        <p class="card-text fw-bold">
                            Tera Dress
                        </p>
                        <small class="text-secondary">
                            USD 449$
                        </small>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-between align-items-center flex-column flex-lg-row my-5" id="new">
                <div class="card m-2">
                    <a href="#">
                        <img src="https://dummyimage.com/400x300/e3cae3/fff.jpg" alt="Product" class="card-img-top"
                             height="300">
                    </a>
                    <div class="card-body">
                        <p class="card-text fw-bold">
                            Tera Dress
                        </p>
                        <small class="text-secondary">
                            USD 449$
                        </small>
                    </div>
                </div>
                <div class="card m-2">
                    <a href="#">
                        <img src="https://dummyimage.com/400x300/e3cae3/fff.jpg" alt="Product" class="card-img-top"
                             height="300">
                    </a>
                    <div class="card-body">
                        <p class="card-text fw-bold">
                            Tera Dress
                        </p>
                        <small class="text-secondary">
                            USD 449$
                        </small>
                    </div>
                </div>
                <div class="card m-2">
                    <a href="#">
                        <img src="https://dummyimage.com/400x300/e3cae3/fff.jpg" alt="Product" class="card-img-top"
                             height="300">
                    </a>
                    <div class="card-body">
                        <p class="card-text fw-bold">
                            Tera Dress
                        </p>
                        <small class="text-secondary">
                            USD 449$
                        </small>
                    </div>
                </div>
                <div class="card m-2">
                    <a href="#">
                        <img src="https://dummyimage.com/400x300/e3cae3/fff.jpg" alt="Product" class="card-img-top"
                             height="300">
                    </a>
                    <div class="card-body">
                        <p class="card-text fw-bold">
                            Tera Dress
                        </p>
                        <small class="text-secondary">
                            USD 449$
                        </small>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-between align-items-center flex-column flex-lg-row my-5" id="new">
                <div class="card m-2">
                    <a href="#">
                        <img src="https://dummyimage.com/400x300/e3cae3/fff.jpg" alt="Product" class="card-img-top"
                             height="300">
                    </a>
                    <div class="card-body">
                        <p class="card-text fw-bold">
                            Tera Dress
                        </p>
                        <small class="text-secondary">
                            USD 449$
                        </small>
                    </div>
                </div>
                <div class="card m-2">
                    <a href="#">
                        <img src="https://dummyimage.com/400x300/e3cae3/fff.jpg" alt="Product" class="card-img-top"
                             height="300">
                    </a>
                    <div class="card-body">
                        <p class="card-text fw-bold">
                            Tera Dress
                        </p>
                        <small class="text-secondary">
                            USD 449$
                        </small>
                    </div>
                </div>
                <div class="card m-2">
                    <a href="#">
                        <img src="https://dummyimage.com/400x300/e3cae3/fff.jpg" alt="Product" class="card-img-top"
                             height="300">
                    </a>
                    <div class="card-body">
                        <p class="card-text fw-bold">
                            Tera Dress
                        </p>
                        <small class="text-secondary">
                            USD 449$
                        </small>
                    </div>
                </div>
                <div class="card m-2">
                    <a href="#">
                        <img src="https://dummyimage.com/400x300/e3cae3/fff.jpg" alt="Product" class="card-img-top"
                             height="300">
                    </a>
                    <div class="card-body">
                        <p class="card-text fw-bold">
                            Tera Dress
                        </p>
                        <small class="text-secondary">
                            USD 449$
                        </small>
                    </div>
                </div>
            </div>

            <a href="#" class="btn btn-outline-dark my-5">View All Products</a>


        </div>
        <div class ="footers">
            <footer class="d-flex justify-content-between my-5 text-start flex-wrap">
                <ul class="nav flex-column">
                    <li class="fw-bold nav-item">
                        <a href="#" class="nav-link text-dark">
                            Product
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-muted">Hoa sinh nhật</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-muted">Hoa chúc mừng</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-muted">Hoa tình yêu</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-muted">...</a>
                    </li>

                    </li>

                </ul>
                <ul class="nav flex-column">
                    <li class="fw-bold nav-item text-dark">
                        <a href="#" class="nav-link text-dark">Help</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-muted">Shopping Guide</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-muted">Product Care</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-muted">Contac Us</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-muted">Return Process</a>
                    </li>
                </ul>
                <ul class="nav flex-column">
                    <li class="fw-bold nav-item text-dark">
                        <a href="#" class="nav-link text-dark">Content</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-muted">About</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-muted">Blog</a>
                    </li>
                </ul>        
            </footer>
        </div>


    </body>
</html>
