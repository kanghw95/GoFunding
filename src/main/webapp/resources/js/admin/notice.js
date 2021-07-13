/**
 * 
 */

var cv = "";
	
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
	
	function searchN(data) {
		cv = "",
		$(".search").remove();
		var elements = document.getElementsByName("boardList");
		for (var k = 0; k < elements.length; k++) {
			elements[k].style.display = "none";
		}
		console.log("�Խ��� �˻� �Լ� ����");
		console.log(data);
		$.each(data, function(i, list) {
			cv += "<tr class='search'>"
			cv += "<td><input type='text' name='boardNo' class='boardNo' value='"+data[i].boardNo+"' readonly/></td>"
			cv += "<td><input type='checkbox' name='check' onclick='checkOne()'></td>"
			cv += "<td>" + data[i].boardTitle + "</td>"
			cv += "<td>" + data[i].boardId + "</td>"
			cv += "<td>" + data[i].boardCnt + "</td>"
			cv += "<td>0</td>"
			cv += "<td>" + data[i].boardDate + "</td>"
			cv += "</tr>"
		});
		$("#tr").append(cv);
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
				alert("�������� ���� �����Ͻðڽ��ϱ�?");
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
			}
			
	}

	function noticeRadio() { // �������� �����ڽ� ��ȸ
		var name = document.getElementsByName("radio");
		for (var i = 0; i < name.length; i++) {
			if (name[i].checked == false) {
				console.log("üũ�� ���� �����ϴ�.")
			} else {
				var id = name[i].id;
				var value = name[i].value;
			}
		}
		console.log("id ���� : " + id);
		console.log("value ���� : " + value);
		$.ajax({
			url : "noticeradio",
			type : "POST",
			traditional : true,
			data : {
				id : id,
				value : value
			},
			dataType : "JSON",
			success : selectRadio,
			error : function(error) {
				console.log("error �߻�");
			}
		});
	}
	
	function selectRadio(data) {
		cv = "",
		$(".search").remove();
		var elements = document.getElementsByName("boardList");
		for (var k = 0; k < elements.length; k++) {
			elements[k].style.display = "none";
		}
		console.log("�Խ��� �˻� �Լ� ����");
		console.log(data);
		$.each(data, function(i, list) {
			cv += "<tr class='search'>"
			cv += "<td><input type='text' name='boardNo' class='boardNo' value='"+data[i].boardNo+"' readonly/></td>"
			cv += "<td><input type='checkbox' name='check' onclick='checkOne()'></td>"
			cv += "<td>" + data[i].boardTitle + "</td>"
			cv += "<td>" + data[i].boardId + "</td>"
			cv += "<td>" + data[i].boardCnt + "</td>"
			cv += "<td>0</td>"
			cv += "<td>" + data[i].boardDate + "</td>"
			cv += "</tr>"
		});
		$("#tr").append(cv);
	}
	
	function checkAll() { // üũ�ڽ� ��ü üũ, ����
		console.log("üũ�ڽ� �Լ� ����");
		var checked = document.getElementsByName("check");
		var checkAll = document.getElementById("checkAll");
		if (checkAll.checked == false) {
			for (var i = 0; i < checked.length; i++) {
				checked[i].checked = false;
				console.log("��ü ���� ���");
			}
		} else {
			for (var i = 0; i < checked.length; i++) {
				checked[i].checked = true;
				console.log("��ü ����");
			}
		}
	}

	function checkOne() { // üũ�ڽ� ���� üũ, ����
		console.log("üũ�ڽ� ���� �Լ� ����");
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
