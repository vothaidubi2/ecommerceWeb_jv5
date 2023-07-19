<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form action="/shop?keyworks=${keywords }" class="search-model-form">
                <input type="text" name="keywords" value="${keywords}" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->