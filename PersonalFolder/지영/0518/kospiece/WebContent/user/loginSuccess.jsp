<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:choose>
	<c:when test="${path=='/kospiece/rank/rank.jsp'}">${path}<jsp:forward page="/rank.do"/></c:when>
	<c:when test="${path=='/kospiece/board/board.jsp'}">${path}<jsp:forward page="/board.do"/></c:when>
	<c:when test="${path=='/kospiece/notice/notice.jsp'}">${path}<jsp:forward page="/noticeList.do"/></c:when>
	<c:when test="${path=='/kospiece/simulationlist.do'}">${path}<jsp:forward page="/simulationlist.do"/></c:when>
	<c:when test="${path=='/kospiece/simulation.do'}">${path}<jsp:forward page="/simulation.do"/></c:when>
	<c:when test="${path=='/kospiece/interest.do'}">${path}<jsp:forward page="/interest.do"/></c:when>
	<c:when test="${path=='/kospiece/board/board.jsp'}">${path}</c:when>
	<c:when test="${path=='/kospiece/board/board.jsp'}">${path}</c:when>
	<c:when test="${path=='/kospiece/board/board.jsp'}">${path}</c:when>
	<c:when test="${path=='/kospiece/board/board.jsp'}">${path}</c:when>
	<c:when test="${path=='/kospiece/board/board.jsp'}">${path}</c:when>
	<c:when test="${path=='/kospiece/board/board.jsp'}">${path}</c:when>
	<c:when test="${path=='/kospiece/board/board.jsp'}">${path}</c:when>
	<c:when test="${path=='/kospiece/board/board.jsp'}">${path}</c:when>
	
	
	<c:otherwise><jsp:forward page="/main.do"/></c:otherwise>
</c:choose>