<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기</title>
</head>
<body>
	<div class="container">
	<h2 id="center">회원 상세 정보</h2>
	<table class="table table-hover">
		<tr><td rowspan="6" width="30%">
		<th width="20%">아이디</th><td>${mem.member_id}</td></tr>
			<tr><th>전화</th><td>${mem.tel}</td></tr>
			<tr><th>이메일</th><td>${mem.email}</td></tr>
			<tr><td colspan="2" id="center">
		<a href="updateForm?member_id=${mem.member_id}">수정</a>
			<c:if test="${param.member_id != 'admin'}">
		<a href="deleteForm?member_id=${mem.member_id}">탈퇴</a>
		</c:if>
	</td></tr>
	</table>
	</div>
</body>
</html>
