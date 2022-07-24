<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header 시작 -->
<div id="admin_top">
	<div id="main_menubar">
		<a href="${pageContext.request.contextPath}/member/loginForm.do">로그인</a>
		<a href="${pageContext.request.contextPath}/member/registerUserForm.do">회원가입</a>
	</div>
	<div id="admin_logo">
		<a><img src="${pageContext.request.contextPath}/images/admin_logo.png" width="300" height="125">
		</a>
	</div>
	<nav class="content-left">
			<div class="adminPage_btn">관리자 페이지</div>
			<ul class="admin_cate_member">
				<li>회원 관리</li>
				<li>전체 회원</li>
				<li>탈퇴한 회원</li>
			</ul>
			<hr size="1" width="80%" color="#9a9a9a">
			<ul class="admin_cate_contents">
				<li>작품 조회</li>
				<li>전체 작품</li>
				<li>OTT</li>
				<li>카테고리</li>
				<li>등급</li>
			</ul>
			<hr size="1" width="80%" color="#9a9a9a">
			<input class="contentsRegis_btn" type="button" 
				value="작품등록" onclick="location.href='${pageContext.request.contextPath}/member/adminRegisterContentsForm.do'">
	</nav>
</div>
<!-- header 끝 -->






