package com.funding.sprout.user.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.HomeController;
import com.funding.sprout.admin.service.AdminService;
import com.funding.sprout.funding.service.FundingService;
import com.funding.sprout.message.service.MessageService;
import com.funding.sprout.user.service.UserMyPageService;
import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.Criteria;
import com.funding.sprout.vo.Funding;
import com.funding.sprout.vo.MyFunding;
import com.funding.sprout.vo.Order;
import com.funding.sprout.vo.OrderDetail;
import com.funding.sprout.vo.OrderRefund;
import com.funding.sprout.vo.PageMaker;
import com.funding.sprout.vo.Reward;
import com.funding.sprout.vo.User;

@Controller
public class UserMyPageCtrl {
	
	@Autowired
	private UserMyPageService myService;
	@Autowired
	private MessageService msgService;
	
	@Autowired
	private FundingService funService;

	@Autowired
	private AdminService adService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public ModelAndView mypagetest(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("myPage 진입", locale);

		ModelAndView mv=new ModelAndView();
		User loginUser=(User)session.getAttribute("user");
		String loginId=loginUser.getUserId();
		String userCnt=msgService.userUserMsgCnt(loginId);
		String makerCnt=msgService.makerUserMsgCnt(loginId);
		
		int fundingCount = myService.cntMyFunding(loginId); // 펀딩 참여 횟수
		
		mv.addObject("userCnt", userCnt);
		mv.addObject("makerCnt", makerCnt);
		mv.addObject("fundingCount", fundingCount);
		
		
		mv.setViewName("user/myPage");
		
		
		
		return mv;
	}
	
	
	@RequestMapping(value = "/myfundinglist", method = RequestMethod.GET)
	public String myFundingList(Model model, HttpSession session) throws Exception { // 내가 참여한 전체 펀딩 조회 페이지
		System.out.println("fundinglist 컨트롤러 들어옴");

		User loginUser = (User) session.getAttribute("user");
		String id = loginUser.getUserId();

		List<MyFunding> fundingList = myService.list(id); // 펀딩 리스트
		int fundingCount = myService.cntMyFunding(id); // 펀딩 참여 횟수

		System.out.println(loginUser);
		System.out.println("id: " + id);
		System.out.println("fundingList: " + fundingList);
		System.out.println("fundingCount: " + fundingCount);

		model.addAttribute("fundingList", fundingList);
		model.addAttribute("fundingCount", fundingCount);

		return "user/myFundingList";
	}
	
	
	@RequestMapping(value = "/myfundingdetail", method = RequestMethod.GET)
	public ModelAndView myFundingDetailList(ModelAndView mv, HttpSession session,
			@RequestParam(name = "fundingNo") int fundingNo, MyFunding vo) throws Exception {
		System.out.println("fundingDetail 들어옴");

		User loginUser = (User) session.getAttribute("user");
		String id = loginUser.getUserId();

		vo.setUserId(id);
		vo.setFundingNo(fundingNo);
		System.out.println(vo.getFundingNo());

		List<MyFunding> fundingReward = myService.rewardList(vo);
		List<MyFunding> fundingDetail = myService.fundingDetail(vo);

		System.out.println("fundingNo" + fundingNo);
		System.out.println(loginUser);
		System.out.println("id: " + id);
		System.out.println("fundingDetail: " + fundingDetail);
		System.out.println("fundingReward : " + fundingReward);

		mv.addObject("fundingDetail", fundingDetail);
		mv.addObject("fundingReward", fundingReward);

		mv.setViewName("user/myFundingDetail");

		return mv;
	}
	
