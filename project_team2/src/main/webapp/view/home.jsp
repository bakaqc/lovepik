<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>LovePik</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="./style/home.css"> 
    </head>
    <body>
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

        <div class="container position-relative text-center">
            <header class="position-relative text-center text-white mb-5">
                <img src="./img/banner.png" alt="Banner" class="w-100">
                <div class="position-absolute top-50 start-50 translate-middle-x w-100 px-3">
                    <h1 class="display-4 shop-name">
                        LovePik - Trao gửi yêu thương
                    </h1>
                    <a href="#new" class="btn btn-light but">
                        Explore Now
                    </a>
                </div>
            </header>
            <div class="listp">
                <c:forEach items="${listP}" var="p">
                    <div class="col-sm-3">
                        <div class="d-flex justify-content-between align-items-center flex-column flex-lg-row my-5" id="new"> 
                            <div class="card m-2">


                                <a href="#">
                                    <img src="${p.banners}" alt="Product" class="card-img-top hihi"
                                         height="300" >
                                </a>
                                <div class="card-body">
                                    <p class="card-text fw-bold namep">
                                        ${p.name}
                                    </p>
                                    <small class="text-secondary pricep">
                                        ${p.price} VNĐ
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <a href="#" class="btn btn-outline-dark my-5 view-all">View All Products</a>

        </div>
        <div class ="footers ">
            <footer class="d-flex justify-content-between my-5 text-start flex-wrap home-footer">
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
