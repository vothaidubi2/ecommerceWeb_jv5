<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Orders</title>
<jsp:include page="include/head.jsp"></jsp:include>
</head>
<body class="animsition">
	<div class="page-wrapper">
		<jsp:include page="include/header.jsp"></jsp:include>
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<jsp:include page="include/desktop-header.jsp"></jsp:include>

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<!-- USER DATA-->
								<div class="user-data m-b-30">
									<h3 class="title-3 m-b-30">
										<i class="zmdi zmdi-account-calendar"></i>orders data
									</h3>
									<div class="filters m-b-45">
										<!-- 										<a class="au-btn au-btn-icon au-btn--green au-btn--small" -->
										<!-- 											href="/admin/addaccount" id="addUser" type="button"> <i -->
										<!-- 											class="zmdi zmdi-plus"></i>add item -->
										<!-- 										</a> -->
									</div>
									<div class="table-responsive table-data">
										<table class="table">
											<thead>
												<tr>
													<!-- td><label class="au-checkbox"> <input
													type="checkbox"> <span class="au-checkmark"></span>
											</label></td> -->
													<td>id</td>
													<td>user</td>
													<td>address</td>
													<td>datecreate</td>
													<td>status</td>
													<td>option</td>
													<td></td>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="orders" items="${listorders }">
													<tr>
														<td><span
															style="font-size: 15px; color: #808080; font-weight: 600;">${orders.id }</span>
														</td>
														<td>
															<div class="table-data__info">
																<h6>${orders.account.name }</h6>
																<span style="font-size: 13px; color: #808080">
																	${orders.phonenumber } </span>
															</div>
														</td>
														<td><span>${orders.address }</span></td>
														<td><span>${orders.datecreate }</span></td>
														<td><c:choose>
																<c:when test="${orders.status !=true}">
																	<span class="role admin">Pending!!!</span>
																	<td>
																		<div class="table-data-feature"
																			style="justify-content: flex-start;">
																			<button class="item" type="button">
																				<a href="/cart/order-history/detail/${orders.id}"><i
																					class="fa fa-info" style="color: green"></i></a>
																			</button>
																			<button class="item" type="button">
																				<a href="/admin/confirmorders/${orders.id }"><i
																					style="color: #63c76a;" class="fa fa-check"></i></a>
																			</button>
																		</div>
																	</td>
																</c:when>
																<c:otherwise>
																	<span class="role user" style="background: #63c76a;">Complette!!!</span>
																	<td>
																		<div class="table-data-feature"
																			style="justify-content: flex-start;">
																			<button class="item" type="button">
																				<a href="/cart/order-history/detail/${orders.id}"><i
																					class="fa fa-info" style="color: green"></i></a>
																			</button>
																		</div>
																	</td>
																</c:otherwise>
															</c:choose> </span></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<!-- END USER DATA-->
							</div>

						</div>
					</div>

					<jsp:include page="include/footer.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
<jsp:include page="include/js.jsp"></jsp:include>
</html>