<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<link href="<%=request.getContextPath() %>/resources/css/user/applicationForm.css?ver=1.0" rel="stylesheet" type="text/css" />
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	</head>
	<body>
		내 펀딩 개설하기<br>
		<button type="button" id="standards">개설 기준 보기</button>
		<br>
		<div class="wrap wrap2">
			<div id="closeStandardDiv" class="close closeStandard"><button type="button">X</button></div>
			<div id="standardDetail" class="modal">
				1. 목적<br>
				공공의 가치를 훼손하지 않는 프로젝트이어야 합니다.<br>
				제품/문화컨텐츠/공익나눔 중 하나 이상의 카테고리에 부합해야 합니다.<br>
				실제 구현이 가능한 프로젝트여야 합니다.<br>
				2. 내용<br>
				공연, 행사 프로젝트를 진행할 경우 공연, 행사에 대한 정확한 정보 (장소, 공연자)를 밝혀야 합니다.<br>
				출판 프로젝트의 경우 원고 작성이 완료된 상태에서 출판일정이 확정되어야 프로젝트 오픈이 가능합니다.<br>
				제품 프로젝트의 경우 시제품이 있어야 하며, 서포터가 어떤 제품인지 인지할 수 있는 형태의 이미지를 공개해야 합니다.<br>
				웹사이트 또는 어플리케이션 제작이 필요한 프로젝트는 최소 프로토타입 형태의 개발이 완료된 상태에서만 진행이 가능합니다.<br>
				3. 집행 및 리워드<br>
				프로젝트 메이커는 서포터에게 반드시 펀딩 금액에 합당한 보상품(리워드)을 제공해야 합니다.<br>
				단순히 브랜드, 상품, 행사 정보 등이 나열된 형태인 경우 등록을 제한합니다.<br>
				보상품(리워드)의 종류에 따라 추가서류를 요청할 수 있으며, 요청한 자료가 증빙되지 않을 경우 오픈이 불가할 수 있습니다.<br>
				보상품(리워드)은 프로젝트 종료일 기준 3개월 이내에 제공되어야 합니다.<br>
			</div>
		</div>
		<div>
			SPROUT! 새싹나눔에서는 우리 사회의 공익을 증진시키려는 목적의 펀딩만을 개설할 수 있습니다.
			개설 신청서를 제출한 이후에는 수정할 수 없으니 신청하기를 클릭하기 전, 다시 한번 더 확인해 주시길 바랍니다.
			신청서가 접수된 이후, 새싹나눔의 기준에 따라 개설 적합성을 심사하게 됩니다.
			신청 이후 15일 이내에 개설 여부가 결정됩니다.
		</div><br>
		<div>
			<form id="frm">
				<table>
					<tr>
						<td>주체명 (필수)</td>
						<td><input type="text" name="maker" id="maker" placeholder="내용을 입력해주세요." required><button type="button"
								id="nameChk">중복체크</button><div id="warning"></div>
								<div><input type="text" id="chkInform"></div></td>
					</tr>
					<tr>
						<td>소개 (필수)</td>
						<td><textarea name="description" id="description" placeholder="내용을 입력해주세요." cols="50"
								rows="5" required></textarea></td>
					</tr>
					<tr>
						<td>담당자 (필수)</td>
						<td><input type="text" name="id" id="id" placeholder="내용을 입력해주세요." required></td>
					</tr>
					<tr>
						<td>연락처 (필수)</td>
						<td><input type="tel" name="makerTel" id="makerTel" placeholder="내용을 입력해주세요." required></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="makerEmail" id="makerEmail">@
							<select id="email" name="domain">
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="">직접입력</option>
							</select>
							<input type="text" id="direct" name="domain">
						</td>
					</tr>
						<tr>
							<td>참고 정보 (필수)</td>
							<td>
								주체 혹은 펀딩에 관련된 기사 등 자료 링크를 입력해 주세요.<br>
								<input type="text" id="makerInfo" name="makerInfo" placeholder="내용을 입력해주세요." required>
								<button type="button" id="addInput">추가하기</button>
								<button type="button" id="closeInfoBtn">삭제</button>
							</td>
						</tr>
					<tbody id="tbody1">
					</tbody>
				</table><br>
				<button type="button" id="addInfo">세부사항 작성하러 가기</button><br><br>
				<div id="infoDetail" style="display: none;">
					<div>
						<table>
							<tr>
								<td>
									1. 펀딩 주제<br>
									<textarea name="fundingTitle" id="fundingTitle" placeholder="내용을 입력해주세요." cols="50"
										rows="10" required></textarea>
								</td>
								<td>
									2. 펀딩 분류<br>
									<select name="fundingCategory" id="fundingCategory">
										<option value="일자리창출">일자리창출</option>
										<option value="공정무역">공정무역</option>
										<option value="친환경">친환경</option>
										<option value="기부">기부</option>
										<option value="작은가게">작은가게</option>
										<option value="미디어">미디어</option>
										<option value="창작자">창작자</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									3. 펀딩 프로젝트 소개<br>
									<textarea name="fundingContent" id="fundingContent" placeholder="내용을 입력해주세요."
										cols="50" rows="10" required></textarea>
								</td>
								<td>
									4. 펀딩 목표 금액<br>
									<input type="text" id="fundingPrice" name="fundingPrice" pattern="[1-9][0-9]{0,10}" required>&nbsp;원
								</td>
							</tr>
							<tr>
								<td>
									5. 펀딩 시작일<br>
									<input type="text" id="fundingStart" name="start" class="datepick" placeholder="일자를 선택해주세요." required><br>
									6. 펀딩 종료일<br>
									<input type="text" id="fundingFin" name="end" class="datepick" placeholder="일자를 선택해주세요." required>
								</td>
								<td>
									7. 펀딩 후원금 사용 계획<br>
									<textarea name="fundingPlan" id="fundingPlan" placeholder="내용을 입력해주세요." cols="50"
										rows="10" required></textarea>
								</td>
							</tr>
						</table>
					</div>
					<div>
						<table>
							<tr>
								<td>8. 리워드 소개<br>
									<textarea name="rewardDesc" id="rewardDesc" cols="50" rows="10"
										placeholder="내용을 입력해주세요." required></textarea>
								</td><td></td>
							</tr>
								<tr>
									<td>9. 리워드 구성<br>
									<input type="text" id="rewardPrice" name="rewardPrice" placeholder="금액" pattern="[1-9][0-9]{0,10}" required>&nbsp;원
										달성 시&nbsp;
										<input type="text" id="rewardTitle" name="rewardTitle"
											placeholder="리워드 종류" required>&nbsp;</td><td>
										최대&nbsp;<input type="text" name="rewardEA" id="rewardEA" placeholder="개수" pattern="[1-9][0-9]{0,10}" required>개
										<button type="button" id="addReward">리워드 추가</button>
										<button type="button" class="closeRewardBtn">삭제</button>
									</td>
								</tr>
							<tbody id="tbody2">
							</tbody>
								<tr>
									<td>
										10. 배송일자<br>
										<input type="text" id="deliveryDate" name="delivery" class="datepick" placeholder="일자를 선택해주세요." required>
									</td>
									<td>
										11. 배송비<br>
										<input type="text" id="deliveryCharge" name="deliveryCharge" placeholder="배송비" pattern="[1-9][0-9]{0,10}" required>원
									</td>
								</tr>
							
						</table>
						<!--개인정보 동의서 팝업 / 동의안하면 안 넘어감-->
						<input type="checkbox" id="privacyChk">개인정보 수집 및 이용에 동의&nbsp;&nbsp;&nbsp;
						<button type="button" id="openPrivacy">자세히 보기</button>
						<div class="wrap wrap1">
							<div id="closePrivacyDiv" class="close closePrivacy"><button type="button">X</button></div>
							<div id="privacyDetail" class="modal">
								<div id="detailTitle">
									개인정보 수집•이용 동의서
								</div><br>
								<div id=detailContent>
									- 이용자가 제공한 모든 정보는 다음의 목적을 위해 활용하며, 하기 목적 이외의 용도로는 사용되지 않습니다.<br>
									① 개인정보 수집 항목 및 수집·이용 목적<br>
									가) 수집 항목 (필수항목)<br>
									- 주체명, 연락처, 이메일, 업체정보,<br>
									신청서에 기재된 펀딩 관련 정보 또는 신청자가 제공한 정보<br>
									나) 수집 및 이용 목적<br>
									- 새싹나눔 펀딩 진행<br>
									- 새싹나눔 펀딩 메이커 연락 및 자격확인<br>
									- 새싹나눔 펀딩 메이커 자원관리<br>
									② 개인정보 보유 및 이용기간<br>
									- 수집·이용 동의일로부터 개인정보의 수집·이용목적을 달성할 때까지<br>
								</div>
							</div>
						</div>
						<br><br><br>
						<button type="submit" id="submitBtn" disabled="disabled">프로젝트 개설 신청하기</button>
					</div>
				</div>
			</form>
		</div>
		<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/user/applicationForm.js"></script>
	</body>
	</html>