	@RequestMapping(value = "/insertOrderRefund", method = RequestMethod.POST)
	public ModelAndView insertOrderRefund(ModelAndView mv, HttpSession session, 
			@RequestParam(name="orderDetailNo")int[] orderDetailNo,
			@RequestParam(name = "rewardEA") int[] rewardEA,
			@RequestParam(name = "reward") String[] reword,
			@RequestParam(name="orderNo")int orderNo,
			@RequestParam(name="fundingNo")int fundingno,
			@RequestParam(name = "totalPrice") int totalPrice,
			OrderRefund orRefund,
			Order order,
			Reward reward,
			OrderDetail orDetail
			) throws Exception{
		System.out.println("fundingDetail 들어옴");
		
		
		for(int i =0; i<orderDetailNo.length; i++) {
			System.out.println("환불할 상제 주문번호 = "+orderDetailNo[i]);
			orRefund.setRefundNo(orderDetailNo[i]);
			
			int resultRefund = myService.insertOrderRefund(orRefund);
			

			if(resultRefund == 1) {
				System.out.println("환불 테이블 입력 성공");
			}else {
				System.out.println("환불 테이블 입력 실패");
			}
		}
		order.setOrderNo(orderNo);
		orDetail.setOrderNo(orderNo);
		int resultOrderStatus = myService.orderStausChange(order);
		int resultOrderDetailStatus = myService.orderDetailStausChange(orDetail);
		
		System.out.println("resultOrderStatus =" + resultOrderStatus);
		System.out.println("resultOrderDetailStatus =" + resultOrderDetailStatus);
		if(resultOrderStatus == 1 && resultOrderDetailStatus > 0) {
			System.out.println("환불  성공");
		}else {
			System.out.println("환불  실패");
		}
		
		
		int orderResult = 0;
		int orderDetailResult = 0;
		int orderRefundResult = 0;
		int rewardCount = 0;
		int rewardCountIncrease = 0;
		
		int rewardStock = 0;
		int rewardStockChange = 0;
		
		// 펀딩 현재 금액 업데이트
		Funding funding = funService.selectOne(fundingno);	
		int sumTotalPrice =  0;
		sumTotalPrice = funService.selectTotalPrice(fundingno);
				
		System.out.println("선택한 펀딩 정보 :" + funding);
		System.out.println("선택한 펀딩 현재금액  :" + sumTotalPrice);
		
		sumTotalPrice -= totalPrice;
		System.out.println("환불 후 합계금액  :" + sumTotalPrice);
		
		funding.setCurrentprice(sumTotalPrice);
		funding.setFundingno(fundingno);
		
		int sumTotalPriceResult = funService.priceUpdate(funding); 
		if(sumTotalPriceResult >0) {
			System.out.println("환불 후 합계금액 결과 완료");
		}else {
			System.out.println("환불 후 합계금액 결과 오류 발생");
		}

		// 리워드 수량 변경
					for(int i=0; i<reword.length; i++) { 
						if(reword[i] == null || reword[i].isEmpty()) {
							break;
						}
						
						System.out.println(reword[i].replaceAll("(^\\p{Z}+|\\p{Z}+$)",""));
						System.out.println(rewardEA[i]);
						System.out.println(fundingno);
						
						reward.setRewardTitle(reword[i].replaceAll("(^\\p{Z}+|\\p{Z}+$)",""));
						reward.setFundingNo(fundingno);
			
						rewardStock = funService.rewardStock(reward);
						
						orDetail.setRewardNo(funService.selectRewardNo(reward));
						
						int renewRewardStock = rewardStock + rewardEA[i];
						System.out.println("리워드의 현재 수량은" + rewardStock + "주문 수량은" + rewardEA[i] + "남은 수량은 " + renewRewardStock);
						System.out.println("리워드 이름" + reword[i] +"리워드 남은 개수" + renewRewardStock);
						
						reward.setRewardEA(renewRewardStock);
						
						rewardStockChange = funService.rewardStockChange(reward);
						
						if(rewardStockChange >0) {
							System.out.println("리워드 수량변경 정상적으로 완료");
						}else {
							System.out.println("리워드 수량변경 중 오류 발생");
						}
						reward.setRewardNo(orDetail.getRewardNo());
						rewardCount = funService.rewardCount(reward);
						System.out.println("리워드 참가 인원은 =" + rewardCount);
						int Count = rewardCount - 1;
						
						reward.setRewardCount(Count);
						rewardCountIncrease = funService.rewardCountIncrease(reward);
						if(rewardCountIncrease >0) {
							System.out.println("리워드 참가인원 변경완료");
						}else {
							System.out.println("리워드 참가인원 변경 오류 발생");
						}
					}
		User loginUser = (User) session.getAttribute("user");
		String id = loginUser.getUserId();

		List<MyFunding> fundingList = myService.list(id); // 펀딩 리스트
		int fundingCount = myService.cntMyFunding(id); // 펀딩 참여 횟수			
					
		System.out.println(loginUser);
		System.out.println("id: " + id);
		System.out.println("fundingList: " + fundingList);
		System.out.println("fundingCount: " + fundingCount);

		mv.addObject("fundingList", fundingList);
		mv.addObject("fundingCount", fundingCount);
		
		mv.setViewName("user/myFundingList");
		
		
		return mv;
	}
	
	
	//내가 쓴  글 조회
	@RequestMapping(value = "/myboardlist", method = RequestMethod.GET)
	public ModelAndView myBoardList(ModelAndView mv, HttpSession session) throws Exception{
		System.out.println("myboardlist 들어옴");
		
		User loginUser = (User)session.getAttribute("user");
		String id = loginUser.getUserId();
		
		List<Board> freeBoardList = myService.freeBoardList(id);
		List<Board> reviewBoardList = myService.reviewBoardList(id);
		List<Board> qBoardList = myService.qBoardList(id);
		List<Board> sBoardList = myService.sBoardList(id);
		List<Board> eBoardList = myService.eBoardList(id);
		
		System.out.println("freeBoardList : " + freeBoardList);
		System.out.println("reviewBoardList : " + reviewBoardList);
		System.out.println("qBoardList : " + qBoardList);
		System.out.println("sBoardList : " + sBoardList);
		System.out.println("eBoardList : " + eBoardList);
		
		mv.addObject("freeBoardList", freeBoardList);
		mv.addObject("reviewBoardList", reviewBoardList);
		mv.addObject("qBoardList", qBoardList);
		mv.addObject("sBoardList", sBoardList);
		mv.addObject("eBoardList", eBoardList);
		
		mv.setViewName("user/myBoardList");
		
		return mv;
	}
	
