<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/admin/notice.css?ver=1.2" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/admin/notice.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>
<style>
body {
    font-family: 'NanumSquare', sans-serif !important;
}

.input {
	float: right;
    margin-left: 730px;
    box-shadow: none;
    border-radius: 10px;
    height: 30px;
    border: 1px;
}

a {
	text-decoration-line: none;
	color: black;
}

a:hover {color:#00BFFF;}
a:active {color:#00BFFF;}

.no {
	width: 40px;
}

.box {
	width: 40px;
}

.title {
	width: 500px;
}

.id {
	width: 75px;
}

.cnt {
	width: 55px;
}

.like {
	width: 55px;
}

td, th, tr {
   	border: 1px solid #ccc;
}

td {
	border: none;
	color: #757575;
   	height: 45px;
}

th {
	border: none;
	height: 45px;
}

.boardNo {
	color: #757575;
}

#space{
	display: block;
	margin-top: 0;
	height: 100px;
}
</style>
<script>
jQuery(function($) {
    $("body").css("display", "none");
    $("body").fadeIn(800);
    $("a.transition").click(function(event){
        event.preventDefault();
        linkLocation = this.href;
        $("body").fadeOut(1000, redirectPage);
    });
    function redirectPage() {
    window.location = linkLocation;
    }
});

function input() {
	location.href="noticeWrt"
}

function tag(no) {
	console.log(a);
}

function searchNotice() {
	console.log("�˻� ����");
	var target = document.getElementById("select");
	var sValue = target.options[target.selectedIndex].value;
	var search = "%" + document.getElementById("text").value + "%";
	
	console.log("��Ʈ�ѷ��� �ѱ� ���� : " + search);
	console.log("����Ʈ values�� " + sValue);

	if (search == "%%") {
		alert("검색할 정보를 입력해주세요.");
	} else {
		if (sValue == 0) { // ���õ� option�� ���� ���
			console.log("���� �ؾߵȴ�.");
			alert("�˻� �׸��� �������ּ���.");
		} else if (sValue == 1) { // ���� �˻�
			console.log("���� �Դϴ�.");
			$.ajax({
				url : "noticeselect",
				type : "POST",
				data : {
					boardTitle : search
				},
				dataType : "JSON",
				success : searchN,
				error : function(error) {
					console.log("���� �Խ��� ���� error �߻�");
				}
			});
		} else if (sValue == 2) { // �̸� �˻�
			console.log("�ۼ��� �Դϴ�.");
			$.ajax({
				url : "noticeselect",
				type : "POST",
				data : {
					boardId : search
				},
				dataType : "JSON",
				success : searchN,
				error : function(error) {
					console.log("���� �Խ��� �ۼ��� error �߻�");
				}
			});
		}
	}
}

function deleteNotice() { // �������� �� ����
	console.log("�������� �� ���� �Դϴ�.");
	var checked = document.getElementsByName("check");
	var boardNo = document.getElementsByName("boardNo"); 
	var deleteList = new Array();
	for (var i = 0; i < checked.length; i++) {
		if (checked[i].checked == false) {
			console.log("üũ�Ȱ� �����ϴ�.")
			console.log(checked[i].checked);
		} else {
			console.log("üũ�Ȱ� �ֽ��ϴ�.");
			console.log("üũ�� �������� �� ��ȣ : " + boardNo[i].value);
			deleteList.push(boardNo[i].value);
			console.log("üũ�� �������� �� ��ȣ ����Ʈ : " + deleteList);
		}
	}
		console.log("üũ�� üũ�ڽ� ���� : " + deleteList.length);
		if (deleteList.length == 0) {
			alert("�ϳ� �̻��� ���� üũ���ּ���.");
		} else {
			swal({
			    title: "공지사항 게시글 삭제",
			    text: "공지사항 게시글을 삭제하시겠습니까?",
			    icon: "warning",
			    buttons: ["아니오", "예"]
			}).then((예) => {
				if (예) {
					console.log("예");
					$.ajax({
						url : "deletenoticelist",
						type : "POST",
						traditional : true,
						data : {
							boardNo : deleteList
						},
						success : function(data) {
							console.log("success ����");
							console.log(data);
							location.replace("notice");
						},
						error : function(error) {
							console.log("error �߻�");
						}
					});
				} else {
					console.log("취소");
				}
			})
			
		}
		
}
</script>
</head>
<body>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="wrapper">
		<h2><i class="fas fa-clipboard-list"></i>&nbsp; 공지사항</h2>
		<input type="radio" name="radio" id="event" value="new" onclick="noticeRadio()">최신순
		<input type="radio" name="radio" id="event" value="cnt" onclick="noticeRadio()">조회순
		<br>
	<div id="userInfo" style="margin-top: 10px;">
		<table class="tg" border="1" id="tr">
			<tr>
				<th class="no">NO</th>
				<th class="box"><input type="checkbox" id="checkAll" onclick="checkAll()"></th>
				<th class="title">제목</th>
				<th class="id">작성자</th>
				<th class="cnt">조회</th>
				<th class="like">추천</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="notice" items="${notice }" varStatus="status">
				<tr name="boardList" id="boardList" class="search">
					<td class="noBox"><input type="text" name="boardNo" class="boardNo" value=${notice.boardNo } readonly></td>
					<td><input type="checkbox" name="check" onclick='checkOne()'></td>
					<td><a href="noticeDetail?no=${notice.boardNo }">${notice.boardTitle}</a></td>
					<td>${notice.boardId}</td>
					<td>${notice.boardCnt}</td>
					<td>0</td>
					<td>${notice.boardDate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="under" style="display: block;">
		<select id="select">
			<option value="0">--선택--</option>
			<option value="1">제목</option>
			<option value="2">작성자</option>
		</select> <input type="text" id="text" name="userId">
		<div id="paging">
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a href="notice${pageMaker.makeQuery(pageMaker.startPage - 1)}" id="num"><</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li><a href="notice${pageMaker.makeQuery(idx)}" id="num">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="notice${pageMaker.makeQuery(pageMaker.endPage + 1)}" id="num">></a></li>
				</c:if>
			</ul>
		</div>
		<br>
		<button id="searchBtn" onclick="searchNotice()">검색</button>
	</div>
</div>
<br>
<br>
<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
