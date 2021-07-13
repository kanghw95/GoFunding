<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
		<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/demos/style.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css">
		<link href="<%=request.getContextPath() %>/resources/css/user/applicationForm.css?ver=1.0" rel="stylesheet" type="text/css" />
		<title>Insert title here</title>
	</head>
	<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="wrapper">
		<div class="outer">
		<div class="inner">
		<i class="far fa-plus-square fa-2x"></i>&nbsp;내 펀딩 개설하기
		<div class="standardsDiv">
		<button type="button" id="standards">개설 기준 보기</button><br><br>
		</div>
		<div class="wrap wrap2">
			<div id="standardDetail" class="modal">
			<div id="closeStandardDiv" class="close closeStandard"><button type="button" class="modalBtn">X</button></div>
				1. 목적<br><br>
				공공의 가치를 훼손하지 않는 프로젝트이어야 합니다.<br>
				제품/문화컨텐츠/공익나눔 중 하나 이상의 카테고리에 부합해야 합니다.<br>
				2. 내용<br><br>
				출판 프로젝트의 경우 원고 작성이 완료된 상태에서 출판일정이 확정되어야 프로젝트 오픈이 가능합니다.<br>
				제품 프로젝트의 경우 시제품이 있어야 하며, 서포터가 어떤 제품인지 인지할 수 있는 형태의 이미지를 공개해야 합니다.<br>
				웹사이트 또는 어플리케이션 제작이 필요한 프로젝트는 최소 프로토타입 형태의 개발이 완료된 상태에서만 진행이 가능합니다.<br><br>
				3. 집행 및 리워드<br><br>
				프로젝트 메이커는 서포터에게 반드시 펀딩 금액에 합당한 보상품(리워드)을 제공해야 합니다.<br>
				단순히 브랜드, 상품, 행사 정보 등이 나열된 형태인 경우 등록을 제한합니다.<br>
				보상품(리워드)의 종류에 따라 추가서류를 요청할 수 있으며, 요청한 자료가 증빙되지 않을 경우 오픈이 불가할 수 있습니다.<br>
			</div>
		</div>
		
		<div id="notice">
			<pre>SPROUT! 새싹나눔에서는 우리 사회의 공익을 증진시키려는 목적의 펀딩만을 개설할 수 있습니다.
