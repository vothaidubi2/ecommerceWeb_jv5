<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Send Email</title>
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
							<div class="col-lg-6">
								<div class="card">
									<div class="card-header">Form</div>
									<div class="card-body">
										<div class="card-title">
											<h3 class="text-center title-2">Send Email</h3>
										</div>
										<hr>
										<form action="/admin/send-email" method="post"
											novalidate="novalidate">
											<div class="form-group">
												<label for="from" class="control-label mb-1">From</label> <input
													id="from" name="form" type="text" class="form-control"
													aria-required="true" aria-invalid="false"
													value="thaivpk02670@fpt.edu.vn">
											</div>
											<div class="form-group has-success">
												<label for="to" class="control-label mb-1">To</label> <input
													id="to" name="to" type="text"
													class="form-control cc-name valid" data-val="true"
													data-val-required="Please enter the name on card"
													autocomplete="cc-name" aria-required="true"
													aria-invalid="false" aria-describedby="cc-name-error">
												<span class="help-block field-validation-valid"
													data-valmsg-for="cc-name" data-valmsg-replace="true"></span>
											</div>
											<div class="form-group">
												<label for="subject" class="control-label mb-1">Subject</label>
												<input id="subject" name="subject" type="text"
													class="form-control cc-number identified visa" value=""
													data-val="true"
													data-val-required="Please enter the card number"
													data-val-cc-number="Please enter a valid card number"
													autocomplete="cc-number"> <span class="help-block"
													data-valmsg-for="cc-number" data-valmsg-replace="true"></span>
											</div>
											<div class="form-group">
												<label for="body" class="control-label mb-1">Body</label>
												<textarea id="body" name="body" type="text"
													class="form-control cc-number identified visa" value=""
													data-val="true"
													data-val-required="Please enter the card number"
													data-val-cc-number="Please enter a valid card number"
													autocomplete="cc-number"> </textarea>
												<span class="help-block" data-valmsg-for="cc-number"
													data-valmsg-replace="true"></span>
											</div>
											<span style="text-align: center">${message }</span>
											<div>
												<button id="payment-button" type="submit"
													class="btn btn-lg btn-info btn-block">
													<span id="payment-button-amount">Send</span>
												</button>
											</div>
										</form>
									</div>
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