<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 멤버 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin.js"></script>
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header_admin.jsp"/>
	<div class="content-main">
		<h2>탈퇴 회원 목록</h2>
		<form id="search_form" action="resignedMemberList.do" method="get">
			<ul class="list-search">
				<li>
					<select name="keyfield">
						<option value="1">ID</option>
						<option value="2">이름</option>
						<option value="3">email</option>
					</select>
				</li>
				<li>
					<input type="search" size="16" name="keyword"
					       id="keyword" value="${param.keyword}">
				</li>
				<li>
					<input type="submit" value="찾기">
				</li>
			</ul>
		
		<div class="list-space align-right">
			<input type="button" value="목록" 
			     onclick="location.href='resignedMemberList.do'">  
		</div>
		<c:if test="${count == 0}">
		<div class="result-display">
			표시할 내용이 없습니다.
		</div>
		</c:if>
		<c:if test="${count > 0}">
		<table class="list-tb">
			<tr>
				<th id="first-th">ID</th>
				<th>이름</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>생년월일</th>
				<th>가입일</th>
				<th id="last-child">등급</th>
			</tr>
			<c:forEach var="member" items="${list}">
			<tr>
				<td>
					<c:if test="${member.auth == 0}">
					<a href="detailUserForm.do?member_num=${member.member_num}">${member.member_id}</a>
					</c:if>
					<c:if test="${member.auth > 0}">
					${member.member_id}
					</c:if>
				</td>
				<td>${member.name}</td>
				<td>${member.email}</td>
				<td>${member.phone}</td>
				<td>${member.birth}</td>
				<td>${member.reg_date}</td>
				<td id="last-child">
				<c:if test="${member.auth == 0}">탈퇴</c:if>
				<c:if test="${member.auth == 1}">일반</c:if>
				<c:if test="${member.auth == 2}">관리</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
		<div class="align-center">
			${page}
		</div>
		</c:if>
		</form>
	</div>
</div>
</body>
</html>