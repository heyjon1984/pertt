<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content-main">
		<h1>이달의 OTT 순위</h1>
		<div class="main-rank">
			<a><img src="${pageContext.request.contextPath}/images/main_rank (2).jpg" width="250" height="350"></a>
			<a><img src="${pageContext.request.contextPath}/images/main_rank (1).jpg" width="200" height="280"></a>
			<a><img src="${pageContext.request.contextPath}/images/main_rank (3).jpg" width="200" height="280"></a>
		</div>
		
		<div class="rank1st-comment">"오리지널 영화부터 드라마,예능까지 최고!"</div>
		
		<div class="main-netflix">
			<div class="content">
			넷플릭스는 전 세계 190개국 이상의, 2.1억 명의 회원을 보유한 스트리밍<br>
			 엔터테인먼트 기업으로서 영화와 드라마, TV 프로그램, 다큐멘터리, 애니메이션 등의 <br>
			 매우 다양한 장르의 컨텐츠들을 언제, 어디서나 무제한으로 모든 기기에서 볼 수 있는 플랫폼이다.<br>

			넷플릭스 회원들이 오리지널 시리즈, 다큐멘터리, 드라마 등 다채로운 콘텐츠를 즐기는데<br>
			 들이는 시간은 하루 평균 1억 2천 5백만 시간 이상이다.
			</div>
		</div>
	</div>
</div>
</body>
</html>





