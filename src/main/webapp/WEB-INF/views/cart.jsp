<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="head.jsp"%>
<base href="${pageContext.servletContext.contextPath}">
</head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Shopping Cart</h4>
						<div class="breadcrumb__links">
							<a href="./index.html">Home</a> <a href="./shop.html">Shop</a> <span>Shopping
								Cart</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<c:choose>
		<c:when test="${amount <=0 }">
			<section class="shopping-cart spad">
				<div class="container" style="display: flex;">
					<div style="margin: auto">
						<h2>Bạn chưa chọn sản phẩm.</h2>
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
						<div class="col-lg-8">
							<div class="shopping__cart__table">
								<table>
									<thead>
										<tr>
											<th>Product</th>
											<th>Quantity</th>
											<th>Size</th>
											<th>Color</th>
											<th>Total</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${cart.getItems()}">
											<form action="/cart/update" method="post">
												<input type="hidden" name="id" value="${item.id}">
												<tr>
													<td class="product__cart__item">
														<div class="product__cart__item__pic">
															<img width="100" height="150" src="${item.getImage() }"
																alt="">
														</div>
														<div class="product__cart__item__text">
															<h6>${item.getName() }</h6>
															<h5>${item.getPrice() }</h5>
														</div>
													</td>
													<td class="quantity__item">
														<div class="quantity">
															<div class="pro-qty-2">
																<input type="text" name="quantity"
																	value="${item.getQuantity() }"
																	onblur="this.form.submit()">
															</div>
														</div>
													</td>
													<td class="cart__price">${item.size }</td>
													<td class="cart__price">${item.color }</td>
													<td class="cart__price" style="color: red;">$ ${item.price * item.quantity}</td>
													<td class="cart__close"><a
														href="/cart/remove/${item.id}"><i class="fa fa-close"></i></a></td>
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
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="continue__btn">
										<a href="/shop">Continue Shopping</a>
									</div>
								</div>
<!-- 								<div class="col-lg-6 col-md-6 col-sm-6"> -->
<!-- 									<div class="continue__btn update__btn"> -->
<!-- 										<a href="#"><i class="fa fa-spinner"></i> Update cart</a> -->
<!-- 									</div> -->
<!-- 								</div> -->
							</div>
						</div>
						<div class="col-lg-4">
							<div class="cart__discount">
								<h6>Discount codes</h6>
								<form action="#">
									<input type="text" placeholder="Coupon code">
									<button type="submit">Apply</button>
								</form>
							</div>
							<div class="cart__total">
								<h6>Cart total</h6>
								<ul>
									<li>Subtotal <span>$ ${amount }</span></li>
									<li>Total <span>$ ${amount }</span></li>
								</ul>
								<a href="/checkout" class="primary-btn">Proceed to checkout</a>
							</div>
						</div>
					</div>
				</div>
			</section>
		</c:otherwise>
	</c:choose>
	<jsp:include page="footer.jsp"></jsp:include>
	<jsp:include page="search.jsp"></jsp:include>
</body>
<jsp:include page="js.jsp"></jsp:include>
</html>
