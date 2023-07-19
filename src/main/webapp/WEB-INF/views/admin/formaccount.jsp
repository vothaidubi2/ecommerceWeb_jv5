<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Add Account</title>
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
										<strong>Add</strong> Account
									</div>
									<form:form action="/admin/addaccount" method="post"
										modelAttribute="addaccount" cssClass="form-horizontal">
										<div class="card-body card-block">
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="text-input" class=" form-control-label">Name
													</label>
												</div>
												<div class="col-12 col-md-9">
													<form:input type="text" id="text-input" path="name"
														placeholder="Input Name" cssClass="form-control"></form:input>
													<form:errors path="name"></form:errors>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="email" class=" form-control-label">Email</label>
												</div>
												<div class="col-12 col-md-9">
													<form:input type="email" id="email" path="email"
														placeholder="Input Email" cssClass="form-control" min="0"></form:input>
													<form:errors path="email"></form:errors>
													<span style="color: red; font-style: italic;">${erroremail }</span>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="username" class=" form-control-label">Username
													</label>
												</div>
												<div class="col-12 col-md-9">
													<form:input type="text" id="username" path="username"
														placeholder="Input Username" cssClass="form-control"></form:input>
													<form:errors path="username"></form:errors>
													<span style="color: red; font-style: italic;">${errorusername }</span>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="password" class=" form-control-label">Password
													</label>
												</div>
												<div class="col-12 col-md-9">
													<form:input type="password" id="password" path="password"
														placeholder="Input Password" cssClass="form-control"></form:input>
													<form:errors path="password"></form:errors>
												</div>
											</div>
											<c:if test="${addaccount.role !='1' }">
												<div class="row form-group">
													<div class="col col-md-3">
														<label for="text-input" class=" form-control-label">Role</label>
													</div>
													<div class="col-12 col-md-9">
														<form:select path="role" cssClass="col col-md-3">
															<form:option value="0" label="User"></form:option>
															<form:option value="1" label="Admin"></form:option>
														</form:select>
													</div>
												</div>
											</c:if>
											<div class="card-footer">
												<c:choose>
													<c:when test="${addaccount.id ==null }">
														<button type="submit" class="btn btn-primary btn-sm">
															<i class="fa fa-dot-circle-o"></i> Save
														</button>
													</c:when>
													<c:otherwise>
														<button type="submit" class="btn btn-primary btn-sm"
															formaction="/admin/updateaccount/${addaccount.id }">
															<i class="fa fa-dot-circle-o"></i> Update
														</button>
													</c:otherwise>
												</c:choose>

												<a href="/admin/addaccount" class="btn btn-danger btn-sm">
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
<jsp:include page="include/js.jsp"></jsp:include>
</html>