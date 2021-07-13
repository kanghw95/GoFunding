/**
 * 
 */
	var cv = "";


	
	function deleteFreeBoard() { // 자유게시판 글 삭제
		console.log("자유 게시판 글 삭제 입니다.");
		var checked = document.getElementsByName("check");
		var boardNo = document.getElementsByName("boardNo"); 
		var deleteList = new Array();
		for (var i = 0; i < checked.length; i++) {
			if (checked[i].checked == false) {
				console.log("체크된게 없습니다.")
				console.log(checked[i].checked);
			} else {
				console.log("체크된게 있습니다.");
				console.log("체크된 자유 게시판 글 번호 : " + boardNo[i].value);
				deleteList.push(boardNo[i].value);
				console.log("체크된 자유 게시판 글 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 글을 체크해주세요.");
			} else {
				alert("자유 게시판 글을 삭제하시겠습니까?");
				$.ajax({
					url : "deletefboardlist",
					type : "POST",
					traditional : true,
					data : {
						boardNo : deleteList
					},
					success : function(data) {
						console.log("success 진입");
						console.log(data);
						location.replace("freeboardlist");
					},
					error : function(error) {
						console.log("error 발생");
					}
				});
			}
			
	}
	
	function deleteReviewBoard() { // 후기 게시판 글 삭제
		console.log("후기 게시판 글 삭제 입니다.");
		var checked = document.getElementsByName("check");
		var boardNo = document.getElementsByName("boardNo");
		var deleteList = new Array();
		for (var i = 0; i < checked.length; i++) {
			if (checked[i].checked == false) {
				console.log("체크된게 없습니다.")
				console.log(checked[i].checked);
			} else {
				console.log("체크된게 있습니다.");
				console.log("체크된 후기 게시판 글 번호 : " + boardNo[i].value);
				deleteList.push(boardNo[i].value);
				console.log("체크된 후기 게시판 글 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 글을 체크해주세요.");
			} else {
				alert("후기 게시판 글을 삭제하시겠습니까?");
				$.ajax({
					url : "deleterboardlist",
					type : "POST",
					traditional : true,
					data : {
						boardNo : deleteList
					},
					success : function(data) {
						console.log("success 진입");
						console.log(data);
						location.replace("reviewboardlist");
					},
					error : function(error) {
						console.log("error 발생");
					}
				});
			}
			
	}
	
	function deleteQuestionBoard() { // 질의응답 게시판 글 삭제
		console.log("질의응답 게시판 글 삭제 입니다.");
		var checked = document.getElementsByName("check");
		var boardNo = document.getElementsByName("boardNo");
		var deleteList = new Array();
		for (var i = 0; i < checked.length; i++) {
			if (checked[i].checked == false) {
				console.log("체크된게 없습니다.")
				console.log(checked[i].checked);
			} else {
				console.log("체크된게 있습니다.");
				console.log("체크된 질의응답 게시판 글 번호 : " + boardNo[i].value);
				deleteList.push(boardNo[i].value);
				console.log("체크된 질의응답 게시판 글 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 글을 체크해주세요.");
			} else {
				alert("질의응답 게시판 글을 삭제하시겠습니까?");
				$.ajax({
					url : "deleteqboardlist",
					type : "POST",
					traditional : true,
					data : {
						boardNo : deleteList
					},
					success : function(data) {
						console.log("success 진입");
						console.log(data);
						location.replace("questionboardlist");
					},
					error : function(error) {
						console.log("error 발생");
					}
				});
			}
			
	}
	
	function deleteShareBoard() { // 정보공유 게시판 글 삭제
		console.log("정보공유 게시판 글 삭제 입니다.");
		var checked = document.getElementsByName("check");
		var boardNo = document.getElementsByName("boardNo");
		var deleteList = new Array();
		for (var i = 0; i < checked.length; i++) {
			if (checked[i].checked == false) {
				console.log("체크된게 없습니다.")
				console.log(checked[i].checked);
			} else {
				console.log("체크된게 있습니다.");
				console.log("체크된 정보공유 게시판 글 번호 : " + boardNo[i].value);
				deleteList.push(boardNo[i].value);
				console.log("체크된 정보공유 게시판 글 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 글을 체크해주세요.");
			} else {
				alert("정보공유 게시판 글을 삭제하시겠습니까?");
				$.ajax({
					url : "deletesboardlist",
					type : "POST",
					traditional : true,
					data : {
						boardNo : deleteList
					},
					success : function(data) {
						console.log("success 진입");
						console.log(data);
						location.replace("shareboardlist");
					},
					error : function(error) {
						console.log("error 발생");
					}
				});
			}
			
	}
	
	function deleteEventBoard() { // 이벤트 게시판 글 삭제
		console.log("이벤트 게시판 글 삭제 입니다.");
		var checked = document.getElementsByName("check");
		var boardNo = document.getElementsByName("boardNo");
		var deleteList = new Array();
		for (var i = 0; i < checked.length; i++) {
			if (checked[i].checked == false) {
				console.log("체크된게 없습니다.")
				console.log(checked[i].checked);
			} else {
				console.log("체크된게 있습니다.");
				console.log("체크된 이벤트 게시판 글 번호 : " + boardNo[i].value);
				deleteList.push(boardNo[i].value);
				console.log("체크된 이벤트 게시판 글 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 글을 체크해주세요.");
			} else {
				alert("이벤트 게시판 글을 삭제하시겠습니까?");
				$.ajax({
					url : "deleteeboardlist",
					type : "POST",
					traditional : true,
					data : {
						boardNo : deleteList
					},
					success : function(data) {
						console.log("success 진입");
						console.log(data);
						location.replace("eventboardlist");
					},
					error : function(error) {
						console.log("error 발생");
					}
				});
			}
			
	}
	

	
	function boardRadio() { // 라디보 박스 체크 시 게시판 조회
		var name = document.getElementsByName("radio");
		for (var i = 0; i < name.length; i++) {
			if (name[i].checked == false) {
				console.log("체크된 값이 없습니다.")
			} else {
				var id = name[i].id;
				var value = name[i].value;
			}
		}
		console.log("id 값은 : " + id);
		console.log("value 값은 : " + value);
		$.ajax({
			url : "boardradio",
			type : "POST",
			traditional : true,
			data : {
				id : id,
				value : value
			},
			dataType : "JSON",
			success : selectRadio,
			error : function(error) {
				console.log("error 발생");
			}
		});
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
		var checkedBox = document
				.querySelectorAll("input[name='check']:checked");
		var checkAll = document.getElementById("checkAll");
		console.log(allBox);
		console.log(checkedBox);
		if (allBox.length == checkedBox.length) {
			checkAll.checked = true;
		} else {
			checkAll.checked = false;
		}
	}