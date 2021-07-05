<%@page import="com.funding.sprout.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
.wrapper{
	margin:30px;
    padding-left:400px;
}

#like{
	width : 50px;
	height : 50px;
}

#unlike{
	width : 50px;
	height : 50px;
}

.content {
	width: 1140px;
}

.board{
	width:800px;
	margin:0 auto;
	border: 1px solid black;
}
.board-title, .board-content{
	width:100%;
	position:relative;
	overflow:hidden;
	border-bottom: 1px solid black;
}
.board-title-left {
	float:left;
	width:50%;
}

.board-title-right {
	float:left;
	width:50%;
 	text-align: right;
	position:absolute;
	bottom: 20px;
	right: 30px;
}
.board-content{
	clear:both;
}

.comment-writebutton{
	float:right;
}

.comment-table{
    width: 760px;
    overflow: hidden;
}
.comment-id{
    overflow: hidden;
    font-size: 14px;
}
.comment-date {
    width: 150px;
    font-size: 14px;
}
.comment-button {
    width: 170px;
    font-size: 14px;
}

button{
    text-align: right;
    font-size: 14px;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="wrapper">
	<%
		User user = (User) session.getAttribute("user");
	%>
		<div class="content">

			<div class="title">
				<h1>자유게시판</h1>
			</div>


			<div class="board">
				<div class="board-title">
					<div class="board-title-left">
						<div id="title">
							<h2>${data.boardTitle }</h2>
						</div>
						<div id="boardId">${data.boardId }</div>
						<div id="cmtcount">
							<div id="date">${data.boardDate }</div>
							<div id="boardcnt">${data.boardCnt }</div>

						</div>
					</div>

					<div class="board-title-right buttons">
						<form id="frmUpdate">
							<input type="hidden" name="boardNo" value="${data.boardNo }">
							<input type="hidden" name="userId" value="<%=user.getUserId()%>">

							<input type="button" value="신고" id="declaration"> 
							<input type="button" value="수정" id="modify"> 
							<input type="button" value="삭제" id="delete">
						</form>
					</div>
				</div>


				<div class="board-content">
					<div id="content1">
						<h3>글 내용</h3>
					</div>
					<div id="content2">${data.boardContent }</div>
					<div class="board-content-like"></div>
				</div>

				<br><hr><br>

				<div>
					<div class="comment-box">
						<textarea id="comment-write" name="cmtContent" placeholder="댓글 입력창" rows="3" cols="90" ></textarea>
					</div>

					<div class="comment-writebutton">
						<button id="comment-writebtn">등록</button>
					</div>

					<br>
					<br>

					<div>댓글 목록</div>

					<div id="comment-list">
						<!-- 첫 진입하면 EL tag 사용 ${commentList} 뿌려주기 -->
						<!-- 추가 댓글 작성시 ajax 를 통해서 이부분 empty(싹 지우고) 다시 뿌려주기 -->
						<c:forEach items="${commentList}" var="item"> 
							 <div class = "comment-table">
						        <table >
						            <tr>
						                <td class="comment-id">
						                    <div class="cmtWriteId">${item.id}</div>
						                </td>
						                <td class="comment-date">
						                    ${item.cmtDate}
						                </td>
						                <td class="comment-button">
						                    <div>
						                        <button type="button" class="btn btn-outline-primary btn-sm comment-addBtn" id="comment-addBtn">대댓글</button>
						                        <button type="button" class="btn btn-outline-primary btn-sm comment-modifyBtn" id="comment-modifyBtn">수정</button>
						                        <button type="button" class="btn btn-outline-primary btn-sm comment-deleteBtn" id="comment-deleteBtn">삭제</button>
						                        <input type = "hidden" class="cmtNo" value="${item.cmtNo}">
						                    </div>
						                </td>
						            </tr>
						            <tr>
						                <td colspan="3" width="800px" class="comment-content">
						                    ${item.cmtContent}
						                </td>
						            </tr>
						        </table>
						    </div>
						</c:forEach>
						
					</div>
				</div>


				<br><hr><br>
				
				<div class="page">
					<c:url var="boardList" value="boardList">
						<c:param name="page" value="${currentPage}" />
					</c:url>
					<a href="${boardList}">목록</a>
				</div>
			</div>
		</div>
	<script>
	$(function(){ 
		// 로드 되면 좋아요 버튼 나타내기
		let isLiked = '${isliked}';  // 1:좋아요, 0:아님
		var cnt =  '${likedCnt}';
		var tagHtml = '';
		
		if(isLiked == 1){// 1:좋아요, 0:아님
			tagHtml = '<a><img src = "../resources/img/fullheart.png" id="unlike"><br><span class = "like_cnt">${likecnt }</span></a>';
		} else {// 0:아님
			tagHtml = '<a><img src = "../resources/img/emptyheart.png" id="like"><br><span class = "like_cnt">${likecnt }</span></a>';
		}
		$(".board-content-like").append(tagHtml);

		// 좋아요 아이디 체크
		function checkId() {
			var sessionUserId = '${sessionScope.user.userId}';
			var boardId = '${data.boardId}';

			if (sessionUserId == 'null' || sessionUserId == '') {
				alert("로그인 후 추천 가능합니다")
				return true;
			}

			if (sessionUserId == boardId) {
				alert("본인 글에는 추천이 안됩니다.");
				return true;
			} else {
				return false;
			}
		}
		
		// 게시글 수정
		$("#modify").on("click", function() {	
			// 수정 아이디 체크
			var modify1 = confirm("수정하시겠습니까?");
			var sessionUserId = '${sessionScope.user.userId}';
			var boardId = '${data.boardId}';
							
			if(modify1){ // 확인누르면
			if (sessionUserId == 'null' || sessionUserId == '') {
				alert("로그인 후 수정 가능합니다.");
				return false;
			}
			if (boardId == 'null' || boardId == '') {
				alert("작성자가 아니므로 글 수정이 되지 않습니다.");
				return false;
			}
			if (boardId != sessionUserId) {
				alert("작성자가 아니므로 글 수정이 되지 않습니다.");
				return false;
			} 
			var frm = document.getElementById("frmUpdate");
			frm.action = "bRewrite";
			frm.method = "post";
			frm.submit();
				}else { // 취소누르면
				return false;
			}
		});

		// 게시글 삭제
		$("#delete").on("click", function() {		
			// 삭제 아이디 체크
			var delete1 = confirm("삭제하시겠습니까?");
			var sessionUserId = '${sessionScope.user.userId}';
			var boardId = '${data.boardId}';
						
			if(delete1){ // 확인누르면 
			if (sessionUserId == 'null' || sessionUserId == '') {
				alert("로그인 후 삭제 가능합니다")
				return false;
			}
			if (boardId == 'null' || boardId == '') {
				alert("작성자가 아니므로 글 삭제가 되지 않습니다")
				return false;
			}
			if (boardId != sessionUserId) {
				alert("작성자가 아니므로 글 삭제가 되지 않습니다")
				return false;	
			}
				var frm = document.getElementById("frmUpdate");
				frm.action = "boardDelete";
				frm.method = "post";
				frm.submit();
			}else { // 취소누르면
				return false;
			}
		});

		
		// 통합 -  좋아요 / 해제
		$(".board-content-like").click(function() {
			if (checkId() == false) {
				$.ajax({
					url : "clickLike",
					type : "POST",
					data : {
						boardNo : '${data.boardNo }',
						boardId : '<%=user.getUserId()%>'
					},
					success : function(cnt) {
						$(".board-content-like").empty(); // 기존 image 지우기
						
						var tagHtml = '';
						
						if(isLiked == 0){
							isLiked = 1;  // 좋아요 상태로 바꾸기
							tagHtml = '<a><img src = "../resources/img/fullheart.png" id="unlike"><br><span class = "like_cnt">'+cnt+'</span></a>';
						} else {
							isLiked = 0; // 해제 상태로 바꾸기
							tagHtml = '<a><img src = "../resources/img/emptyheart.png" id="like"><br><span class = "like_cnt">'+cnt+'</span></a>';
						}
						$(".board-content-like").append(tagHtml);
					},
					error:function(e){
						alert(e);
					}
				});
			}
		});
	
	
		 
		function displayCommentList(result){
			var commentHtml = "";
			$.each(result, function(i, item) {
				commentHtml += '<div class = "comment-table">';
				commentHtml += '<table >';
				commentHtml += '<tr>';
				commentHtml += '<td class="comment-id">';
				commentHtml += '<div class="cmtWriteId">';
				commentHtml += item.id;
				commentHtml += '</div>'
				commentHtml += '</td>';
				commentHtml += '<td class="comment-date">';
				commentHtml += item.cmtDate;
				commentHtml += '</td>';
				commentHtml += '<td class="comment-button">';
				commentHtml += '<div>';
				commentHtml += '<button type="button" class="btn btn-outline-primary btn-sm comment-addBtn" id="comment-addBtn">대댓글</button> ';
				commentHtml += '<button type="button" class="btn btn-outline-primary btn-sm comment-modifyBtn" id="comment-modifyBtn">수정</button> ';
				commentHtml += '<button type="button" class="btn btn-outline-primary btn-sm comment-deleteBtn" id="comment-deleteBtn">삭제</button>';
				commentHtml += '<input type = "hidden" name = "cmtNo" class="cmtNo" value="'+item.cmtNo+'">';
				commentHtml += '</div>';          
				commentHtml += '</td>';
				commentHtml += '</tr>';
				commentHtml += '<tr>';
				commentHtml += '<td colspan="3" width="800px" class="comment-content">';
				commentHtml += item.cmtContent;
				commentHtml += '</td>';
				commentHtml += '</tr>';
				commentHtml += '</table>';
				commentHtml += '</div>';					
			});	
			$("#comment-list").empty();
			$("#comment-list").append(commentHtml);

			$(".comment-deleteBtn").click(function() { // 댓글 삭제
				var delete2 = confirm("댓글 삭제하시겠습니까?");
			
				var sessionUserId = '${sessionScope.user.userId}'; // 현재 로그인한 아이디
				var cmtWriteIdDiv = $(this).parents("tr").find(".cmtWriteId");
				var Id = cmtWriteIdDiv.text(); // 댓글 쓴 사람 아이디
				var cmtNo = $(this).next().val();
				if(delete2){ // 확인누르면
					if (sessionUserId == 'null' || sessionUserId == '' || sessionUserId != Id) {
						alert("다른사람이 쓴 댓글은 삭제할 수 없습니다.");
						return false;
					}
					$.ajax({
						url : "comdelete",
						type : "POST",
						data : {
							cmtNo : cmtNo,
							boardNo : '${data.boardNo }'
						},
						dataType : "JSON",
						success : displayCommentList,
						error : function(e){
							alert(e);
						}
					});
				}
			});
			$(".comment-modifyBtn").click(function() { // 댓글 수정
				$.ajax({
					url : "comupdate",
					type : "POST",
					data : {
					},
					dataType: "JSON",
					success : displayCommentList,
					error : function(e){
						alert(e);
					}
				});
			});
		}

		$("#comment-writebtn").click(function() { // 댓글쓰기			
			var comment = $("#comment-write").val();
			
			if(comment == '' || comment == 'null'){
				alert("댓글을 입력해주세요");
				} else {
			$.ajax({
				url : "comwrite",
				type : "POST",
				data : {
					boardNo : '${data.boardNo }',
					cmtContent : comment
				},
				
				dataType: "JSON",
				success : function(result) {
					$('textarea').val('');
					displayCommentList(result);
				},
				error : function(e) {
					alert(e);
					}
				});
			}
		});
		$(".comment-deleteBtn").click(function() { // 댓글 삭제
			var delete2 = confirm("댓글 삭제하시겠습니까?");
		
			var sessionUserId = '${sessionScope.user.userId}'; // 현재 로그인한 아이디
			var cmtWriteIdDiv = $(this).parents("tr").find(".cmtWriteId");
			var Id = cmtWriteIdDiv.text(); // 댓글 쓴 사람 아이디
			var cmtNo = $(this).next().val();
			if(delete2){ // 확인누르면
				if (sessionUserId == 'null' || sessionUserId == '' || sessionUserId != Id) {
					alert("다른사람이 쓴 댓글은 삭제할 수 없습니다.");
					return false;
				}
				$.ajax({
					url : "comdelete",
					type : "POST",
					data : {
						cmtNo : cmtNo,
						boardNo : '${data.boardNo }'
					},
					dataType : "JSON",
					success : displayCommentList,
					error : function(e){
						alert(e);
					}
				});
			}
		});
		$(".comment-modifyBtn").click(function() { // 댓글 수정
			$.ajax({
				url : "comupdate",
				type : "POST",
				data : {
				},
				dataType: "JSON",
				success : displayCommentList,
				error : function(e){
					alert(e);
				}
			});
		});

		
	
	});   // on load 되면
	</script>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>