<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Account</title>
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
										<i class="zmdi zmdi-account-calendar"></i>user data
									</h3>
									<div class="filters m-b-45">
										<a class="au-btn au-btn-icon au-btn--green au-btn--small" href="/admin/addaccount"
											id="addUser" type="button">
											<i class="zmdi zmdi-plus"></i>add item
										</a>
									</div>
									<div class="table-responsive table-data">
										<table class="table">
											<thead>
												<tr>
													<!-- td><label class="au-checkbox"> <input
													type="checkbox"> <span class="au-checkmark"></span>
											</label></td> -->
													<td>id</td>
													<td>name</td>
													<td>role</td>
													<td>username</td>
													<td>option</td>
													<td></td>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="user" items="${listaccount }">
													<tr>
														<td><span
															style="font-size: 15px; color: #808080; font-weight: 600;">${user.id }</span>
														</td>
														<td>
															<div class="table-data__info">
																<h6>${user.name }</h6>
																<span style="font-size: 13px; color: #808080">
																	${user.email } </span>
															</div>
														</td>
														<td><c:choose>
																<c:when test="${user.role == '1'}">
																	<span class="role admin">Admin</span>
																</c:when>
																<c:otherwise>
																	<span class="role user">User</span>
																</c:otherwise>
															</c:choose> </span></td>
														<td><span
															style="font-size: 13px; color: #808080; font-weight: 600;">${user.username }</span>
														</td>
														<td>
															<div class="table-data-feature"
																style="justify-content: flex-start;">
																<button class="item" type="button">
																	<a href="/admin/editaccount/${user.id }"><i
																		style="color: #63c76a;" class="zmdi zmdi-edit"></i></a>
																</button>
																<c:if test="${user.role != '1'}">
																	<button class="item" type="button" data-placement="top"
																		title="Delete">
																		<a
																			href="/admin/deleteaccount/${user.id }"><i
																			style="color: #fa4251;" class="zmdi zmdi-delete"></i>
																		</a>
																	</button>
																</c:if>
																
															</div>
														</td>
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