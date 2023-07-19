<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../head.jsp"%>
<base href="${pageContext.servletContext.contextPath}">
</head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Order history</h4>
						<div class="breadcrumb__links">
							<a href="./index.html">Home</a> <a href="./shop.html">Shop</a> <span>Order
								history</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<c:choose>
		<c:when test="${invoice.size() <1 }">
			<section class="shopping-cart spad">
				<div class="container" style="display: flex;">
					<div style="margin: auto">
						<h2>Bạn chưa mua sản phẩm!!!</h2>
						<img alt="" src="/img/shopping-cart/empty.png">
						<h5>Hãy nhanh tay chọn ngay sản phẩm yêu thích.</h5>
					</div>
				</div>
			</section>
		</c:when>
		<c:otherwise>
			<!-- Shopping Cart Section Begin -->
			<section class="shopping-cart spad">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="shopping__cart__table">
								<table>
									<thead>
										<tr>
											<th>Id</th>
											<th>Date</th>
											<th>Username</th>
											<th>Number</th>
											<th>Address</th>
											<th>Status</th>
											<th>Option</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${invoice}">
											<form action="/cart/update" method="post">
											<tr>
												<td>
													<h5>${item.id }</h5>
												</td>
												<td class="cart__price">${item.datecreate }</td>
												<td class="cart__price">${item.account.name }</td>
												<td class="cart__price">${item.phonenumber }</td>
												<td>${item.address }</td>
												<c:choose>
													<c:when test="${item.status == 'false' }">
														<td class="cart__price" style="color: orange;">
															Pending!!!</td>
															<td class="cart__close"><a
															href="/cart/order-history/detail/${item.id}"><i class="fa fa-info" style="color: green"></a></td>
														<td class="cart__close" ><a 
															href="/cart/order-history/remove/${item.id}"></i><i class="fa fa-close" style="color: red"></i></a></td>
													</c:when>
													<c:otherwise>
														<td class="cart__price" style="color: green;">
															Complete!!!</td>
															<td class="cart__close"><a
															href="/cart/order-history/detail/${item.id}"><i class="fa fa-info" style="color: green"></a></td>
													</c:otherwise>
												</c:choose>
											</tr>
											</form>
										</c:forEach>
										<!-- 								<tr> -->
										<!-- 									<td class="product__cart__item"> -->
										<!-- 										<div class="product__cart__item__pic"> -->
										<!-- 											<img src="img/shopping-cart/cart-1.jpg" alt=""> -->
										<!-- 										</div> -->
										<!-- 										<div class="product__cart__item__text"> -->
										<!-- 											<h6>T-shirt Contrast Pocket</h6> -->
										<!-- 											<h5>$98.49</h5> -->
										<!-- 										</div> -->
										<!-- 									</td> -->
										<!-- 									<td class="quantity__item"> -->
										<!-- 										<div class="quantity"> -->
										<!-- 											<div class="pro-qty-2"> -->
										<!-- 												<input type="text" value="1"> -->
										<!-- 											</div> -->
										<!-- 										</div> -->
										<!-- 									</td> -->
										<!-- 									<td class="cart__price">$ 30.00</td> -->
										<!-- 									<td class="cart__close"><i class="fa fa-close"></i></td> -->
										<!-- 								</tr> -->
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
		</c:otherwise>
	</c:choose>
	<jsp:include page="../footer.jsp"></jsp:include>
	<jsp:include page="../search.jsp"></jsp:include>
</body>
<jsp:include page="../js.jsp"></jsp:include>
</html>
