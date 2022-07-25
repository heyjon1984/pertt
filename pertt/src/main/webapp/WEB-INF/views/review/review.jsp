<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${contents.title }</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/review.css" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/review.js"></script>
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<img id="r-main" src="${pageContext.request.contextPath}/images/dug_main.png">
	<div class="align-center">
	<div class="review-align">
	<div class="contents-detail">
		<img src="${pageContext.request.contextPath}/images/dug_poster.jpg">
		<ul>
			<li class="review_title">${contents.title }
			<!-- ott_num에 따라 ott 이름 다르게 표시 -->
				<c:if test="${contents.ott_num == 1 }">
					 NETFLIX</li>
				</c:if>
				<c:if test="${contents.ott_num == 2 }">
					 DISNEY+</li>
				</c:if>
				<c:if test="${contents.ott_num == 3 }">
					WATCHA</li>
				</c:if>
				<c:if test="${contents.ott_num == 4 }">
					TVING</li>
				</c:if>
				<c:if test="${contents.ott_num == 5 }">
					WAVVE</li>
				</c:if>
			<li>${contents.release } ${contents.genre } ${contents.country }</li>
			<li>${contents.produce}</li>
			<li>토마토</li>
		 <li><hr size="1" width="300px" noshade="noshade"></li>
		</ul>
		<div class="review-star" >
			<span>별점총점</span>
			<span class="give-star">
				<img src="${pageContext.request.contextPath}/images/give_star.jpg">
			</span>
		</div><!-- end of review_star -->
	</div><!-- end of contents_detail -->
	</div>
	
	<div class="end-float"></div>
	
	<div class="review-grey">
	<div class="review-align">
		<div class="contents_plot" onclick="href.location='reviewDetail.do'"><!-- 배경 하얗게 -->
			<p id="content-plot-title">작품 소개</p>
			<p id="content-plot">${contents.plot }<p>
		</div>
		
		<h2 class="write-review">리뷰 쓰기</h2>
		<div class="review-form">
		
		<!-- 리뷰를 이미 작성한 경우 리뷰쓰기 폼 안 보임 -->
		
		<div id="review_duplicated">
			<h2>이미 리뷰를 작성했습니다.</h2>
			<input type="button" value="내 리뷰 보러가기">
		</div>
		
		<div id="review_notDuplicated">
			<!-- 리뷰 쓰기 폼 -->
			<form id="review_form">
				<input type="hidden" id="c_num" name="c_num"  value="${contents.c_num}">
				<textarea rows="10" cols="80" id="r_content" name="content" 
				<c:if test="${empty user_num}">disabled="disabled"</c:if>
				placeholder="리뷰를 입력해주세요"
				><c:if test="${empty user_num }">로그인이 필요합니다.</c:if></textarea>
				<c:if test="${!empty user_num }">
					<input type="submit" value="등록">
				</c:if>
			</form>
		</div>
		</div><!-- end of review_form -->
		
		<!-- 리뷰 목록 영역 -->
		<c:if test="${count != 0 }">
		<div class="align-center">
		<span id="text-review">리뷰</span>
			<div class="review-dropdown">
					<ul class="myMenu">
					    <li class="menu">
					        정렬기준
					        <ul class="menu_s submenu">
					            <li>최신순</li>
					            <li>추천순</li>
					            <li>댓글순</li>
					        </ul>   
					    </li>
					</ul>
			</div>
		</div>
		<div class="review-view">
			<c:forEach  var="review" items="${list}">
				<div class="review-box" onclick="location.href='reviewDetail.do?r_num=${review.c_review_num}'">
					<span id="id">${review.id }</span>
					<span id="star">별점</span>
					<p id="content">${fn:substring(review.c_review_content, 0, 106)}</p>
					<span id="like">추천수</span>
				</div>
			</c:forEach>
		</div>
		<div class="end-float"></div>
		<div class="align-center">
			<div id="review-page">
				${page}
			</div>
		</div>
		</c:if>
		<c:if test="${count == 0 }">
			<h2>리뷰가 없습니다.</h2>
		</c:if>
	</div><!-- end of review_grey -->
	</div>
	</div>
</div>
</body>
</html>











