<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Add Product</title>
<jsp:include page="include/head.jsp"></jsp:include>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>
</head>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>>
<body class="animsition">
	<div class="page-wrapper">
		<jsp:include page="include/header.jsp"></jsp:include>
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<jsp:include page="include/desktop-header.jsp"></jsp:include>
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xl-12">
								<div class="card">
									<div class="card-header">
										<strong>Add</strong> Products
									</div>
									<form:form action="/admin/addproduct" method="post"
										enctype="multipart/form-data" modelAttribute="addproduct"
										cssClass="form-horizontal">
										<div class="card-body card-block">
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Product
														name</label>
												</div>
												<div class="col-12 col-md-9">
													<form:input type="text" id="text-input" path="name"
														placeholder="Product name" cssClass="form-control"></form:input>
													<form:errors path="name"></form:errors>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Price</label>
												</div>
												<div class="col-12 col-md-9">
													<form:input type="number" id="text-input" path="price"
														placeholder="Price" cssClass="form-control" min="0"></form:input>
													<form:errors path="price"></form:errors>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Quantity</label>
												</div>
												<div class="col-12 col-md-9">
													<form:input type="number" id="text-input" path="quantity"
														placeholder="Quantity" cssClass="form-control" min="0"></form:input>
													<form:errors path="quantity"></form:errors>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Category</label>
												</div>
												<div class="col-12 col-md-9">
													<form:select path="category" cssClass="col col-md-3">
														<form:options items="${category }" itemValue="id"
															itemLabel="name" />
													</form:select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Size</label>
												</div>
												<div class="col-12 col-md-9 d-flex">
													<c:forEach var="itemssize" items="${size }">
														<div style="margin-right: 20px">
															<input type="checkbox" name="size"
																value="${itemssize.id}" /> <label for="text-input"
																class=" form-control-label">${itemssize.name}</label>
														</div>
													</c:forEach>
													<span style="color: red; font-style: italic;">${errorsize }</span>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Color</label>
												</div>
												<div class="col-12 col-md-9 d-flex">
													<c:forEach var="itemscolor" items="${color }">
														<div style="margin-right: 10px; color: ${itemscolor.name}">
															<input type="checkbox" name="color"
																value="${itemscolor.id}" /> <label for="text-input"
																class=" form-control-label">${itemscolor.name}</label>
														</div>
													</c:forEach>
												</div>
													<span style="color: red; font-style: italic;width:100%;text-align: center">${errorcolor }</span>
											</div>
											<div class="row form-group d-flex">
												<div class="col col-md-3">
													<label for="file-input" class=" form-control-label">Image
														input</label>
												</div>
												<div class="col-10 col-md-6">
													<input type="file" id="file-input" name="inputfile"
														class="form-control-file">
													<form:input type="text" id="imageinput" path="image"
														hidden="true" class="form-control-file"></form:input>
													<span style="color: red; font-style: italic;">${errorImage }</span>
													<form:errors path="image"></form:errors>
												</div>
												<div class="col-6 col-md-3">
													<img id="inputImg" alt="" src="${srcimage }" width="150"
														height="200">
												</div>
											</div>
										</div>
										<div class="card-footer">
											<c:choose>
												<c:when test="${addproduct.id ==null }">
													<button type="submit" class="btn btn-primary btn-sm">
														<i class="fa fa-dot-circle-o"></i> Save
													</button>
												</c:when>
												<c:otherwise>
													<button type="submit" class="btn btn-primary btn-sm"
														formaction="/admin/updateproduct/${addproduct.id }">
														<i class="fa fa-dot-circle-o"></i> Update
													</button>
												</c:otherwise>
											</c:choose>

											<a href="/admin/addproduct" class="btn btn-danger btn-sm">
												<i class="fa fa-ban"></i> Reset
											</a>
										</div>
									</form:form>
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
<script type="text/javascript">
	function readFile() {
		if (!this.files || !this.files[0])
			return;
		const FR = new FileReader();
		FR.addEventListener("load", function(evt) {
			document.querySelector("#inputImg").src = evt.target.result;
			document.querySelector("#imageinput").value = "true";
		});
		FR.readAsDataURL(this.files[0]);
	}
	document.querySelector("#file-input").addEventListener("change", readFile);
</script>
<jsp:include page="include/js.jsp"></jsp:include>
</html>