<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="title">내 정보</div>
<div class="title-sub" >
	<a href="<%= request.getContextPath()%>/main.do">홈</a>
	&nbsp;|&nbsp;<a href="<%= request.getContextPath()%>/mypage.do">마이페이지</a>
	&nbsp;|&nbsp;<a href="<%= request.getContextPath()%>/myInfo.do">내 정보</a>
</div>

<div id="help" class="helpDiv">
	자산포인트란?<input type="button" id="helpClose" value="✕"/>
	<br/>예수금포인트~~~입니다.
</div>
<div class="myDiv">
	<table class="myT">
		<tr>
			<th class="infoH">아이디</th>
			<td class="infoContent">${member.id}</td>
		</tr>
		<tr>
			<th class="infoH">이름</th>
			<td class="infoContent">${member.name}</td>
		</tr>
		<tr>
			<th class="infoH">닉네임</th>
			<td class="infoContent">${member.nickname}</td>
		</tr>
		<tr>
			<th class="infoH">이메일</th>
			<td class="infoContent">${member.mail}</td>
		</tr>
		<tr>
			<th class="infoH">전화번호</th>
			<td class="infoContent">${member.phone}</td>
		</tr>
		<tr>
			<th class="infoH">예수금 포인트</th>
			<td class="infoContent">${member.deposit} p</td>
		</tr>
		<tr>
			<th class="infoH">자산 포인트<input type="button" value="?" id="helpBtn"/></th>
			<td class="infoContent">${member.asset} p</td>
			
		</tr>
	</table>
	<div class="infoBtn-wrapper">
		<div class="infoBtn" style="cursor: pointer;" onclick="location.href='<%= request.getContextPath()%>/infoUpdatePwCheck.do';">정보 수정</div>
		<div class="infoBtn" style="cursor: pointer;" onclick="location.href='<%= request.getContextPath()%>/changePw.do';">비밀번호 변경</div>
		<div class="infoBtn" style="cursor: pointer;" onclick="location.href='<%= request.getContextPath()%>/withdrawal.do';">탈퇴하기</div>
	</div>
</div>
</body>
</html>