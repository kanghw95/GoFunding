/**
 * 
 */

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
			cv += "<td>" + data[i].suspensionStart + "</td>"
			cv += "<td>" + data[i].suspensionFin + "</td>"
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
			cv += "<td>" + data[i].suspensionStart + "</td>"
			cv += "<td>" + data[i].suspensionFin + "</td>"
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
			cv += "<td>" + data[i].suspensionStart + "</td>"
			cv += "<td>" + data[i].suspensionFin + "</td>"
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
