<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<%@include file="head.jsp"%>
<base href="${pageContext.servletContext.contextPath}">
</head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
	<%@include file="home.jsp"%>
</body>
	<jsp:include page="js.jsp"></jsp:include>
</html>