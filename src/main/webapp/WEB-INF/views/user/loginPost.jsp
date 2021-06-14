<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		alert("아이디와 비밀번호를 확인해주세요");
		self.location="/user/login";
	</script>
      <div class="pull-right">
      <a href="<%=request.getContextPath() %>/user/login">
      <b> 로그인</b></a></div>
</body>
</html>