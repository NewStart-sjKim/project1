<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기</title>
</head>
<body>
	<div class="container" style="text-align:center">
	<h2 id="center">회원 상세 정보</h2>
	<table class="table table-hover">
		<tr><td rowspan="6" width="30%" >
			<tr><th>레벨</th>
			<td>${mem.level}&nbsp;&nbsp;
			<c:choose>
        	<c:when test="${mem.level == 1}">
            	<img src="../image/1.gif">
        	</c:when>
        	<c:when test="${mem.level == 2}">
            	<img src="../image/2.gif">
        	</c:when>
        	<c:when test="${mem.level == 3}">
            	<img src="../image/3.gif">
        	</c:when>
        	<c:when test="${mem.level == 4}">
            	<img src="../image/4.gif">
        	</c:when>
        	<c:when test="${mem.level == 5}">
        		<img src="../image/5.gif">
        	</c:when>
        	<c:when test="${mem.level == 6}">
        		<img src="../image/6.gif">
        	</c:when>
        	<c:when test="${mem.level == 7}">
        		<img src="../image/7.gif">
        	</c:when>
        	<c:when test="${mem.level == 8}">
        		<img src="../image/8.gif">
        	</c:when>
        	<c:when test="${mem.level == 9}">
        		<img src="../image/9.gif">
        	</c:when>
        	<c:when test="${mem.level == 10}">
        		<img src="../image/10.gif">
        	</c:when>        
    	</c:choose>	
			</td></tr>
		<tr><th>아이디</th><td>${mem.member_id}</td></tr>
		<c:if test="${param.member_id == 'member_id'}">
			<tr><th>전화</th><td>${mem.tel}</td></tr>
			<tr><th>이메일</th><td>${mem.email}</td></tr>
	
				<tr><td colspan="2" id="center">
		<a href="updateForm?member_id=${mem.member_id}">수정</a>
			<c:if test="${param.member_id != 'admin'}">
		<a href="deleteForm?member_id=${mem.member_id}">탈퇴</a>
		</c:if>
	</td></tr>
	</c:if>
	</table>
 		<table>
		<tr>
			<td colspan="5" style="text-align:right">내가 쓴 글개수:${boardcount}
			<a href="popularList?boardid=${boardid}"></a>
			</td>
		</tr>
		<tr>
			<th width="5%">글번호</th>
			<th width="10%">분류</th>
			<th width="40%">제목</th>
			<th width="15%">글쓴이</th>
			<th width="10%">작성일</th>
			<th width="10%">조회수</th>
			<th width="10%">추천수</th>
		</tr>
		<c:forEach var="b" items="${list}">
 			<tr>
 				<td>${boardnum}</td>
 					<c:set var="boardnum" value="${boardnum + 1}" />
 				<td>
    <c:choose>
        <c:when test="${b.category_num == 1}">
            유머
        </c:when>
        <c:when test="${b.category_num == 2}">
            썰
        </c:when>
        <c:when test="${b.category_num == 3}">
            공포
        </c:when>
        <c:when test="${b.category_num == 4}">
            감동
        </c:when>
        <c:when test="${b.category_num == 5}">
            뉴스
        </c:when>
        <c:when test="${b.category_num == 6}">
            루머
        </c:when>
        <c:when test="${b.category_num == 7}">
            움짤
        </c:when>
        <c:when test="${b.category_num == 8}">
            분석
        </c:when>
        <c:when test="${b.category_num == 9}">
            레시피
        </c:when>
        <c:when test="${b.category_num == 10}">
            맛집
        </c:when>
        <c:when test="${b.category_num == 11}">
            자랑
        </c:when>     
    </c:choose>
</td>
 				<td style="text-align: left">
 					<a href="../board/info?board_num=${b.board_num}">${b.title}</a>
 				</td>
 				<td>${b.member_id}</td>
				<%-- 오늘 등록된 게시물 날짜 format대로 출력하기 --%>
			<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="t" /> 
 			<fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd" var="r" /> 
 		<td><c:if test="${t==r}">
  	 		<fmt:formatDate value="${b.regdate}" pattern="HH:mm:ss" />
	 		</c:if>
		 <c:if test="${t!=r}">
   		 <fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd HH:mm" />
  		</c:if>
 		</td>
		 		<td>${b.readcnt}</td>
		 		<td>${b.recommendcnt}</td>
			</tr>
		</c:forEach>
		<%-- 페이지 처리하기 --%>
 		<tr>
 			<td colspan="5" class="w3-center">
      	<c:if test="${pageNum <= 1}">[이전]</c:if>
      	<c:if test="${pageNum > 1}">
      		<a href="javascript:listsubmit(${pageNum-1})">[이전]</a>
      	</c:if>
      	<c:forEach var="a" begin="${startpage}" end="${endpage}">
        	<c:if test="${a == pageNum}">[${a}]</c:if>
        	<c:if test="${a != pageNum}">
          	<a href="javascript:listsubmit(${a})">[${a}]</a>
        	</c:if>
      	</c:forEach>
      	<c:if test="${pageNum >= maxpage}">[다음]</c:if>
      	<c:if test="${pageNum < maxpage}">
      		<a href="javascript:listsubmit(${pageNum+1})">[다음]</a>
      	</c:if>
 			</td>
 		</tr>  
	</table>	
			</div>
	
</body>
</html>