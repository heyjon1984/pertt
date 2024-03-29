<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OTT 추천</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ott_re.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ott_re.js"></script>
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content-main align-center">
		<h2 id="recommend-h2">나에게 맞는 OTT 추천받기</h2><br>
		<p id="recommend-p">당신의 취향을 모두 선택하세요! 당신에게 딱 맞는 OTT를 퍼티가 추천해드려요.</p>
		<form action="write.do" method="post" id="ottRecommend_form"  enctype="multipart/form-data">
		<div class="checkbox1">
			<div class="cb1" id="cb1-1"><input type="checkbox" id="cb1" value="korea">한국 콘텐츠</div>
			<div class="cb1" id="cb1-2"><input type="checkbox" id="cb2" value="english">영미권 콘텐츠</div>
			<div class="cb1" id="cb1-3"><input type="checkbox" id="cb3" value="japan">일본 콘텐츠</div>
		</div>
		<div class="checkbox2">
			<div class="cb2" id="cb2-1"><input type="checkbox" id="cb4" value="movie">영화</div>
			<div class="cb2" id="cb2-2"><input type="checkbox" id="cb5" value="drama">드라마</div>
			<div class="cb2" id="cb2-3"><input type="checkbox" id="cb6" value="variety">예능</div>
		</div>
		<div class="checkbox3">
			<div class="cb3" id="cb3-1"><input type="checkbox" id="cb7" value="indi">인디</div>
			<div class="cb3" id="cb3-2"><input type="checkbox" id="cb8" value="animation">애니메이션</div>
			<div class="cb3" id="cb3-3"><input type="checkbox" id="cb9" value="SF">SF</div>
			<div class="cb3" id="cb3-4"><input type="checkbox" id="cb10" value="kbs">지상파 방송</div>
			<div class="cb3" id="cb3-5"><input type="checkbox" id="cb11" value="tvn">케이블 방송</div>
		</div>
		</form>
		<div class="price-bar">
			<p id="pricebar-p">요금제 가격대(4인 기준)</p>
		    <div>
			<input type="range" id="priceBar" name="priceBar" min="0" max="4" step="1" value="0" >
			<p id="output"></p>
			</div>
		    
		</div>
		
	
		<input type="button"  value="나에게 맞는 OTT확인하기!" id="ottCheckBtn">
		<div class="result">
			<img src="${pageContext.request.contextPath}/images/down-arrow.png" id="down_arrow" style="display:none;">
			<div class="ott-result">
			<img src="${pageContext.request.contextPath}/images/logo_netflix.png" id="netflix" style="display:none;" >
			<img src="${pageContext.request.contextPath}/images/logo_disney.png" id="disney"  style="display:none;">
			<img src="${pageContext.request.contextPath}/images/logo_watcha.png" id="watcha" style="display:none;">
			<img src="${pageContext.request.contextPath}/images/logo_tving.png" id="tving" style="display:none;">
			<img src="${pageContext.request.contextPath}/images/logo_wavve.png" id="wavve" style="display:none;">
			
			</div>
			
		</div>
		<input type="button" value="다시 선택하기" id="reset" style="display:none;" 
		onClick="window.location.reload()" >
	
		
	</div>
</div>
</body>
</html>