개설 신청서를 제출한 이후에는 수정할 수 없으니 신청하기를 클릭하기 전, 다시 한번 더 확인해 주시길 바랍니다.
신청서가 접수된 이후, <a class="noticeColor">새싹나눔의 기준에 따라</a> 개설 적합성을 심사하게 됩니다.
<a class="noticeColor">신청 이후 15일 이내에 개설 여부가 결정됩니다.</a></pre>
		</div><br>
		<div>
			<form id="frm">
				<table class="table">
					<tr class="basicInfo">
						<td class="line1">주체명 (필수)</td>
						<td class="line2"><input type="text" name="maker" id="maker" class="inputText" placeholder="내용을 입력해주세요." required>
						&nbsp;<button type="button" id="nameChk">중복체크</button><div id="warning"></div>
								<div><input type="text" id="chkInform" class="inputText" readonly></div>
								<input type="hidden" name="id"value="${user.userId}"></td>
					</tr>
					<tr class="basicInfo">
						<td class="line1">소개 (필수)</td>
						<td class="line2"><textarea name="description" id="description" class="textArea" placeholder="내용을 입력해주세요." cols="100"
								rows="6" required></textarea></td>
					</tr>
					<tr class="basicInfo">
						<td class="line1">담당자 (필수)</td>
						<td class="line2"><input type="text" name="makerName" id="name" class="inputText" placeholder="내용을 입력해주세요." required></td>
					</tr>
					<tr class="basicInfo">
						<td class="line1">연락처 (필수)</td>
						<td class="line2"><input type="tel" name="makerTel" id="makerTel" class="inputText" placeholder="내용을 입력해주세요." onblur="phoneCheck()" required>
						<div id="phoneCheck"></div></td>
					</tr>
					<tr class="basicInfo">
						<td class="line1">이메일</td>
						<td class="line2"><input type="text" name="makerEmail" class="inputText" id="makerEmail" onblur="emailCheck()" > @
							<select id="email" name="domain">
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="">직접입력</option>
							</select>
							&nbsp;<input type="text" id="direct" class="inputText" name="domain">
							<div id="emailCheck"></div>
						</td>
					</tr>
						<tr class="basicInfo">
							<td class="line1">참고 정보 (필수)</td>
							<td class="line2">
								주체 혹은 펀딩에 관련된 기사 등 자료 링크를 입력해 주세요.<br>
								<input type="text" id="makerInfo" class="inputText" name="makerInfo" placeholder="내용을 입력해주세요." required>
								<button type="button" id="addInput">추가하기</button>
								<button type="button" id="closeInfoBtn">삭제</button>
							</td>
						</tr>
					<tbody id="tbody1">
					</tbody>
				</table><br>
				<div class="btnDiv"><button type="button" id="addInfo">세부사항 작성하러 가기</button><br><br></div>
				<div id="infoDetail" style="display: none;">
					<div>
						<table class="projTabs">
							<tr class="projInfo">
								<td class="line3">
									1. 펀딩 주제<br>
									<textarea name="fundingTitle" id="fundingTitle" class="textArea" placeholder="내용을 입력해주세요." cols="30"
										rows="5" required></textarea>
								</td>
								<td class="line4">
									2. 펀딩 분류<br>
									<select name="fundingCategory" id="fundingCategory" class="inputText">
										<option value="일자리 창출">일자리 창출</option>
										<option value="공정 무역">공정 무역</option>
										<option value="친환경">친환경</option>
										<option value="기부">기부</option>
										<option value="작은 가게">작은 가게</option>
										<option value="미디어">미디어</option>
										<option value="창작자">창작자</option>
									</select>
								</td>
							</tr>
							<tr class="projInfo">
								<td class="line3">
									3. 펀딩 프로젝트 소개<br>
									<textarea name="fundingContent" id="fundingContent" class="textArea" placeholder="내용을 입력해주세요."
										cols="30" rows="5" required></textarea>
								</td>
								<td class="line4">
									4. 펀딩 목표 금액<br>
									<input type="text" id="fundingPrice" name="fundingPrice" class="inputText" pattern="[1-9][0-9]{0,10}" required>&nbsp;원
								</td>
							</tr>
							<tr class="projInfo">
								<td class="line3">
									5. 펀딩 시작일<br>
									<input type="text" id="fundingStart" name="start" class="datepick inputText" placeholder="일자를 선택해주세요." required><br><br>
									6. 펀딩 종료일<br>
									<input type="text" id="fundingFin" name="end" class="datepick inputText"  placeholder="일자를 선택해주세요." required>
								</td>
								<td class="line4">
									7. 펀딩 후원금 사용 계획<br>
									<textarea name="fundingPlan" id="fundingPlan" class="textArea" placeholder="내용을 입력해주세요." cols="30"
										rows="5" required></textarea>
								</td>
							</tr>
						</table>
					</div>
					<div>
						<table class="projTabs">
							<tr class="projInfo">
								<td class="line3">8. 리워드 소개<br>
									<textarea name="rewardDesc" id="rewardDesc" class="textArea" cols="30" rows="5" 
										placeholder="내용을 입력해주세요." required></textarea>
								</td><td class="line4"></td>
							</tr>
								<tr class="projInfo">
									<td class="line3">9. 리워드 구성<br>
									<input type="text" id="rewardPrice" name="rewardPrice" class="inputReward" placeholder="금액" pattern="[1-9][0-9]{0,10}" required>&nbsp;원
										달성 시&nbsp;
										<input type="text" id="rewardTitle" name="rewardTitle" class="inputReward"
											placeholder="리워드 종류" required>&nbsp;</td><td class="line4">
										<br>최대&nbsp;<input type="text" name="rewardEA" class="inputReward" id="rewardEA" placeholder="개수" pattern="[1-9][0-9]{0,10}" required>개
										<button type="button" id="addReward">리워드 추가</button>
										<button type="button" class="closeRewardBtn">삭제</button>
									</td>
								</tr>
							<tbody id="tbody2">
							</tbody>
								<tr class="projInfo">
									<td class="line3">
										10. 배송일자<br>
										<input type="text" id="deliveryDate" name="delivery" class="datepick inputText" placeholder="일자를 선택해주세요." required>
									</td>
									<td class="line4">
										11. 배송비<br>
										<input type="text" id="deliveryCharge" name="deliveryCharge" class="inputText" placeholder="배송비" pattern="[0-9][0-9]{0,10}" required>원
									</td>
								</tr>
						</table>
						<input type="checkbox" id="privacyChk">개인정보 수집 및 이용에 동의&nbsp;&nbsp;&nbsp;
						<button type="button" id="openPrivacy">자세히 보기</button>
						<div class="wrap wrap1">
							<div id="privacyDetail" class="modal">
							<div id="closePrivacyDiv" class="close closePrivacy"><button type="button" class="modalBtn">X</button></div>
								<div id="detailTitle">
									개인정보 수집•이용 동의서
								</div><br>
								<div id=detailContent>
									- 이용자가 제공한 모든 정보는 다음의 목적을 위해 활용하며, 하기 목적 이외의 용도로는 사용되지 않습니다.<br><br>
									① 개인정보 수집 항목 및 수집·이용 목적<br><br>
									가) 수집 항목 (필수항목)<br><br>
									- 주체명, 연락처, 이메일, 업체정보,<br>
									신청서에 기재된 펀딩 관련 정보 또는 신청자가 제공한 정보<br><br>
									나) 수집 및 이용 목적<br><br>
									- 새싹나눔 펀딩 진행<br>
									- 새싹나눔 펀딩 메이커 연락 및 자격확인<br>
									- 새싹나눔 펀딩 메이커 자원관리<br><br>
									② 개인정보 보유 및 이용기간<br><br>
									- 수집·이용 동의일로부터 개인정보의 수집·이용목적을 달성할 때까지
								</div>
							</div>
						</div>
						<br><br><br>
						<div class="submitBtn">
						<button type="submit" id="submitBtn" disabled="disabled">프로젝트 개설 신청하기</button>
					</div>
					</div>
				</div>
			</form>
		</div>
		</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/user/applicationForm.js"></script>
	</body>
	</html>