	//내가 쓴 자유 게시판 글 조회 더보기
	@RequestMapping(value = "/myflist", method = RequestMethod.GET)
	public ModelAndView myFreeBoardMore(ModelAndView mv, HttpSession session) throws Exception{
		System.out.println("myflist 들어옴");
		
		User loginUser = (User)session.getAttribute("user");
		String id = loginUser.getUserId();
		
		List<Board> freeBoardMore = myService.freeBoardListMore(id);
		
		System.out.println("freeBoardMore : " + freeBoardMore);
		
		mv.addObject("freeBoardMore", freeBoardMore);
		
		mv.setViewName("user/myFreePopup");
		
		return mv;
	}
	
	//내가 쓴 후기 게시판 글 조회 더보기
	@RequestMapping(value = "/myrlist", method = RequestMethod.GET)
	public ModelAndView myReviewBoardMore(ModelAndView mv, HttpSession session) throws Exception{
		System.out.println("myrlist 들어옴");
		
		User loginUser = (User)session.getAttribute("user");
		String id = loginUser.getUserId();
		
		List<Board> reviewBoardMore = myService.reviewBoardListMore(id);
		
		System.out.println("reviewBoardMore : " + reviewBoardMore);
		
		mv.addObject("reviewBoardMore", reviewBoardMore);
		
		mv.setViewName("user/myReviewPopup");
		
		return mv;
	}
	
	//내가 쓴 질의응답 게시판 글 조회 더보기
	@RequestMapping(value = "/myqlist", method = RequestMethod.GET)
	public ModelAndView myQBoardMore(ModelAndView mv, HttpSession session) throws Exception{
		System.out.println("myqlist 들어옴");
		
		User loginUser = (User)session.getAttribute("user");
		String id = loginUser.getUserId();
		
		List<Board> qBoardMore = myService.qBoardListMore(id);
		
		System.out.println("qBoardMore : " + qBoardMore);
		
		mv.addObject("qBoardMore", qBoardMore);
		
		mv.setViewName("user/myQuestionPopup");
		
		return mv;
	}
	
	//내가 쓴 정보공유 게시판 글 조회 더보기
	@RequestMapping(value = "/myslist", method = RequestMethod.GET)
	public ModelAndView mySBoardMore(ModelAndView mv, HttpSession session) throws Exception{
		System.out.println("myslist 들어옴");
		
		User loginUser = (User)session.getAttribute("user");
		String id = loginUser.getUserId();
		
		List<Board> sBoardMore = myService.sBoardListMore(id);
		
		System.out.println("sBoardMore : " + sBoardMore);
		
		mv.addObject("sBoardMore", sBoardMore);
		
		mv.setViewName("user/mySharePopup");
		
		return mv;
	}
	
	//내가 쓴 이벤트 게시판 글 조회 더보기
	@RequestMapping(value = "/myelist", method = RequestMethod.GET)
	public ModelAndView myEBoardMore(ModelAndView mv, HttpSession session) throws Exception{
		System.out.println("myelist 들어옴");
		
		User loginUser = (User)session.getAttribute("user");
		String id = loginUser.getUserId();
		
		List<Board> eBoardMore = myService.eBoardListMore(id);
		
		System.out.println("eBoardMore : " + eBoardMore);
		
		mv.addObject("eBoardMore", eBoardMore);
		
		mv.setViewName("user/myEventPopup");
		
		return mv;
	}
	
	
	//내가 쓴  댓글 조회
	@RequestMapping(value = "/mycmtlist", method = RequestMethod.GET)
	public ModelAndView myCommentList(ModelAndView mv, HttpSession session) throws Exception{
		System.out.println("mycmtlist 들어옴");
		
		User loginUser = (User)session.getAttribute("user");
		String id = loginUser.getUserId();
		
		List<Board> freeBoardCmtList = myService.freeBoardCmtList(id);
		List<Board> rBoardCmtList = myService.rBoardCmtList(id);
		List<Board> qBoardCmtList = myService.qBoardCmtList(id);
		List<Board> sBoardCmtList = myService.sBoardCmtList(id);
		List<Board> eBoardCmtList = myService.eBoardCmtList(id);
		
		System.out.println("freeBoardCmtList : " + freeBoardCmtList);
		System.out.println("rBoardCmtList : " + rBoardCmtList);
		System.out.println("qBoardCmtList : " + qBoardCmtList);
		System.out.println("sBoardCmtList : " + sBoardCmtList);
		System.out.println("eBoardCmtList : " + eBoardCmtList);
		
		mv.addObject("freeBoardCmtList", freeBoardCmtList);
		mv.addObject("rBoardCmtList", rBoardCmtList);
		mv.addObject("qBoardCmtList", qBoardCmtList);
		mv.addObject("sBoardCmtList", sBoardCmtList);
		mv.addObject("eBoardCmtList", eBoardCmtList);
		
		mv.setViewName("user/myCommentList");
		
		return mv;
	}
	
