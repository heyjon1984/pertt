<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="kr.contents.vo.ContentsVO" %> 
<%@ page import="kr.contents.vo.CategoryVO" %>    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OTT 작품</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/contents.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/image-scroll.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/contents.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/image.scroll.js"></script>
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content-main">
		
		<c:forEach var="list" items="${categoryList}" varStatus="status">
		<div class="category_name">
		<h2>${list.category_name}</h2>
		</div>
		<div class="poster-main">
            <div class="place-xy scroll">
              <div class="poster-scroll">
				<c:forEach var="content" items="${requestScope['contents'+=status.index]}">
					<img src="${pageContext.request.contextPath}/upload/${content.poster}" class="contentsImg"
					  onclick="location.href='${pageContext.request.contextPath}/review/review.do?c_num=${content.c_num}'">
				</c:forEach>
			 </div>
			</div>
			<div class="btn-left left" style="display: none;">
                <button type="button" class="poster-btn">
                   <span>&lt;</span>
                </button>
            </div>
            <div class="btn-right right" <c:if test="${empty requestScope['contents'+=status.index]}">style="display:none;"</c:if>>
                <button type="button" class="poster-btn">
                   <span>&gt;</span>    
                </button>
            </div>
		</div>	 	
		</c:forEach>
	</div>
</div>
</body>
</html>






