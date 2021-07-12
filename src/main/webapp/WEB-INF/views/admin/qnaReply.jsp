<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resource	s/css/admin/qnaReply.css?ver=1.0" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/admin/qnaReply.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
body {
    font-family: 'NanumSquare', sans-serif !important;
}

.space {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 80px;
}

#wrapper {
	display: table;
	margin-bottom: 80px;
	position: relative;
	padding-top: 110px;
	color: #202020;
}

th {
	font-size: 15px;
}

td {
	font-size: 16px;
}

.list {
	width: 35px;
	line-height: 40px;
}

.qnaList {
	display: table-cell;
	vertical-align: middle;
	font-size: 20px;
}

.info {
	width: 900px;
	border-color: #ccc;
	border-collapse: collapse;
	border-spacing: 0;
	margin-left: auto;
	margin-right: auto;
}

.replyArea {
	display: inline-block;
	width: 900px;
}

.centerPosi {
	text-align: center;
}

.t {
	float: left;
	border-color: #ccc;
	border-collapse: collapse;
	border-spacing: 0;
}

.title {
	width: 630px;
	height: 50px;
	text-align: center;
}

.noId {
	text-align: center;
	width: 130px;
}

.qnaNo {
	border: none;
	text-align: center;
	outline: none;
	width: 20px;
}

.qnaCon {
	text-align: center;
}

.content {
	height: 250px;
}

.reply {
	font-family: NanumSquareWebFont,dotum,Sans-serif;	
	width: 733px;
	height: 148px;
	border: none;
	outline: none;
}

.con {
	width: 700px;
    margin: auto;
}

.input {
	float: left;
	margin-left: 10px;
	width: 136px;
	height: 156px;
}

.scroll {
	overflow: scroll;
	overflow-x: hidden;
	height: 148px;
	width: 750px;
}

.replyTable {
	height: auto;
    width: 900px;
	border-color: #ccc;
	border-collapse: collapse;
	border-spacing: 0;
	margin: auto;
	border: none;
}

.replyDate {
	text-align: right;
	width: 150px;
}

.back {
	float: right;
    margin-left: 703px;
    box-shadow: none;
    border-radius: 10px;
    height: 30px;
    border: 1px;
}

.cmtList {
	height: 30px;
}
</style>
<script>
	var cv = "";
	
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
	
	function back() {
		location.href="qna"
	}
	
	window.onload = function() {
		console.log("페이지 로드 함수 실행");
		var qnaNo = $("#qnaNo").val();
		console.log("qnaNo : " + qnaNo);
		$.ajax({
			url : "printCmt",
			type : "POST",
			traditional : true,
			data : {
				qnaNo : qnaNo
			},
			dataType : "JSON",
			success : qnaCmt,
			error : function(error) {
				console.log("답글 확인 에러");
			}
		})
	};
	
	
	function inputReply() { // 문의내역 답글달기
		var textValue = $("#text").val(); // textarea value 가져오기
		var qnaNo = $("#qnaNo").val(); // qnaNo 가져오기
		console.log("textValue : " + textValue);
		console.log("qnaNo : " + qnaNo);
		if (textValue == "") {
			alert("답변을 작성해주세요.");
		} else {
			$.ajax({
				url : "qnainsert",
				type : "POST",
				traditional : true,
				data : {
					tValue : textValue,
					qnaNo : qnaNo
				},
				dataType : "JSON",
				success : qnaCmt,
				error : function(error) {
					console.log("문의답글 에러");
				}
			});
		}
	}
	
	function qnaCmt(data) {
		$("#text").val(""); 
		cv = "";
		console.log("답글 출력 함수 진입");
		console.log(data);
		$.each(data, function(i, list) {
			cv += "<tr class='cmtList'>"
			cv += "<td>" + data[i].cmtContent + "</td>"
			cv += "<td class='replyDate'>" + data[i].cmtDate + "</td>"
			cv += "</tr>"
		});
		$("#cmt").append(cv);
	}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<div class="space">
		<div id="wrapper">
			<img src="resources/img/admin/list.png" class="list">&nbsp;
			<p class="qnaList">문의 답글</p>
			<button class="back" onclick="back()">목록으로</button>
		</div>
	</div> 
	    <table border="1" class="info">
	    <c:forEach var="reply" items="${qnaReply }" varStatus="status">
	        <tr>
	            <td class="noId"><input type="text" class="qnaNo" id="qnaNo" value=${reply.qnaNo } readonly></td>
	            <td class="title">${reply.qnaTitle }</td>
	            <td class="noId">${reply.qnaId }</td>
	        </tr>
	        <tr>
	        	<td class="qnaCon">내용</td>
	            <td colspan="2" class="content">
	            	<div class="con">${reply.qnaContent }</div>
	            </td>
	        </tr>
	    </c:forEach>
	    </table><br>
		<table class="replyTable" id="cmt">

		</table><br>
	<div class="centerPosi">
		<div class="replyArea">
		    <table border="1" class="t">
		        <tr>
		            <td>
		                <div class="scroll">
		                    <textarea class="reply" id="text"></textarea>
		                </div>
		            </td>
		        </tr>
		    </table>
		    <button class="input" onclick="inputReply()">입력</button> 
	    </div>
    </div>
</body>
</html>
