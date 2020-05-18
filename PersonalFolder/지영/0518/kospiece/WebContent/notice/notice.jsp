<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 검색어를 입력하지 않고 검색을 누르는 것을 방지 -->
<script>
function checkForm() {
    if(document.getElementById("notice-content").value==""){
    	alert("검색어를 입력해주세요")
    	return false;
    }
}
</script>

<div class="title">공지사항</div>

<!-- 제목이나 내용으로 공지사항을 검색하는 form -->
<div class="notice">
	<form name="notice-search" id="notice-search" method ="post" class="notice-search" 
		action="<%= request.getContextPath()%>/noticeList.do" onsubmit="return checkForm();">
	    <select name="search">
	        <option value="ntitle">제목</option>
	        <option value="ncontent">내용</option> 
	    </select>
	    <input type="text" name="content" id="notice-content"/>
	    <input type="submit" name="notice-submit" value="검색"/>
	</form>
	
	<table border="1" width="1000" align="center">
        <tr>
        	<th>글번호</th>
        	<th>제목</th>
        	<th>작성일</th>
        	<th>조회</th>
        </tr>
			<c:forEach var="notice" items="${noticePage.content}">
        <tr>
        	<td>${notice.nno}</td>
        	<td><a href="noticeRead.do?no=${notice.nno}">${notice.title}</a></td>
        	<td>${notice.uploadDate}</td>
        	<td>${notice.hit}</td>
        </tr>
        </c:forEach>
        <c:if test="${noticePage.total==0}">
					<tr>
						<th colspan="4">
							공지사항이 없습니다.
					</tr>
				</c:if>
        <c:if test="${noticePage.total>0}">
			<tr>
				<th colspan="4">
				<!-- 검색조건이 없을 때는 페이지넘버만 파라미터로 보내기 -->
				<c:if test="${null eq content}">
					<%-- [이전prev]출력 --%>
					<c:if test="${noticePage.currentPage>5}">
					<a href="noticeList.do?page=${noticePage.startPage-5}">[이전]</a>
					</c:if>
					
					<%-- 페이지출력 [이전] [1] [2] [3] [4] [5] --%>
					<c:forEach var="pNo" begin="${noticePage.startPage}" end="${noticePage.endPage}">
					<a href="noticeList.do?page=${pNo}">[${pNo}]</a>
					</c:forEach>
					
					<%-- [다음next]출력 --%>
					<c:if test="${noticePage.endPage<noticePage.totalPages}">
					<a href="noticeList.do?page=${noticePage.startPage+5}">[다음]</a>
					</c:if>
				</c:if>
				
				<!-- 검색조건이 있을 때는 페이지넘버와 검색조건도 파라미터로 보내기 -->
				<c:if test="${null ne content}">
					<%-- [이전prev]출력 --%>
					<c:if test="${noticePage.currentPage>5}">
					<a href="noticeList.do?page=${noticePage.startPage-5}&search=${search}&content=${content}">
						[이전]</a>
					</c:if>
					
					<%-- 페이지출력 [이전] [1] [2] [3] [4] [5] --%>
					<c:forEach var="pNo" begin="${noticePage.startPage}" end="${noticePage.endPage}">
					<a href="noticeList.do?page=${pNo}&search=${search}&content=${content}">
						[${pNo}]</a>
					</c:forEach>
					
					<%-- [다음next]출력 --%>
					<c:if test="${noticePage.endPage<noticePage.totalPages}">
					<a href="noticeList.do?page=${noticePage.startPage+5}&search=${search}&content=${content}">
						[다음]</a>
					</c:if>
				</c:if>
				</th>
			</tr>
		</c:if>
     </table>
</div>

