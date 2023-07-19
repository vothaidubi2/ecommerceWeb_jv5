<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Category</title>
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
							<div class="col-lg-12">
								<!-- USER DATA-->
								<div class="user-data m-b-30">
									<h3 class="title-3 m-b-30">
										<i class="zmdi zmdi-account-calendar"></i>category data
									</h3>
									<div class="d-flex">
										<div class="table-responsive table-data col-lg-6">
											<table class="table">
												<thead>
													<tr>
														<td>name</td>
														<td>option</td>
														<td></td>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="items" items="${listCate }">
														<tr>
															<td>
																<div class="table-data__info">
																	<h6>${items.name }</h6>
																</div>
															</td>
															<td>
																<div class="table-data-feature">
																	<a class="item" data-toggle="tooltip"
																		href="/admin/category/edit/${items.id }"
																		data-placement="top" title="Edit"> <i
																		class="zmdi zmdi-edit" style="color: #63C76A"></i>
																	</a> <a class="item" data-toggle="tooltip"
																		href="/admin/category/delete/${items.id }" data-placement="top"
																		title="Delete"> <i class="zmdi zmdi-delete"
																		style="color: red"></i>
																	</a>
																</div>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<div class="col-lg-6">
											<div class="card">
												<div class="card-header">
													<strong>Category</strong> Form
												</div>
												<div class="card-body card-block">
													<form action="/admin/addcategory" method="post" class="form-horizontal">
														<div class="row form-group">
															<div class="col col-md-3">
																<label for="hf-email" class=" form-control-label">Category
																	name</label>
															</div>
															<div class="col-12 col-md-9">
																<input type="text" id="hf-email" name="nameCate" value="${item.name }"
																	placeholder="Enter Category..." class="form-control">

															</div>
														</div>
														<div class="card-footer">
															<button type="submit" class="btn btn-primary btn-sm">
																<i class="fa fa-dot-circle-o"></i> Save
															</button>
															<button type="submit" class="btn btn-primary btn-sm" formaction="/admin/updatecategory/${item.id }">
																<i class="fa fa-dot-circle-o"></i> Update
															</button>
															<!-- 												<button type="reset" class="btn btn-danger btn-sm"> -->
															<!-- 													<i class="fa fa-ban"></i> Reset -->
															<!-- 												</button> -->
														</div>
													</form>
												</div>
											</div>
										</div>

									</div>
								</div>
								<!-- END USER DATA-->
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