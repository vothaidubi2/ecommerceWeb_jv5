<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<!-- Designined by CodingLab - youtube.com/codinglabyt -->
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<title>Responsive Registration Form | CodingLab</title>
<link rel="stylesheet" href="/css/register.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>
</head>
<body>
	<div class="container">
		<div class="title">Registration</div>
		<div class="content">
			<form:form action="/account/register" method="post"
				modelAttribute="register">
				<div class="user-details">
					<div class="input-box">
						<span class="details">Full Name</span>
						<form:input type="text" placeholder="Enter your name" path="name"></form:input>
						<form:errors path="name"></form:errors>
					</div>
					<div class="input-box">
						<span class="details">Email</span>
						<form:input type="text" placeholder="Enter your email"
							path="email"></form:input>
						<form:errors path="email"></form:errors>
						<span style="color: red; font-style: italic;">${erroremail }</span>
					</div>
					<div class="input-box">
						<span class="details">Username</span>
						<form:input type="text" placeholder="Enter your username"
							path="username"></form:input>
						<form:errors path="username"></form:errors>
						<span style="color: red; font-style: italic;">${errorusername }</span>
					</div>
					<div class="input-box">
						<span class="details">Password</span>
						<form:input type="password" placeholder="Enter your password"
							path="password"></form:input>
						<form:errors path="password"></form:errors>
					</div>
				</div>
				<div class="button">
					<input type="submit" value="Register">
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>
