/**
 * 
 */

function back() {
		location.href="report"
	}
	
	function userStop() {
		var stopId = document.getElementById("userStop").value;
		var title = document.getElementById("rptTitle").value;
		var no = document.getElementById("rptNo").value;
		console.log("정지시킬 아이디 : " + stopId);
		console.log("조회할 제목 : " + title);
		console.log("조회할 번호 : " + no);
		if (confirm("정말 계정을 정지하겠습니까?")) {
			$.ajax({
				url : "userStop",
				type : "POST",
				traditional : true,
				data : {
					stopId : stopId,
					title : title,
					no : no
				},
				success : function(data) {
					console.log("성공");
				},
				error : function(error) {
					console.log("에러");
				}
	 		})
		} else {
			console.log("계정 정지 취소");
		}
	}	
	
	function userPass() {
		var title = document.getElementById("rptTitle").value;
		var no = document.getElementById("rptNo").value;
		console.log("조회할 제목 : " + title);
		console.log("조회할 번호 : " + no);
		$.ajax({
			url : "userPass",
			type : "POST",
			traditional : true,
			data : {
				title : title,
				no : no
			},
			success : function(data) {
				console.log("성공");
			},
			error : function(error) {
				console.log("에러");
			}
 		})
	}