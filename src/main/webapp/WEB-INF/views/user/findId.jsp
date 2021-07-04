<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/css/user/findId.css?ver=1.0" rel="stylesheet" type="text/css" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="wrapper">
		<div class="outer">
		<div class="inner">
			<div class="idPwd">
			<h2>���̵�ã��</h2><br>
			<table class=table>
			<tr class="warning warnName"></tr>
			<tr>
				<td class="inputTd">
				<input type="text" id="userName" class="form inputName" placeholder="�̸�"><br><br>
				</td>
				<td></td>			
			</tr>
			<tr class="warning warnEmail"></tr>
			<tr>
				<td class="inputTd">		
				<input type="text" id="userEmail" class="form inputEmail" placeholder="�̸���"><br><br>
				</td>	
				<td></td>			
			</tr>
			<tr class="warning warnPhone"></tr>
			<tr>
				<td class="inputTd">
				<input type="text" id="phone" class="form inputPhone" placeholder="�ڵ�����ȣ">
				</td>			
				<td class="btnTd">
				<button type="button" id="chkPhoneBtn" class="btns">������ȣ�ޱ�</button><br><br>
				</td>			
			</tr>
			<tr class="warning warnChkNum"></tr>
			<tr>
				<td class="inputTd">
				<input type="text" id="chkNum" class="form chkNum" placeholder="������ȣ">
				</td>			
				<td class="btnTd">
				<button type="button" id="chkNumBtn" class="btns">������ȣȮ��</button><br><br><br>
				</td>			
			</tr>
			</table>
			</div>
			<div class="join">
			<br><button type="button" id="sendBtn">���������ϱ�</button><br><br><br>
			��й�ȣ�� ��ﳪ�� �ʴ´ٸ�? <a class="joinBtn" href="<%=request.getContextPath() %>/user/findPwd">��й�ȣã��</a><br>		
			���� ȸ���� �ƴ϶��? <a class="joinBtn" href="<%=request.getContextPath() %>/user/join">ȸ������</a>			
			</div>
			</div>
			</div>
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/user/findId.js"></script>
</body>
</html>
