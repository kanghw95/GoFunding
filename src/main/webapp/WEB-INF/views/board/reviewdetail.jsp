<%@page import="com.funding.sprout.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기글 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
.list{
	width : 50px;
	height : 50px;
	margin-left: 10px;
}

.free{
	margin-left: 70px;
	margin-top: -50px;
}

.boardTitle{
	margin-left: 50px;
	margin-top: 50px;
}

.button{
	margin-left: 900px;
	margin-top: -25px;
}

#like, .like_cnt{
	width : 50px;
	height : 50px;
	margin-left: 500px;
	margin-top: 200px;
}

#unlike, .like_cnt{
	width : 50px;
	height : 50px;
	margin-left: 500px;
	margin-top: 200px;
}

.comment-box{
	margin-left: 50px;
	margin-top: 50px;
}

#comment-write, #fixcomment{
	resize: none;
}

#comment-writebtn{
	float: right;
	margin-left: 30px;
	margin-top: 10px;
}

.comment-table{
	margin-left: 50px;
	margin-top: 20px;
}

.cmtButton fix{
	float: right;
	margin-top: 100px;
}

.page{
	float: right;
	margin-left: 30px;
	margin-top: 10px;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="wrapper">
		<% User user = (User) session.getAttribute("user"); %>
		<div class="title">
			<img src="../resources/img/admin/list.png" class="list">
			<h1 class="free">후기게시판</h1>
		</div>
	<hr>
		<div class="board">
			<div class="board-title">
				<div class="board-title-left">
				  	<form id="report">
						  <input type="hidden" id="reportBoardNo" name="reportBoardNo" value="${data.boardNo}">
		                  <input type="hidden" id="reportBoardId" name="reportBoardId" value="${data.boardId}">
		                  <input type="hidden" id="reportBoardCotent" name="reportBoardCotent" value="${data.boardContent }">
		                  <input type="hidden" id="reportBoardTitle" name="reportBoardTitle" value="${data.boardTitle }">
					</form>
				</div>
			</div>
		</div>		
		
		<div class="boardTitle"> 
			<div>
				<h2>${data.boardTitle }</h2>
			</div>
			
			<div>
				${data.boardDate }
					<form id="reviewfrmUpdate" class="button">
					<input type="hidden" name="boardNo" value="${data.boardNo }">
					<input type="hidden" name="userId" value="<%=user.getUserId()%>">

					<input type="button" value="신고" id="declaration"> 
					<input type="button" value="수정" id="modify"> 
					<input type="button" value="삭제" id="delete">
				</form>	
			</div>
		
			<div>
				작성자: ${data.boardId} 조회수: ${data.boardCnt } <%-- 댓글수:${data.cmt } --%>
			</div>	
			<hr>
			<div>
				<h1>글내용</h1>						
				${data.boardContent }
			</div>
			
			<div class="board-content-like"></div><hr>
		</div>
		
		
		<div class="comment-box">댓글 목록
			<textarea id="comment-write" name="cmtContent" placeholder="댓글 입력창" rows="4" cols="150"></textarea>
			<button id="comment-writebtn">등록</button>
		</div>
		
		<div class="page">
			<c:url var="review" value="review">
				<c:param name="page" value="${currentPage}" />
			</c:url>
			<a href="${review}">목록</a>
		</div>
		
		
		<div id="comment-list">
			<c:forEach items="${commentList}" var="item"> 
				 <div class = "comment-table">
					<table>
			            <tr>
			                <td class="comment-id">
			                    <div class="cmtWriteId">${item.id}</div>
			                </td>
						                
			                <td class="comment-date">
		                    	${item.cmtDate}
			                </td>
						                
			                <td class="comment-button">
	                        	<input type="hidden" class="cmtNo" value="${item.cmtNo}">
				                    <div class="cmtButton normal">
				                        <button type="button" class="btn btn-outline-primary btn-sm comment-addBtn" id="comment-addBtn">대댓글</button>
				                        <button type="button" class="btn btn-outline-primary btn-sm comment-modifyBtn" id="comment-modifyBtn">수정</button>
				                        <button type="button" class="btn btn-outline-primary btn-sm comment-deleteBtn" id="comment-deleteBtn">삭제</button>
				                    </div>
			                </td> 
			            </tr>
						            
			            <tr>
		                	<td colspan="3" width="800px" class="comment-content">
			                	<div class="cmtTextArea normal">
			                    	${item.cmtContent}
			                    </div>
								<!-- 수정하기 눌럿을때 나오기 -->
			                    <div class="cmtTextArea fix">
	                    			<textarea id="fixcomment" rows="4" cols="150"></textarea>
                    				<button class="fix-button">수정하기</button>
	                    			<button class="fix-button-cancel">취소</button>
			                 	</div>
			            		<hr>
			                </td>
			            </tr>
			        </table>
			    </div>
			</c:forEach>
		</div>
		
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>

	<script>
	$(function(){ 
		// 로드 되면 comment의 댓글,수정,삭제 버튼 나타내기
		$(".cmtButton.normal").show();
		$(".cmtButton.fix").hide();
		$(".cmtTextArea.normal").show();
		$(".cmtTextArea.fix").hide();
		
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
			var frm = document.getElementById("reviewfrmUpdate");
			frm.action = "reviewupdate";
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
				var frm = document.getElementById("reviewfrmUpdate");
				frm.action = "reviewdelete";
				frm.method = "post";
				frm.submit();
			}else { // 취소누르면
				return false;
			}
		});

		$("#declaration").on("click", function(){
			// 신고 아이디 체크
			var delete1 = confirm("신고하시겠습니까?");
			var sessionUserId = '${sessionScope.user.userId}';
			var boardId = '${data.boardId}';
						
			if(delete1){ // 확인누르면 
			if (sessionUserId == 'null' || sessionUserId == '') {
				alert("로그인 후 신고 가능합니다")
				return false;
			} 
				var frm = document.getElementById("report");
				frm.action = "reportsend";
				frm.method = "post";
				frm.submit();
			}else{
				return false;	
			}
		});
		// 통합 -  좋아요 / 해제
		$(".board-content-like").click(function() {
			if (checkId() == false) {
				$.ajax({
					url : "reviewclickLike",
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
				commentHtml += '<table>';
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
						commentHtml += '<input type = "hidden" name="cmtNo" class="cmtNo" value="'+item.cmtNo+'">';
						commentHtml += '<div class="cmtButton normal">';
							commentHtml += '<button type="button" class="btn btn-outline-primary btn-sm comment-addBtn" id="comment-addBtn">대댓글</button> ';
							commentHtml += '<button type="button" class="btn btn-outline-primary btn-sm comment-modifyBtn" id="comment-modifyBtn">수정</button> ';
							commentHtml += '<button type="button" class="btn btn-outline-primary btn-sm comment-deleteBtn" id="comment-deleteBtn">삭제</button>';
						commentHtml += '</div>';
						commentHtml += '<div class="cmtButton fix">';
							commentHtml += '<button class="fix-button">수정하기</button> ';
							commentHtml += '<button class="fix-button-cancel">취소</button>';
						commentHtml += '</div>';
					commentHtml += '</td>';
				commentHtml += '</tr>';
				commentHtml += '<tr>';
					commentHtml += '<td colspan="3" width="800px" class="comment-content">';
						commentHtml += '<div class="cmtTextArea normal">';
							commentHtml += item.cmtContent;
						commentHtml += '</div>';
						commentHtml += '<div class="cmtTextArea fix">';
							commentHtml += '<textarea id="fixcomment" rows="4" cols="150"></textarea>';
						commentHtml += '</div>';
						commentHtml += '<hr>';
					commentHtml += '</td>';
				commentHtml += '</tr>';
				commentHtml += '</table>';
				commentHtml += '</div>';
				
			});	
			$("#comment-list").empty();
			$("#comment-list").append(commentHtml);
			
			$(".cmtButton.normal").show();
			$(".cmtButton.fix").hide();
			$(".cmtTextArea.normal").show();
			$(".cmtTextArea.fix").hide();
			
	 		$(".comment-deleteBtn").click(commentDelete);
	 		$(".comment-modifyBtn").click(commentModify);
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
		
		$(".comment-deleteBtn").click(commentDelete);
 		$(".comment-modifyBtn").click(commentModify);
 		
		let thisTrElement;
		let thisTrNextElement;
		let cmtNo = 0;
		let comment="";
		
 		function commentDelete() { // 댓글 삭제
			var delete2 = confirm("댓글 삭제하시겠습니까?");
			console.log("삭제");
			var sessionUserId = '${sessionScope.user.userId}'; // 현재 로그인한 아이디

			thisTrElement = $(this).parents("tr");
  			thisTrNextElement = $(this).parents("tr").next();
			var Id = thisTrElement.find(".cmtWriteId").text(); // 댓글 쓴 사람 아이디
  			cmtNo = thisTrElement.find(".cmtNo").val(); // 댓글 번호
			
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
		}
		
 		function commentModify() { // 댓글 수정
  			var modify2 = confirm("댓글 수정하시겠습니까?");
  				
  			var sessionUserId = '${sessionScope.user.userId}'; // 현재 로그인한 아이디
  			
  			thisTrElement = $(this).parents("tr");
  			thisTrNextElement = $(this).parents("tr").next();
  			var Id = thisTrElement.find(".cmtWriteId").text(); // 댓글 쓴 사람 아이디
  			cmtNo = thisTrElement.find(".cmtNo").val(); // 댓글 번호
  			
  			comment = $.trim(thisTrNextElement.find(".cmtTextArea.normal").text()); // 댓글 내용

	 		if(modify2){ // 확인누르면
				if (sessionUserId == 'null' || sessionUserId == '' || sessionUserId != Id) {
					alert("다른사람이 쓴 댓글은 수정할 수 없습니다.");
					return false;
				}
				if(sessionUserId == Id){
					thisTrElement.find(".cmtButton.normal").hide();
					thisTrElement.find(".cmtButton.fix").show();
					thisTrNextElement.find(".cmtTextArea.normal").hide();
					thisTrNextElement.find(".cmtTextArea.fix").show();
					thisTrNextElement.find("#fixcomment").focus().text(comment);
					
  					console.log(cmtNo);
  					console.log('${data.boardNo }');
  					console.log(comment);
  					
  			 		$(".fix-button").click(function(){
  			 			comment= thisTrNextElement.find("#fixcomment").val();
  			 			commentModifyFixed(cmtNo, comment);
  			 		});  
  			 		$(".fix-button-cancel").click(function(){
  						thisTrElement.find(".cmtButton.fix").hide();
  			 			thisTrElement.find(".cmtButton.normal").show();
  						thisTrNextElement.find(".cmtTextArea.fix").hide();
  						thisTrNextElement.find(".cmtTextArea.normal").show();
  			 		}); 
  				}
			}
		}
 		function commentModifyFixed(cmtNo, comment) {
 			//수정완료 누르면 
			$.ajax({
				url : "comupdate",
				type : "POST",
				data : {
					cmtNo : cmtNo,
					boardNo : '${data.boardNo }',
					cmtContent : comment
				},
				dataType: "JSON",
				success : displayCommentList,
				error : function(e) {
					alert(e);
				}
			});
 		}
	});   // on load 되면
	</script>
</html>