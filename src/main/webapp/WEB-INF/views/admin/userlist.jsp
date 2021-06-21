<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
table {
	text-align: center;
	width: 900px;
	margin-left: auto;
	margin-right: auto;
	border-color: #ccc;
}

#userInfo {
	text-align: center;
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

th {
	background-color: #e6e6e6;
	border-color: #ccc;
}

td {
	border-color: #ccc;
}

#list {
	width: 35px;
	line-height: 40px;
}

#space {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 80px;
}

#wrapper {
	display: table;
	margin-bottom: 80px;
}

#userManage {
	display: table-cell;
	vertical-align: middle;
	font-size: 20px;
}

#userCount {
	margin-bottom: 10px;
}

#select {
	height: 30px;
	float: left;
}

#text {
	height: 24px;
	width: 150px;
	margin-left: 5px;
	float: left;
}

#searchBtn {
	margin-left: 75px;
	box-shadow: none;
	border-radius: 10px;
}

#deleteBtn {
	margin-left: 65px;
	background-color: rgb(255, 72, 0);
	color: white;
	box-shadow: none;
	border-radius: 10px;
}

#under {
	width: 900px;
	height: 30px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
}

#paging {
	float: right;
	width: 900px;
	height: 30px;
	text-align: center;
}

ul {
	display: inline-block;
	margin: 0;
	padding: 0;
}

li {
	display: inline-block;
	list-style: none;
	float: left;
	padding: 6px;
}

#num {
	float: none;
	text-decoration: none;
	font: menu;
	padding: 2px 8px;
	background: ButtonFace;
	color: ButtonText;
	border-width: 2px;
	border-color: ButtonHighlight ButtonShadow ButtonShadow ButtonHighlight;
}

.userNo {
	border: none;
	text-align: center;
	outline: none;
	width: 30px;
}

