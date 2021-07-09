/**
 * 
 */

var cv = "";

	function detail(title, no) {
		var title = title;
		var no = no;
		if (title == "") {
			console.log("댓글이네요.");
		} else {
			console.log("게시글이네요.");
		}
		var rptTitle = document.getElementById("rptTitle");
		var rptNo = document.getElementById("rptNo");
		rptTitle.value = title;
		rptNo.value = no;
		reportForm.submit();
	}
	
	function searchReport() {
		console.log("검색 시작");
		var target = document.getElementById("select");
		var sValue = target.options[target.selectedIndex].value;
		
		console.log("셀렉트 values는 " + sValue);
		if (sValue == 0) {
			console.log("선택 해야돼");
			alert("검색 항목을 선택해주세요.");
		} else {
			$.ajax({
				url : "reportSelect",
				type : "POST",
				traditional : true,
				data : {
					account : sValue
				},
				dataType : "JSON",
				success : searchSelect,
				error : function(data) {
					console.log("에러");
				}
			});
		}
	}
	
	function searchSelect(data) {
		cv = "";
		$(".search").remove();
		var elements = document.getElementsByName("boardList");
		for (var k = 0; k < elements.length; k++) {
			elements[k].style.display = "none";
		}
		console.log("report 검색 함수 진입");
		console.log(data);
		$.each(data, function(i, list) {
			cv += "<tr class='search'>"
			cv += "<td>" + data[i].reportNo + "</td>"
			cv += "<td><input type='checkbox' name='check' onclick='checkOne()'></td>"
			if (data[i].reportTitle == "") {
				cv += "<td>"
				cv += "<span>댓글</span>"
				cv += "</td>"
			} else {
				cv += "<td>"
				cv += "<span>게시글</span>"
				cv += "</td>"
			}
			cv += "<td>" + data[i].reportType + "</td>"
			cv += "<td>" + data[i].reportId + "</td>"
			cv += "<td>" + data[i].reportWr + "</td>"
			if (data[i].reportState == "N") {
				cv += "<td>"
				cv += "<span class='wait'>처리 대기</span><br>"
				cv += "<input type='button' class='deal' value='상세보기' id=" + data[i].reportTitle + "name=" + data[i].reportNo + " onclick='detail(this.id, this.name)'>"
				cv += "</td>"
			} else {
				cv += "<td>"
				cv += "<span class='commit'>처리 완료</span><br>"
				cv += "<input type='button' class='deal' value='확인하기' id=" + data[i].reportTitle + "name=" + data[i].reportNo + " onclick='detail(this.id, this.name)'>"
				cv += "</td>"
			}
			cv += "</tr>"
		});
		$("#tr").append(cv);
	}
	
	function checkAll() { // 체크박스 전체 체크, 해제
		console.log("체크박스 함수 진입");
		var checked = document.getElementsByName("check");
		var check = document.getElementById("check");
		if (check.checked == false) {
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
		var check = document.getElementById("check");
		console.log(allBox);
		console.log(checkedBox);
		if (allBox.length == checkedBox.length) {
			check.checked = true;
		} else {
			check.checked = false;
		}
	}