	//내가 쓴 자유 게시판 댓글 조회 더보기
	@RequestMapping(value = "/myfcmtlist", method = RequestMethod.GET)
	public ModelAndView myFreeBoardCmtMore(ModelAndView mv, HttpSession session) throws Exception{
		System.out.println("myfcmtlist 들어옴");
		
		User loginUser = (User)session.getAttribute("user");
		String id = loginUser.getUserId();
		
		List<Board> freeBoardCmtMore = myService.freeBoardCmtListMore(id);
		
		System.out.println("freeBoardCmtMore : " + freeBoardCmtMore);
		
		mv.addObject("freeBoardCmtMore", freeBoardCmtMore);
		
		mv.setViewName("user/myFreeCmtPopup");
		
		return mv;
	}
	
	//내가 쓴 후기 게시판 댓글 조회 더보기
	@RequestMapping(value = "/myrcmtlist", method = RequestMethod.GET)
	public ModelAndView myRBoardCmtMore(ModelAndView mv, HttpSession session) throws Exception{
		System.out.println("myrcmtlist 들어옴");
		
		User loginUser = (User)session.getAttribute("user");
		String id = loginUser.getUserId();
		
		List<Board> rBoardCmtMore = myService.rBoardCmtListMore(id);
		
		System.out.println("rBoardCmtMore : " + rBoardCmtMore);
		
		mv.addObject("rBoardCmtMore", rBoardCmtMore);
		
		mv.setViewName("user/myReviewCmtPopup");
		
		return mv;
	}
	
	//내가 쓴 질의응답 게시판 댓글 조회 더보기
	@RequestMapping(value = "/myqcmtlist", method = RequestMethod.GET)
	public ModelAndView myQBoardCmtMore(ModelAndView mv, HttpSession session) throws Exception{
		System.out.println("myqcmtlist 들어옴");
		
		User loginUser = (User)session.getAttribute("user");
		String id = loginUser.getUserId();
		
		List<Board> qBoardCmtMore = myService.qBoardCmtListMore(id);
		
		System.out.println("qBoardCmtMore : " + qBoardCmtMore);
		
		mv.addObject("qBoardCmtMore", qBoardCmtMore);
		
		mv.setViewName("user/myQuestionCmtPopup");
		
		return mv;
	}
	
	//내가 쓴 정보공유 게시판 댓글 조회 더보기
	@RequestMapping(value = "/myscmtlist", method = RequestMethod.GET)
	public ModelAndView mySBoardCmtMore(ModelAndView mv, HttpSession session) throws Exception{
		System.out.println("myscmtlist 들어옴");
		
		User loginUser = (User)session.getAttribute("user");
		String id = loginUser.getUserId();
		
		List<Board> sBoardCmtMore = myService.sBoardCmtListMore(id);
		
		System.out.println("sBoardCmtMore : " + sBoardCmtMore);
		
		mv.addObject("sBoardCmtMore", sBoardCmtMore);
		
		mv.setViewName("user/myShareCmtPopup");
		
		return mv;
	}
	
	//내가 쓴 이벤트 게시판 댓글 조회 더보기
	@RequestMapping(value = "/myecmtlist", method = RequestMethod.GET)
	public ModelAndView myEBoardCmtMore(ModelAndView mv, HttpSession session) throws Exception{
		System.out.println("myecmtlist 들어옴");
		
		User loginUser = (User)session.getAttribute("user");
		String id = loginUser.getUserId();
		
		List<Board> eBoardCmtMore = myService.eBoardCmtListMore(id);
		
		System.out.println("eBoardCmtMore : " + eBoardCmtMore);
		
		mv.addObject("eBoardCmtMore", eBoardCmtMore);
		
		mv.setViewName("user/myEventCmtPopup");
		
		return mv;
	}
	
	
	
}