.noBox {
	width: 30px;
}
</style>
<script>
	var cv = "";

	function searchUser() { // 사용자 검색
		console.log("검색 시작");
		var target = document.getElementById("select");
		var sValue = target.options[target.selectedIndex].value;
		var search = "%" + document.getElementById("text").value + "%";
		
		console.log("컨트롤러로 넘길 값은 : " + search);
		console.log("셀렉트 values는 " + sValue);

		if (sValue == 0) { // 선택된 option이 없는 경우
			console.log("선택 해야된다.");
			alert("검색 항목을 선택해주세요.");
		} else if (sValue == 1) { // 아이디 검색
			console.log("이메일 입니다.");
			$.ajax({
				url : "userselect",
				type : "POST",
				data : {
					userId : search
				},
				dataType : "JSON",
				success : searchId,
				error : function(error) {
					console.log("이메일 error 발생");
				}
			});
		} else if (sValue == 2) { // 이름 검색
			console.log("이름 입니다.");
			$.ajax({
				url : "userselect",
				type : "POST",
				data : {
					userName : search
				},
				dataType : "JSON",
				success : searchName,
				error : function(error) {
					console.log("이름 error 발생");
				}
			});
		} else if (sValue == 3) { // 닉네임 검색
			console.log("닉네임 입니다.");
			$.ajax({
				url : "userselect",
				type : "POST",
				data : {
					userNick : search
				},
				dataType : "JSON",
				success : searchNick,
				error : function(error) {
					console.log("이름 error 발생");
				}
			})
		}
	}
	
	function deleteUser() { // 유저 삭제
		console.log("유저 삭제 입니다.");
		var checked = document.getElementsByName("check");
		var userNo = document.getElementsByName("userNo");
		var deleteList = new Array();
		for (var i = 0; i < checked.length; i++) {
			if (checked[i].checked == false) {
				console.log("체크된게 없습니다.")
				console.log(checked[i].checked);
			} else {
				console.log("체크된게 있습니다.");
				console.log("체크된 유저 번호 : " + userNo[i].value);
				deleteList.push(userNo[i].value);
				console.log("체크된 유저 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 유저를 체크해주세요.");
			} else {
				alert("회원 정보를 삭제하시겠습니까?");
				$.ajax({
					url : "userstop",
					type : "POST",
					traditional : true,
					data : {
						userNo : deleteList
					},
					success : function(data) {
						console.log("success 진입");
						console.log(data);
						location.replace("userlist");
					},
					error : function(error) {
						console.log("error 발생");
					}
				});
			}
	}
	
	
	function searchId(data) { // 아이디 검색의 success 함수
		cv = "";
		$(".search").remove();
		var elements = document.getElementsByName("userList");
		for (var k = 0; k < elements.length; k++) {
			elements[k].style.display = "none";
		}
		console.log("searchId 함수 진입");
		console.log(data);
		$.each(data, function(i, list) {
			cv += "<tr class='search'>"
				cv += "<td><input type='text' name='userNo' class='userNo' value='"+data[i].userNo+"' readonly/></td>"
				cv += "<td><input type='checkbox' name='check' onclick='checkOne()'></td>"
			cv += "<td>" + data[i].userId + "</td>"
			cv += "<td>" + data[i].userName + "</td>"
			cv += "<td>" + data[i].userNick + "</td>"
			cv += "<td>" + data[i].userPhone + "</td>"
			cv += "<td>" + data[i].gender + "</td>"
			cv += "<td>" + data[i].userAge + "</td>"
			cv += "<td>" + data[i].point + "</td>"
			cv += "<td>" + data[i].reportCnt + "</td>"
			cv += "</tr>"
		});
		$("#tr").append(cv);
	}
	
	function searchName(data) { // 이름 검색의 success 함수
		cv = "",
		$(".search").remove();
		var elements = document.getElementsByName("userList");
		for (var k = 0; k < elements.length; k++) {
			elements[k].style.display = "none";
		}
		console.log("searchName 함수 진입");
		console.log(data);
		$.each(data, function(i, list) {
			cv += "<tr class='search'>"
				cv += "<td><input type='text' name='userNo' class='userNo' value='"+data[i].userNo+"' readonly/></td>"
				cv += "<td><input type='checkbox' name='check' onclick='checkOne()'></td>"
			cv += "<td>" + data[i].userId + "</td>"
			cv += "<td>" + data[i].userName + "</td>"
			cv += "<td>" + data[i].userNick + "</td>"
			cv += "<td>" + data[i].userPhone + "</td>"
			cv += "<td>" + data[i].gender + "</td>"
			cv += "<td>" + data[i].userAge + "</td>"
			cv += "<td>" + data[i].point + "</td>"
			cv += "<td>" + data[i].reportCnt + "</td>"
			cv += "</tr>"
		});
		$("#tr").append(cv);
	}
	
	function searchNick(data) { // 닉네임 검색의 success 함수
		cv = "",
		$(".search").remove();
		var elements = document.getElementsByName("userList");
		for (var k = 0; k < elements.length; k++) {
			elements[k].style.display = "none";
		}
		console.log("searchNick 함수 진입");
		console.log(data);
		$.each(data, function(i, list) {
			cv += "<tr class='search'>"
			cv += "<td><input type='text' name='userNo' class='userNo' value='"+data[i].userNo+"' readonly/></td>"
			cv += "<td><input type='checkbox' name='check' onclick='checkOne()'></td>"
			cv += "<td>" + data[i].userId + "</td>"
			cv += "<td>" + data[i].userName + "</td>"
			cv += "<td>" + data[i].userNick + "</td>"
			cv += "<td>" + data[i].userPhone + "</td>"
			cv += "<td>" + data[i].gender + "</td>"
			cv += "<td>" + data[i].userAge + "</td>"
			cv += "<td>" + data[i].point + "</td>"
			cv += "<td>" + data[i].reportCnt + "</td>"
			cv += "</tr>"
		});
		$("#tr").append(cv);
	}
	
	function checkAll() { // 체크박스 전체 체크, 해제
		console.log("체크박스 함수 진입");
		var checked = document.getElementsByName("check");
		var checkAll = document.getElementById("checkAll");
		if (checkAll.checked == false) {
			for (var i = 0; i < checked.length; i++) {
				checked[i].checked = false; 
				console.log("전체 선택 취소");
			}
		} else {
			for (var i = 0; i < checked.length; i++) {
				checked[i].checked = true;
				console.log("전체 선택");
			}
		}
	}
	
	function checkOne() { // 체크박스 개별 체크, 해제
		console.log("체크박스 개별 함수 진입");
		var allBox = document.querySelectorAll("input[name='check']");
		var checkedBox = document.querySelectorAll("input[name='check']:checked");
		var checkAll = document.getElementById("checkAll");
		console.log(allBox);
		console.log(checkedBox);
		if (allBox.length == checkedBox.length) {
			checkAll.checked = true;
		} else {
			checkAll.checked = false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<div id="space">
		<div id="wrapper">
			<img src="resources/img/admin/list.png" id="list">&nbsp;
			<p id="userManage">회원관리</p>
		</div>
		<c:if test="${!empty usercount }">
		<p id="userCount">사용자수 : ${usercount }</p>
		</c:if>
		<c:if test="${empty usercount }">
		<p id="userCount">사용자수 : 값이 없습니다.</p>
		</c:if>
	</div>
	<div id="userInfo">
		<table class="tg" border="1" id="tr">
			<tr>
				<th>NO</th>
				<th><input type="checkbox" id="checkAll" onclick="checkAll()"></th>
				<th>이메일</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>전화번호</th>
				<th>성별</th>
				<th>나이</th>
				<th>포인트</th>
				<th>신고누적횟수</th>
			</tr>
			<c:if test="${!empty userlist }">
				<c:forEach var="user" items="${userlist }" varStatus="status">
					<tr name="userList" id="userList" class="search">
						<td class="noBox"><input type="text" name="userNo" class="userNo" value=${user.userNo } readonly></td>
						<td><input type="checkbox" name="check" onclick='checkOne()'></td>
						<td>${user.userId }</td>
						<td>${user.userName}</td>
						<td>${user.userNick}</td>
						<td>${user.userPhone}</td>
						<td>${user.gender}</td>
						<td>${user.userAge}</td>
						<td>${user.point}</td>
						<td>${user.reportCnt}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<div id="under">
		<select id="select">
			<option value="0">--선택--</option>
			<option value="1">이메일</option>
			<option value="2">이름</option>
			<option value="3">닉네임</option>
		</select> <input type="text" id="text" name="userId">
		<div id="paging">
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a
						href="userlist${pageMaker.makeQuery(pageMaker.startPage - 1)}"><</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li><a href="userlist${pageMaker.makeQuery(idx)}" id="num">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="userlist${pageMaker.makeQuery(pageMaker.endPage + 1)}">></a></li>
				</c:if>
			</ul>
		</div>
		<br>
		<button id="searchBtn" onclick="searchUser()">검색</button>
		<button id="deleteBtn" onclick="deleteUser()">삭제</button>
	</div>

</body>
</html>