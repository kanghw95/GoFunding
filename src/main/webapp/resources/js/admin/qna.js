/**
 * 
 */

	var cv = "";
	
	function searchQna() {
		console.log("검색 시작");
		var target = document.getElementById("select");
		var sValue = target.options[target.selectedIndex].value;

		console.log("셀렉트 values는 " + sValue);

		if (sValue == 0) { // 선택된 option이 없는 경우
			console.log("선택 해야된다.");
			alert("검색 항목을 선택해주세요.");
		} else if (sValue == 1) { // 제목 검색
			console.log("펀딩문의 입니다.");
			$.ajax({
				url : "qnaSelect",
				type : "POST",
				data : {
					funding : sValue
				},
				dataType : "JSON",
				success : selectQna,
				error : function(error) {
					console.log("Qna 펀딩문의 검색 error 발생");
				}
			});
		} else if (sValue == 2) { // 이름 검색
			console.log("결제문의 입니다.");
			$.ajax({
				url : "qnaSelect",
				type : "POST",
				data : { 
					payment : sValue
				},
				dataType : "JSON",
				success : selectQna,
				error : function(error) {
					console.log("Qna 결제문의 검색 error 발생");
				}
			});
		} else if (sValue == 3) {
			console.log("계정문의 입니다.");
			$.ajax({
				url : "qnaSelect",
				type : "POST",
				data : { 
					account : sValue
				},
				dataType : "JSON",
				success : selectQna,
				error : function(error) {
					console.log("Qna 계정문의 검색 error 발생");
				}
			});
		} else if (sValue == 4) {
			console.log("기타 입니다.");
			$.ajax({
				url : "qnaSelect",
				type : "POST",
				data : { 
					etc : sValue
				},
				dataType : "JSON",
				success : selectQna,
				error : function(error) {
					console.log("Qna 기타 검색 error 발생");
				}
			});
		}
	}
	
	function selectQna(data) {
		cv = "",
		$(".search").remove();
		var elements = document.getElementsByName("boardList");
		for (var k = 0; k < elements.length; k++) {
			elements[k].style.display = "none";
		}
		console.log("Qna 유형 조회 함수 진입");
		console.log(data);
		$.each(data, function(i, list) {
			cv += "<tr class='search'>"
			cv += "<td class='noBox'><input type='text' name='boardNo' class='boardNo' value='"+data[i].qnaNo+"' readonly></td>"
			cv += "<td><input type='checkbox' name='check' onclick='checkOne()'></td>"
			cv += "<td>" + data[i].qnaType + "</td>"
			cv += "<td>" + data[i].qnaTitle + "</td>"
			cv += "<td>n</td>"
			cv += "<td>" + data[i].qnaId + "</td>"
			cv += "<td>" + data[i].qnaDate + "</td>"
			cv += "<td>처리여부</td>"
			cv += "<td>" + data[i].qnaMId + "</td>"
			cv += "<td>" + data[i].qnaADate + "</td>"
			cv += "<td>" + data[i].qnaCnt + "</td>"
			cv += "</tr>"
		});
		$("#tr").append(cv);
	}
	
	function deleteQna() { // 공지사항 글 삭제
		console.log("공지사항 글 삭제 입니다.");
		var checked = document.getElementsByName("check");
		var boardNo = document.getElementsByName("boardNo"); 
		var deleteList = new Array();
		for (var i = 0; i < checked.length; i++) {
			if (checked[i].checked == false) {
				console.log("체크된게 없습니다.")
				console.log(checked[i].checked);
			} else {
				console.log("체크된게 있습니다.");
				console.log("체크된 Qna 글 번호 : " + boardNo[i].value);
				deleteList.push(boardNo[i].value);
				console.log("체크된 Qna 글 번호 리스트 : " + deleteList);
			}
		}
			console.log("체크된 체크박스 갯수 : " + deleteList.length);
			if (deleteList.length == 0) {
				alert("하나 이상의 글을 체크해주세요.");
			} else {
				alert("Qna 글을 삭제하시겠습니까?");
				$.ajax({
					url : "deleteQna",
					type : "POST",
					traditional : true,
					data : {
						qnaNo : deleteList
					},
					success : function(data) {
						console.log("success 진입");
						console.log(data);
						location.replace("qna");
					},
					error : function(error) {
						console.log("error 발생");
					}
				});
			}
			
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