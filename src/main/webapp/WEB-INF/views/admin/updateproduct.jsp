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
									<form:form action="/admin/updateproduct" method="post"
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
											<div class="row form-group d-flex">
												<div class="col col-md-3">
													<label for="file-input" class=" form-control-label">Image
														input</label>
												</div>
												<div class="col-10 col-md-6">
													<input type="file" id="file-input" name="inputfile"
														class="form-control-file"><form:input type="text"
														id="imageinput" path="image" hidden="true"
														class="form-control-file"></form:input>
														<span style="color: red;font-style: italic;">${errorImage }</span>
														<form:errors path="image"></form:errors>
												</div>
												<div class="col-6 col-md-3">
													<img id="inputImg" alt="" src="${srcImage }" width="150" height="200">
												</div>
											</div>
										</div>
										<div class="card-footer">
											<button type="submit" class="btn btn-primary btn-sm">
												<i class="fa fa-dot-circle-o"></i> Save
											</button>
											<button type="reset" class="btn btn-danger btn-sm">
												<i class="fa fa-ban"></i> Reset
											</button>
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
	  if (!this.files || !this.files[0]) return;
	  const FR = new FileReader();
	  FR.addEventListener("load", function(evt) {
	    document.querySelector("#inputImg").src= evt.target.result;
	    document.querySelector("#imageinput").value= "true";
	  });  
	  FR.readAsDataURL(this.files[0]);
	}
	document.querySelector("#file-input").addEventListener("change", readFile);
</script>
<jsp:include page="include/js.jsp"></jsp:include>
</html>