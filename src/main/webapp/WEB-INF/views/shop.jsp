<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<%@include file="head.jsp"%>
<base href="${pageContext.servletContext.contextPath}">
<link rel="stylesheet" href="/css/range.css">
</head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Shop</h4>
						<div class="breadcrumb__links">
							<a href="./index.html">Home</a> <span>Shop</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shop Section Begin -->
	<section class="shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="shop__sidebar">
						<div class="shop__sidebar__search">
							<form action="/shop?keyworks=${keywords }">
								<input type="text" name="keywords" value="${keywords}"
									id="search-input" placeholder="Search here.....">
								
							</form>
						</div>
						<div class="shop__sidebar__accordion">
							<div class="accordion" id="accordionExample">
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseOne">Categories</a>
									</div>
									<div id="collapseOne" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="shop__sidebar__categories">
												<ul class="nice-scroll">
													<li><a href="/shop?categoryid=0">Tất cả</a></li>
													<c:forEach var="itemsCate" items="${category }">
														<li><a href="/shop?categoryid=${itemsCate.id }">${itemsCate.name }</a></li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<!-- 								<div class="card"> -->
								<!-- 									<div class="card-heading"> -->
								<!-- 										<a data-toggle="collapse" data-target="#collapseTwo">Branding</a> -->
								<!-- 									</div> -->
								<!-- 									<div id="collapseTwo" class="collapse show" -->
								<!-- 										data-parent="#accordionExample"> -->
								<!-- 										<div class="card-body"> -->
								<!-- 											<div class="shop__sidebar__brand"> -->
								<!-- 												<ul> -->
								<!-- 													<li><a href="#">Louis Vuitton</a></li> -->
								<!-- 													<li><a href="#">Chanel</a></li> -->
								<!-- 													<li><a href="#">Hermes</a></li> -->
								<!-- 													<li><a href="#">Gucci</a></li> -->
								<!-- 												</ul> -->
								<!-- 											</div> -->
								<!-- 										</div> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseThree">Filter
											Price</a>
									</div>
									<div id="collapseThree" class="collapse show"
										data-parent="#accordionExample">
										<div class="range-container">
											<div class="wrapper">
												<!-- <header>
        <h2>Price Range</h2>
        <p>Use slider or enter min and max price</p>
      </header> -->
												<div class="price-input">
													<div class="field">
														<span>Min</span> <input type="number" class="input-min"
															value="0">
													</div>
													<div class="separator">-</div>
													<div class="field">
														<span>Max</span> <input type="number" class="input-max"
															value="7500">
													</div>
												</div>
												<div class="slider">
													<div class="progress"></div>
												</div>
												<form action="/shop?rangemin=${min }&rangemax=${max}"
													class="range-input">
													<input type="range" name="rangemin" class="range-min"
														min="0" max="7500" value="0" step="100"> <input
														type="range" name="rangemax" class="range-max" min="0"
														max="7500" value="7500" step="100"> <br />
													<button class="form-control search-range" type="submit">Search</button>
												</form>
											</div>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseFour">Size</a>
									</div>
									<div id="collapseFour" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="shop__sidebar__size">
												<label for="xs">xs <input type="radio" id="xs">
												</label> <label for="sm">s <input type="radio" id="sm">
												</label> <label for="md">m <input type="radio" id="md">
												</label> <label for="xl">xl <input type="radio" id="xl">
												</label> <label for="2xl">2xl <input type="radio" id="2xl">
												</label> <label for="xxl">xxl <input type="radio" id="xxl">
												</label> <label for="3xl">3xl <input type="radio" id="3xl">
												</label> <label for="4xl">4xl <input type="radio" id="4xl">
												</label>
											</div>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseFive">Colors</a>
									</div>
									<div id="collapseFive" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="shop__sidebar__color">
												<label class="c-1" for="sp-1"> <input type="radio"
													id="sp-1">
												</label> <label class="c-2" for="sp-2"> <input type="radio"
													id="sp-2">
												</label> <label class="c-3" for="sp-3"> <input type="radio"
													id="sp-3">
												</label> <label class="c-4" for="sp-4"> <input type="radio"
													id="sp-4">
												</label> <label class="c-5" for="sp-5"> <input type="radio"
													id="sp-5">
												</label> <label class="c-6" for="sp-6"> <input type="radio"
													id="sp-6">
												</label> <label class="c-7" for="sp-7"> <input type="radio"
													id="sp-7">
												</label> <label class="c-8" for="sp-8"> <input type="radio"
													id="sp-8">
												</label> <label class="c-9" for="sp-9"> <input type="radio"
													id="sp-9">
												</label>
											</div>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseSix">Tags</a>
									</div>
									<div id="collapseSix" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="shop__sidebar__tags">
												<a href="#">Product</a> <a href="#">Bags</a> <a href="#">Shoes</a>
												<a href="#">Fashio</a> <a href="#">Clothing</a> <a href="#">Hats</a>
												<a href="#">Accessories</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="shop__product__option">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6">
								<!-- 								<div class="shop__product__option__left"> -->
								<!-- 									<p>Showing 1–12 of 126 results</p> -->
								<!-- 								</div> -->
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="shop__product__option__right">
									<p>Sort by Price:</p>
									<select onchange="location = this.value;">
										<c:choose>
											<c:when test="${sorting ==null }">
												<option value="/shop?page=0&orderby=" selected="selected">Default</option>
											</c:when>
											<c:otherwise>
												<option value="/shop?page=0&orderby=">Default</option>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${sorting =='asc' }">
												<option value="/shop?page=0&orderby=asc" selected="selected">Low
													to High</option>
											</c:when>
											<c:otherwise>
												<option value="/shop?page=0&orderby=asc">Low to
													High</option>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${sorting =='desc' }">
												<option value="/shop?page=0&orderby=desc"
													selected="selected">High to Low</option>
											</c:when>
											<c:otherwise>
												<option value="/shop?page=0&orderby=desc">High to
													Low</option>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<c:forEach var="items" items="${listProduct.content }">
							<div class="col-lg-4 col-md-6 col-sm-6 mb-2">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="${items.getImage() }">
										<ul class="product__hover">
											<li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
											<li><a href="#"><img src="img/icon/compare.png"
													alt=""> <span>Compare</span></a></li>
											<li><a href="/shop/detail/${items.getId() }"><img
													src="img/icon/search.png" alt=""></a></li>
										</ul>
									</div>
									<div class="product__item__text">
										<h6>${items.getName() }</h6>
