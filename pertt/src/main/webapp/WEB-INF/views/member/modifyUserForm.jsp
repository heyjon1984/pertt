<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypage.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/member.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/contents.js"></script>
</head>
<body>
	<div class="page-main">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="content-main">
				<h2>MY PAGE</h2>
				<div class="mypage_main">
					<div class="mp-my3">
							<form class="mp-form" action="modifyUser.do" method="post"
							id="modify_form">
							
							<div class="mypage-inner">
					<input type="hidden" id="member_num" value="${member.member_num}">
								<table class="mp-info">
									<tr>
										<td colspan="2" class="mp-TxT">회원정보</td>
									</tr>

									<tr>
										<td class="mp-1">아이디</td>
										<td class="mp-4">${member.member_id}</td>
									</tr>
									<tr>
										<td class="mp-1">현재 비밀번호</td>
										<td class="mp-4"><input type="password"
											name="origin_passwd" id="origin_passwd" maxlength="12"></td>
									</tr>
									<tr>
										<td class="mp-1">새 비밀번호</td>
										<td><input type="password" name="passwd" id="passwd"
											maxlength="12"></td>
									</tr>
									<tr>
										<td class="mp-1">새 비밀번호 확인</td>
										<td><input type="password" name="cpasswd" id="cpasswd"
											maxlength="12"><br> <span id="message_cpasswd"
											style="color: rgb(46, 204, 113); font-weight: lighter;"></span></td>
									</tr>
									<tr>
										<td class="mp-1">이름</td>
										<td>${member.name}</td>
									</tr>
									<tr>
										<td class="mp-1">생년월일</td>
										<td>${member.birth}</td>
									</tr>
									<tr>
										<td class="mp-1">휴대폰</td>
										<td><select name="phone1" id="phone1" class="inBorder">
												<option value="010">010
												<option value="016">016
												<option value="017">017
												<option value="018">018
										</select> - <input type="number" name="phone2" id="phone2"
											maxlength="4" size="5"> - <input type="number"
											name="phone3" id="phone3" maxlength="4" size="5"></td>
									</tr>
									<tr>
										<td class="mp-3">이메일</td>
										<td class="mp-2"><input type="text" name="email"
											id="email"></td>
									</tr>


								</table>
								</div>
								
								<ul class="mp-btn">
									<li><input type="submit" value="수정" class="blue-btn">
										<input type="button" value="뒤로가기" class="gray-btn"
										onclick="location.href='myPage.do'"></li>
								</ul>
							</form>
					
				<div class="myre_main">
						<form action="Review.do" id="Review" method="post" class="mypage-my4">
						 	
						 	<div class="mp-TxT">내 글 조회</div>
						 	
					<div class="re">

							<div class="my-ottRe">
							OTT 리뷰
							</div>
							<ul>
								
								<li class="ottRe"><select name="ottReview">
									<option value="넷플릭스">넷플릭스</option>
									<option value="디즈니플러스">디즈니+</option>
									<option value="티빙">티빙</option>
									<option value="왓챠">왓챠</option>
									<option value="웨이브">웨이브</option>
							</select></li>
							<li class="ottRe" style="color:#fcbf19;"><b>★ 3</b></li>
							<li class="ottRe">오리지널 작품에 볼 게 없다</li>
							</ul>
					</div>
					
					<!-- 작품 리뷰 -->
			<div class="re">
						<div class="my-ottRe">
							작품 리뷰
							<div class="more">
							<!-- 더보기 아이콘 > 리뷰 리스트로 이동 -->									
								<img src="${pageContext.request.contextPath}/images/더보기.png"
									width="40px" height="25px" onclick="location.href='myReviewList.do'">
							</div> <!-- 더보기 아이콘 닫음 -->
							</div>
					
					
						<!-- 리뷰 목록 부분 -->
				
				<div class="rere">
						<c:forEach var="review" items="${review }" >

					<div class="rere2">
						<a href="${pageContext.request.contextPath}/review/reviewDetail.do?c_review_num=${review.c_review_num}&c_num=${review.c_num}">
							<img class="myre_poster" id="contents-image" src="${pageContext.request.contextPath}/images/${review.ott_num}/${review.poster}">
						 <span style="color:#fcbf19;" class="star_re"><b>★ ${review.star}</b></span><br>
							<span id="regdate">${review.c_review_reg_date}</span>
						</a>
					</div>	
						</c:forEach>
						
				 </div>
					
					 <div class="float-clear">
		    			<hr width="100%" size="1" noshade="noshade" class="hrmy">
		    		</div>
			</div>
				
						<div class="re">
							<div class="my-ottRe">
								내 댓글 목록			
								<div class="more">
									<img src="${pageContext.request.contextPath}/images/더보기.png"
										width="40px" height="25px" onclick="location.href='myCommentList.do'">
									
								</div>
							</div>
							<c:forEach var="comment" items="${comment }" >
							<div class="rere3">
									<div id="my_com" class="my_com">
									<div class="comment-box" 
									onclick="location.href='${pageContext.request.contextPath}/review/reviewDetail.do?c_review_num=${comment.c_review_num}&c_num=${comment.c_num}'">
										<span id="com_reg_date" style="color:#969696;" > ${comment.com_reg_date } | </span>
										<span id="review_content" style="color:#828282;"> 리뷰 내용 :  ${fn:substring(comment.review.c_review_content,0,12)}… </span><br>
										<span id="com_content"> ${fn:substring(comment.com_content, 0, 25)} </span>
										 <div class="float-clear"><hr class="hrmy2"></div>
									</div>
									</div></div>
								</c:forEach>
								</div>
						 	
						 		
				
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
	


</body>
</html>
