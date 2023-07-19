<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Forgot Password</title>
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
				<li class="active form_3_progessbar">
					<div>
						<p>3</p>
					</div>
				</li>
			</ul>
		</div>
		<div class="form_wrap">
			<div class="form_3 data_info" style="display: block;">
				<h2>Change Password</h2>
				<form action="/account/change-password" method="post">
					<div class="form_container">
						<div class="input_wrap">
							<label for="password">Password</label> <input type="password"
								name="password" class="input" id="password">
						</div>
						<div class="input_wrap">
							<label for="confirm_password">Confirm Password</label> <input
								type="password" name="confirmpassword" class="input"
								id="confirm_password"> <span style="color: red; margin-top: 10px">${error3 }</span>
						</div>
					</div>
					<div class="btns_wrap" style="margin-top: 30px">
						<div class="common_btns form_3_btns" style="display: flex;">
							<button type="submit" class="btn_done">Done</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal_wrapper">
		<div class="shadow"></div>
		<div class="success_wrap">
			<span class="modal_icon"><ion-icon name="checkmark-sharp"></ion-icon></span>
			<p>You have successfully completed the process.</p>
		</div>
	</div>

</body>
<script src="/js/forgotpassword.js"></script>
</html>
