<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>Checkout example · Bootstrap</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/checkout/">

<!-- Bootstrap core CSS -->
<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet" href="/css/checkout.css" type="text/css">
<%@include file="head.jsp"%>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
</head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body class="bg-light">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Shop Details Section Begin -->
	<div class="container">
		<c:choose>
			<c:when test="${amount <=0 }">
				<section class="shopping-cart spad">
					<div class="container" style="display: flex;justify-content: center;">
						<div style="display: flex;justify-content: center;flex-direction: column;">
							<h2>Bạn chưa chọn sản phẩm.</h2>
							<img alt="" src="/img/shopping-cart/empty.png">
							<h5 >Hãy nhanh tay chọn ngay sản phẩm yêu thích.</h5>
						</div>
					</div>
				</section>
			</c:when>
			<c:otherwise>
				<div class="row" style="margin: 40px 0">
					<div class="col-md-4 order-md-2 mb-4">
						<h4 class="d-flex justify-content-between align-items-center mb-3">
							<span class="text-muted">Your cart</span>
							<!-- 					<span -->
							<!-- 						class="badge badge-secondary badge-pill">3</span> -->
						</h4>
						<ul class="list-group mb-3">
							<c:forEach items="${cart.getItems() }" var="item">
								<li
									class="list-group-item d-flex justify-content-between lh-condensed">
									<div>
										<h6 class="my-0">${item.name }</h6>
										<small class="text-muted">Size: ${item.size } | Color:
											${item.color }</small>
									</div> <span class="text-muted">$${item.price }</span>
								</li>
							</c:forEach>
							<li class="list-group-item d-flex justify-content-between"><span>Total
									(USD)</span> <strong>$${amount }</strong></li>
						</ul>

						<form class="card p-2">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Promo code">
								<div class="input-group-append">
									<button type="submit" class="btn btn-secondary">Redeem</button>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-8 order-md-1">
						<h4 class="mb-3">Billing address</h4>
						<form class="needs-validation" novalidate action="/checkout"
							method="post">
							<div class="row">
								<div class="col-md-12 mb-3">
									<label for="firstName">Full name</label> <input type="text"
										class="form-control" id="firstName" placeholder=""
										value="${currentuser.name }" disabled="disabled" required>
									<div class="invalid-feedback">Valid full name is
										required.</div>
								</div>
								<!-- 						<div class="col-md-6 mb-3"> -->
								<!-- 							<label for="lastName">Last name</label> <input type="text" -->
								<!-- 								class="form-control" id="lastName" placeholder="" value="" -->
								<!-- 								required> -->
								<!-- 							<div class="invalid-feedback">Valid last name is required. -->
								<!-- 							</div> -->
								<!-- 						</div> -->
							</div>

							<div class="mb-3">
								<label for="username">Username</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">@</span>
									</div>
									<input type="text" class="form-control" id="username"
										value="${currentuser.username }" disabled="disabled"
										placeholder="Username" required>
									<div class="invalid-feedback" style="width: 100%;">Your
										username is required.</div>
								</div>
							</div>

							<div class="mb-3">
								<label for="email">Email <span class="text-muted">(Optional)</span></label>
								<input type="email" class="form-control" id="email"
									value="${currentuser.email }" disabled="disabled"
									placeholder="you@example.com">
								<div class="invalid-feedback">Please enter a valid email
									address for shipping updates.</div>
									<span style="color: red">${erroraddress }</span>
							</div>
							<div class="mb-3">
								<label for="phone">Phonenumber</label> <input type="number"
									name="inputphone" class="form-control" id="phone"
									pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" required>
								<div class="invalid-feedback">Please enter your
									Phonenumber.</div>
									<span style="color: red">${errorphone }</span>
							</div>

							<div class="mb-3">
								<label for="address">Address</label> <input type="text"
									name="inputaddress" class="form-control" id="address"
									placeholder="1234 Main St" required>
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>

							<!-- 					<h4 class="mb-3">Payment</h4> -->

							<!-- 					<div class="d-block my-3"> -->
							<!-- 						<div class="custom-control custom-radio"> -->
							<!-- 							<input id="credit" name="paymentMethod" type="radio" -->
							<!-- 								class="custom-control-input" checked required> <label -->
							<!-- 								class="custom-control-label" for="credit">Credit card</label> -->
							<!-- 						</div> -->
							<!-- 						<div class="custom-control custom-radio"> -->
							<!-- 							<input id="debit" name="paymentMethod" type="radio" -->
							<!-- 								class="custom-control-input" required> <label -->
							<!-- 								class="custom-control-label" for="debit">Debit card</label> -->
							<!-- 						</div> -->
							<!-- 						<div class="custom-control custom-radio"> -->
							<!-- 							<input id="paypal" name="paymentMethod" type="radio" -->
							<!-- 								class="custom-control-input" required> <label -->
							<!-- 								class="custom-control-label" for="paypal">PayPal</label> -->
							<!-- 						</div> -->
							<!-- 					</div> -->
							<!-- 					<div class="row"> -->
							<!-- 						<div class="col-md-6 mb-3"> -->
							<!-- 							<label for="cc-name">Name on card</label> <input type="text" -->
							<!-- 								class="form-control" id="cc-name" placeholder="" required> -->
							<!-- 							<small class="text-muted">Full name as displayed on card</small> -->
							<!-- 							<div class="invalid-feedback">Name on card is required</div> -->
							<!-- 						</div> -->
							<!-- 						<div class="col-md-6 mb-3"> -->
							<!-- 							<label for="cc-number">Credit card number</label> <input -->
							<!-- 								type="text" class="form-control" id="cc-number" placeholder="" -->
							<!-- 								required> -->
							<!-- 							<div class="invalid-feedback">Credit card number is -->
							<!-- 								required</div> -->
							<!-- 						</div> -->
							<!-- 					</div> -->
							<!-- 					<div class="row"> -->
							<!-- 						<div class="col-md-3 mb-3"> -->
							<!-- 							<label for="cc-expiration">Expiration</label> <input type="text" -->
							<!-- 								class="form-control" id="cc-expiration" placeholder="" required> -->
							<!-- 							<div class="invalid-feedback">Expiration date required</div> -->
							<!-- 						</div> -->
							<!-- 						<div class="col-md-3 mb-3"> -->
							<!-- 							<label for="cc-cvv">CVV</label> <input type="text" -->
							<!-- 								class="form-control" id="cc-cvv" placeholder="" required> -->
							<!-- 							<div class="invalid-feedback">Security code required</div> -->
							<!-- 						</div> -->
							<!-- 					</div> -->
							<hr class="mb-4">
							<button class="btn btn-primary btn-lg btn-block" type="submit">Confirm</button>
						</form>
					</div>
				</div>
			</c:otherwise>
		</c:choose>


	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<jsp:include page="search.jsp"></jsp:include>
	<jsp:include page="js.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script
		src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
		crossorigin="anonymous"></script>
	<script
		src="https://getbootstrap.com/docs/4.3/examples/checkout/form-validation.js"></script>
</body>
</html>
