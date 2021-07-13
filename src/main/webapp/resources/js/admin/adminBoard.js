/**
 * 
 */
	var cv = "";


	
	
	

	
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