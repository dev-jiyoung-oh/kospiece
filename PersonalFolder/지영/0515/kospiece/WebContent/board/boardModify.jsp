<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="" id="1">
		<div class="" id="1-1">
			자유게시판
		</div>
		<div class="" id="1-2">
			게시글수정
		</div>
		<form action="<%=request.getContextPath() %>/board/modify.do?fno=${param.fno}" method="post">
		<div class="" id="1-3">
			말머리
			<select name="horsehead" value="${board.horsehead }">
			    <option value="일반">선택</option>
			    <option value="일반">일반</option>
			    <option value="유머">유머</option>
			    <option value="정보">정보</option>
			</select><br>
			제목 <input type="text" name="title" value="${board.title}"/><br>
			상세내용 <textarea name="content" rows="5" cols="30">${board.content}</textarea>
		</div>
		<div class="" id="1-4">
			<input type="submit" value="등록"/>
			<input type="reset" value="취소"/>
		</div>
		</form>
</body>
</html>