<%-- 										<a href="/cart/add/${items.getId() }" class="add-cart">+ --%>
<!-- 											Add To Cart</a> -->
										<div class="rating">
											<span>${items.category.name }</span>
										</div>
										<h5>$${items.getPrice() }</h5>
										<!-- 										<div class="product__color__select"> -->
										<!-- 											<label for="pc-4"> <input type="radio" id="pc-4"> -->
										<!-- 											</label> <label class="active black" for="pc-5"> <input -->
										<!-- 												type="radio" id="pc-5"> -->
										<!-- 											</label> <label class="grey" for="pc-6"> <input type="radio" -->
										<!-- 												id="pc-6"> -->
										<!-- 											</label> -->
										<!-- 										</div> -->
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- 						<div class="col-lg-4 col-md-6 col-sm-6"> -->
						<!-- 							<div class="product__item sale"> -->
						<!-- 								<div class="product__item__pic set-bg" -->
						<!-- 									data-setbg="img/product/product-3.jpg"> -->
						<!-- 									<span class="label">Sale</span> -->
						<!-- 									<ul class="product__hover"> -->
						<!-- 										<li><a href="#"><img src="img/icon/heart.png" alt=""></a></li> -->
						<!-- 										<li><a href="#"><img src="img/icon/compare.png" -->
						<!-- 												alt=""> <span>Compare</span></a></li> -->
						<!-- 										<li><a href="#"><img src="img/icon/search.png" alt=""></a></li> -->
						<!-- 									</ul> -->
						<!-- 								</div> -->
						<!-- 								<div class="product__item__text"> -->
						<!-- 									<h6>Multi-pocket Chest Bag</h6> -->
						<!-- 									<a href="#" class="add-cart">+ Add To Cart</a> -->
						<!-- 									<div class="rating"> -->
						<!-- 										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i -->
						<!-- 											class="fa fa-star"></i> <i class="fa fa-star"></i> <i -->
						<!-- 											class="fa fa-star-o"></i> -->
						<!-- 									</div> -->
						<!-- 									<h5>$43.48</h5> -->
						<!-- 									<div class="product__color__select"> -->
						<!-- 										<label for="pc-7"> <input type="radio" id="pc-7"> -->
						<!-- 										</label> <label class="active black" for="pc-8"> <input -->
						<!-- 											type="radio" id="pc-8"> -->
						<!-- 										</label> <label class="grey" for="pc-9"> <input type="radio" -->
						<!-- 											id="pc-9"> -->
						<!-- 										</label> -->
						<!-- 									</div> -->
						<!-- 								</div> -->
						<!-- 							</div> -->
						<!-- 						</div> -->

					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="product__pagination">
								<c:if test="${listProduct.number >0 }">
									<a href="/shop?page=${listProduct.number - 1}&orderby=${order}">←</a>
								</c:if>
								<c:forEach var="item" begin="1" end="${listProduct.totalPages}"
									step="1">
									<a href="/shop?page=${item-1 }&orderby=${order}">${item }</a>
								</c:forEach>
								<c:if test="${listProduct.number <listProduct.totalPages-1}">
									<a href="/shop?page=${listProduct.number + 1}&orderby=${order}">→</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<jsp:include page="search.jsp"></jsp:include>
</body>
<script src="/js/range.js"></script>
<jsp:include page="js.jsp"></jsp:include>
</html>
