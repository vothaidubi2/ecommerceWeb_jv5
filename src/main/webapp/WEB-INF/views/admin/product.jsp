<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Product</title>
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
								<!-- DATA TABLE -->
								<h3 class="title-5 m-b-35">data table</h3>
								<div class="table-data__tool">
									<div class="table-data__tool-left">
										<div class="rs-select2--light rs-select2--md">
											<select class="js-select2" name="property">
												<option selected="selected">All Properties</option>
												<option value="">Option 1</option>
												<option value="">Option 2</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
										<div class="rs-select2--light rs-select2--sm">
											<select class="js-select2" name="time">
												<option selected="selected">Today</option>
												<option value="">3 Days</option>
												<option value="">1 Week</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
										<button class="au-btn-filter">
											<i class="zmdi zmdi-filter-list"></i>filters
										</button>
									</div>
									<div class="table-data__tool-right">
										<a class="au-btn au-btn-icon au-btn--green au-btn--small"
											href="/admin/addproduct"> <i class="zmdi zmdi-plus"></i>add
											item
										</a>
										<div class="rs-select2--dark rs-select2--sm rs-select2--dark2">
											<select class="js-select2" name="type">
												<option selected="selected">Export</option>
												<option value="">Option 1</option>
												<option value="">Option 2</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>
								<div class="table-responsive table-responsive-data2">
									<table class="table table-data2">
										<thead>
											<tr>
												<th>Image</th>
												<th>Name</th>
												<th>Price</th>
												<th>Quantity</th>
												<th>Options</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="items" items="${itemsPD }">
												<tr class="tr-shadow">
													<td><img src="${items.image }" width="100"
														height="150"></td>
													<td class="desc">${items.name }</td>
													<td><span class="status--process">${items.price }</span></td>
													<td>${items.quantity }</td>
													<td>
														<div class="table-data-feature">
															<a class="item" data-toggle="tooltip"
																href="/admin/editproduct/${items.id }"
																data-placement="top" title="Edit"> <i
																class="zmdi zmdi-edit" style="color: #63C76A"></i>
															</a> <a class="item" data-toggle="tooltip"
																href="/admin/delete/${items.id }" data-placement="top"
																title="Delete"> <i class="zmdi zmdi-delete"
																style="color: red"></i>
															</a>
														</div>
													</td>
												</tr>
												<tr class="spacer"></tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
								<!-- END DATA TABLE -->
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