<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>OTP Confirm</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/forgotpassword.css" type="text/css">
</head>
<body>
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>

	<div class="wrapper">
		<div class="header">
			<ul>
				<li class="active form_1_progessbar">
					<div>
						<p>1</p>
					</div>
				</li>
				<li class="active form_2_progessbar">
					<div>
						<p>2</p>
					</div>
				</li>
				<li class="form_3_progessbar">
					<div>
						<p>3</p>
					</div>
				</li>
			</ul>
		</div>
		<div class="form_wrap">
			<div class="form_2 data_info" style="display: block;">
				<h2>OTP Confirm</h2>
				<h5 style="text-align: center;">Please check your email</h5>
				<form action="/account/otp-confirm" >
					<div class="form_container">
						<div class="input_wrap">
							<label for="otp">Otp code</label> <input type="text"
								name="otp" class="input" id="otp">
								<span style="color: red">${error2 }</span>
						</div>
					</div>
					<div class="btns_wrap" style="margin-top: 30px">
						<div class="common_btns form_2_btns" style="display: flex;">
							<button class="btn_back" formaction="/account/forgot-password">
								<span class="icon"><ion-icon name="arrow-back-sharp"></ion-icon></span>Back
							</button>
							<button type="submit" class="btn_next" formmethod="post">
								Next <span class="icon"><ion-icon
										name="arrow-forward-sharp"></ion-icon></span>
							</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
<script src="/js/forgotpassword.js"></script>
</html>
