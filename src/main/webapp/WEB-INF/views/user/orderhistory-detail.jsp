<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../head.jsp"%>
<base href="${pageContext.servletContext.contextPath}">
<link rel="stylesheet" href="/css/order-detail.css" type="text/css">
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
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${orders.size() <1 }"> --%>
<!-- 			<section class="shopping-cart spad"> -->
<!-- 				<div class="container" style="display: flex;"> -->
<!-- 					<div style="margin: auto"> -->
<!-- 						<h2>Bạn chưa mua sản phẩm!!!</h2> -->
<!-- 						<img alt="" src="/img/shopping-cart/empty.png"> -->
<!-- 						<h5>Hãy nhanh tay chọn ngay sản phẩm yêu thích.</h5> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</section> -->
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
			<div class="container-fluid">

				<div class="container">
					<!-- Title -->
					<div class="d-flex justify-content-between align-items-center py-3">
						<h2 class="h5 mb-0">
							<a href="#" class="text-muted"></a> Order #${invoice.id }
						</h2>
					</div>

					<!-- Main content -->
					<div class="row">
						<div class="col-lg-12">
							<!-- Details -->
							<div class="card mb-4">
								<div class="card-body">
									<div class="mb-6 d-flex justify-content-between">
										<div>
											<span class="me-3" style="margin-right: 10px">${invoice.datecreate }</span>
											<span class="me-3" style="margin-right: 10px">Pay in
												Cash</span>
											<c:choose>
												<c:when test="${invoice.status == '0' }">
													<span class="badge rounded-pill bg-info">Pending!!!</span>
												</c:when>
												<c:otherwise>
													<span class="badge rounded-pill bg-info">Complete!!!</span>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="d-flex">
											<a href="/cart/order-history"
												class="btn btn-link p-0 me-3 d-none d-lg-block btn-icon-text">
												<i class="bi bi-download"></i> <span class="text">Back
													to Order History</span>
											</a>
										</div>
									</div>
									<table class="table table-borderless">
										<tbody>
											<c:forEach var="items" items="${orders }">
												<tr>
													<td>
														<div class="d-xl-flex">
															<div class="flex-shrink-0">
																<img
																	src="${items.product.image }"
																	alt="" width="35" class="img-fluid">
															</div>
															<div class="flex-xl-grow-1 ms-3">
																<h6 class="lagre mr-3">
																	<a href="#" class="text-reset">${items.product.name }</a>
																</h6>
																<span class="small">Size: ${items.size }</span>
																<span class="small" style="margin: 0 10px">|</span>
																<span class="small">Color: ${items.color }</span>
															</div>
														</div>
													</td>
													<td></td>
													<td>Quantity: ${items.quantity }</td>
													<td class="text-end">Price: $79.99</td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="2">Subtotal</td>
												<td></td>
												<td class="text-end">$${amount }</td>
											</tr>
											<!-- 											<tr> -->
											<!-- 												<td colspan="2">Shipping</td> -->
											<!-- 												<td class="text-end">$20.00</td> -->
											<!-- 											</tr> -->
											<!-- 											<tr> -->
											<!-- 												<td colspan="2">Discount (Code: NEWYEAR)</td> -->
											<!-- 												<td class="text-danger text-end">-$10.00</td> -->
											<!-- 											</tr> -->
											<tr class="fw-bold">
												<td colspan="2">TOTAL</td>
												<td></td>
												<td class="text-end">$${amount }</td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
							<!-- Payment -->
							<div class="card mb-4">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-4">
											<h3 class="h6">Payment Method</h3>
											<p>
												Pay in Cash <br> Total: $${amount } <span
													class="badge bg-success rounded-pill">PAID</span>
											</p>
										</div>
										<div class="col-lg-6">
											<h3 class="h6">Billing address</h3>
											<address>
												<strong>${invoice.account.name }</strong><br> ${invoice.address }<br>
												<abbr title="Phone">P:</abbr>
												${invoice.phonenumber }
											</address>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>
	<jsp:include page="../footer.jsp"></jsp:include>
	<jsp:include page="../search.jsp"></jsp:include>
</body>
<jsp:include page="../js.jsp"></jsp:include>
</html>
