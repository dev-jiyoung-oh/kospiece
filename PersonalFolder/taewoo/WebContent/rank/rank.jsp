<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="title">실시간 순위</div>

<!-- 로그인 했는지 검사하는 T/F 변수 선언 -->
<input type="hidden" id="login" value="${!empty AUTHUSER}">

<!-- 업종별 select박스 생성-클릭한 업종이 로직 수행 후에도 유지된다 -->
<!--  stock DB에서 select문을 통해 업종이름을 받아와 select의 option으로 나타낸다 -->
<div class="rank">
	<div class="field-search">
		업종별
		<form action="rank.do" method="post" name="fieldForm" onChange="javascript:fieldForm.submit();">
			<select id="select" name="select">
				<option value="all" <c:if test="${field == 'all'}">selected='selected'</c:if>>전체보기</option>
				<c:forEach var="fieldName" items="${fieldName}">
				<option value="${fieldName}" <c:if test="${field == fieldName}">selected='selected'</c:if>>${fieldName}</option>
				</c:forEach>
			</select>
		</form>
	</div>
	<table border="1" width="1000" align="center">
		<tr>
			<th>순위</th>
			<th>업종</th>
			<th>회사명</th>
			<th>
			<!-- 등락률을 누르면 오름차순 내림차순이 번갈아가면서 나타난다 -->
			<form action="rank.do" method="post" name="changeRateForm">
				<a href="javascript:changeRateForm.submit();">등락률</a>
				<input type="hidden" name="column" value="schangerate">
				<c:if test="${type=='schangerate'&&sort=='desc'}">
					<input type="hidden" name="orderBy" value="asc">
					<img src="<%= request.getContextPath()%>/img/down.png">
				</c:if>
				<c:if test="${type=='schangerate'&&sort=='asc'}">
					<input type="hidden" name="orderBy" value="desc">
					<img src="<%= request.getContextPath()%>/img/up.png">
				</c:if>
				<input type="hidden" name="select" value="${field }">
			</form>
			</th>
			<th>
			<!-- 시가총액을 누르면 오름차순 내림차순이 번갈아가면서 나타난다 -->
			<form action="rank.do" method="post" name="totalForm">
				<a href="javascript:totalForm.submit();">시가총액</a>
				<input type="hidden" name="column" value="stotal">
				<c:if test="${type=='stotal'&&sort=='desc'}">
					<input type="hidden" name="orderBy" value="asc">
					<img src="<%= request.getContextPath()%>/img/down.png">
				</c:if>
				<c:if test="${type=='stotal'&&sort=='asc'}">
					<input type="hidden" name="orderBy" value="desc">
					<img src="<%= request.getContextPath()%>/img/up.png">
				</c:if>
				<input type="hidden" name="select" value="${field }">
			</form>
			</th>
			<th>현재가</th>
			<th>전일비</th>
			<th>거래량</th>
			<th>거래대금</th>
			<th>52주고가</th>
			<th>가상투자</th>
			<th>관심주식</th>
		</tr>
		
		<!-- 검색된 회사정보를 전부 출력한다 -->
		<c:set var="rank" value="0"/>
		<c:forEach var="stock" items="${stockList}" varStatus="status">
	        <tr>
				<td>${rank=rank+1}</td>
				<td>${stock.field}</td>
				<td>${stock.name}</td>
				<td>${stock.changerate}</td>
				<td>${stock.total}</td>
				<td>${stock.price}</td>
				<td>${stock.dayrate}</td>
				<td>${stock.volume}</td>
				<td>${stock.dealprice}</td>
				<td>${stock.high52}</td>
				<td>
				
				<!-- 투자하기를 누르면 해당 회사에 투자하는 로직이 실행된다 -->
				<form name="simulation_${status.index}" id="simulation_${status.index}" 
					method="post" action="simulation.do">
					<input type="hidden" name="sname" value="${stock.name}"/>
					<input type="submit" value="투자하기" style="cursor:pointer"	>
				</form>
				</td>
				<td>
				
				<!-- 로그인상태로 빈 하얀 별모양을 누르면 해당 회사가 관심주식으로 추가된다  -->
				<!-- 로그인 안한 상태에서는 로그인페이지로 가도록 alert 띄움(js로 구현) -->
				<c:if test="${stock.interest==0}">
					<form name="interestPlus_${status.index}" id="interestPlus_${status.index}"	
						method="post" action="interest.do" >
						<input type="hidden" name="interest" value="plus">
						<input type="hidden" name="sno" value="${stock.no}">
						<input type="hidden" name="select" value="${field}">
						<input type="hidden" name="column" value="${type}">
						<input type="hidden" name="orderBy" value="${sort}">
						<input type="image" class=star-img name="PlusImg_${status.index}" 
							src="<%= request.getContextPath()%>/img/star.png" style="cursor:pointer">
					</form>
				</c:if>
				
				<!-- 로그인상태로 노란 별모양을 누르면 해당 회사가 관심주식에서 삭제된다  -->
				<!-- 로그인 안한 상태에서는 로그인페이지로 가도록 alert 띄움(js로 구현) -->
				<c:if test="${stock.interest!=0}">
					<form name="interestDelete_${status.index}" id="interestDelete_${status.index}"
							method="post" action="interest.do">
						<input type="hidden" name="interest" value="delete">
						<input type="hidden" name="sno" value="${stock.no}">
						<input type="hidden" name="select" value="${field}">
						<input type="hidden" name="column" value="${type}">
						<input type="hidden" name="orderBy" value="${sort}">
						<input type="image" class="star-img" name="DeleteImg_${status.index}"
							src="<%= request.getContextPath()%>/img/star-click.png" style="cursor:pointer">
					</form>
				</c:if>
				</td>
	        </tr>
     	</c:forEach>
	</table>
</div>