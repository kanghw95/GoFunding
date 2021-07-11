package com.funding.sprout.funding.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.admin.service.AdminService;
import com.funding.sprout.funding.service.FundingService;
import com.funding.sprout.vo.Funding;
import com.funding.sprout.vo.Order;
import com.funding.sprout.vo.OrderDetail;
import com.funding.sprout.vo.OrderRefund;
import com.funding.sprout.vo.Reward;
import com.funding.sprout.vo.User;

@Controller
public class FundingCtrl {
	
	@Autowired
	private FundingService funService;

	@Autowired
	private AdminService adService;
	
	@RequestMapping(value = "funone", method = RequestMethod.GET)
	public ModelAndView selectOne() {
		

		return null; // 펀딩 가져오기
	}
	
	
	//펀딩 검색
	@RequestMapping(value = "funsearch", method = RequestMethod.GET)
	public ModelAndView searchList(ModelAndView mv, @RequestParam(name = "keyword") String keyword,
			@RequestParam(name = "serchOption") String serchOption) {
		System.out.println(keyword);
		System.out.println(serchOption);
		List<Funding> searchlist = null;
		try {
				searchlist = funService.searchList(serchOption, keyword);

			System.out.println("검색된 펀딩 목록 : " + searchlist);
			mv.addObject("fundinglist", searchlist);
			mv.setViewName("funding/fundinglist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv; // 펀딩 검색 조회
	}

	// 전체 펀딩 조회
	@ResponseBody
	@RequestMapping(value = "funselect", method = RequestMethod.GET)
	public ModelAndView selectList(ModelAndView mv) {
		try {

			int listcount = funService.listCount();
			List<Funding> fundinglist = funService.selectList();

			System.out.println("펀딩리스트 :" + fundinglist);
			System.out.println("펀딩갯수 :" + listcount);
			
			mv.addObject("fundinglist", fundinglist);
			mv.addObject("listcount", listcount);
			mv.setViewName("funding/fundinglist");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "funselectCat")  
	public String catCheck(HttpServletRequest request,Model mv,@RequestParam(name = "cat") String cat,@RequestParam(name = "fin") int fin) {
		
		try {
			System.out.println("cat = " + cat);
			System.out.println("fin = " + fin);
			
			if(cat != "" && fin != 0) {
				System.out.println("변경을 원하는 순서는 = " + cat + ", 종료펀딩 =" + fin);
				
				List<Funding> fundinglist = funService.selectCatFinList(cat);
				System.out.println(fundinglist);
				mv.addAttribute("fundinglist", fundinglist);
				return "/funding/paytest";
				
			}
			
			if(cat != "") {
				System.out.println("변경을 원하는 순서는 = " + cat + ", 종료펀딩 =" + fin);
				
				List<Funding> fundinglist = funService.selectCatList(cat);
				System.out.println(fundinglist);
				mv.addAttribute("fundinglist", fundinglist);
				return "/funding/paytest";
			}
			
			if(fin != 0) {
				System.out.println("변경을 원하는 순서는 = " + cat + ", 종료펀딩 =" + fin);;
				cat = "종료 펀딩";
				List<Funding> fundinglist = funService.selectFinList(cat);
				System.out.println(fundinglist);
				mv.addAttribute("fundinglist", fundinglist);
				cat = "";
			}
			
			if(fin == 0) {
				System.out.println("변경을 원하는 순서는 = " + cat + ", 종료펀딩 =" + fin);
				cat = "종료 아닌거";
				List<Funding> fundinglist = funService.selectFinList(cat);
				System.out.println(fundinglist);
				mv.addAttribute("fundinglist", fundinglist);
				cat = "";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/funding/paytest";
		
	}
	
	

	// 펀딩 상세 페이지
	@RequestMapping(value = "funding/detail", method = RequestMethod.GET)
	public ModelAndView fundingDetail(@RequestParam(name = "no") int fundingno, ModelAndView mv,@RequestParam(name = "Id") String Id) {
		try {
			int historyResult = 0;
			
			Funding funding = funService.selectOne(fundingno);	
			List<Reward> rewardlist = funService.selectReward(fundingno);
			historyResult = funService.selectHistory(fundingno);
			List<Order>  historyResultDetail = funService.selectHistoryDetail(fundingno);
			
			int likecnt = 0; // 추천수
            int isLiked = funService.checklike(fundingno, Id);    // 좋아요상태 :1, 아니면 :0
            System.out.println("좋아요 상태 = " + isLiked);
			mv.addObject("isliked", isLiked);   // 좋아요상태 :1, 아니면 :0
			
			likecnt = funService.likecnt(fundingno); // 추천수
			System.out.println("좋아요 수 = " + likecnt);
			mv.addObject("likecnt", likecnt);
			
			System.out.println("선택한 펀딩 정보 :" + funding);
			System.out.println("선택한 리워드 정보 :" + rewardlist);
			System.out.println("참여 인원 :" + historyResult);
			System.out.println("참여 내역 :" + historyResultDetail);
			
			mv.addObject("historyResult", historyResult);
			mv.addObject("historyResultDetail",historyResultDetail);
			mv.addObject("funding", funService.selectOne(fundingno));
			mv.addObject("reward", funService.selectReward(fundingno));
			
			mv.setViewName("funding/fundingdetail");
			
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	//결제 페이지 이동
	@RequestMapping(value = "funding/fundingpay", method = RequestMethod.POST)
	public ModelAndView fundingpay(
			@RequestParam(name = "funding_pay_total_price") int funding_pay_price,
			@RequestParam(name = "funding_pay_total_rewordEA") int funding_pay_rewordEA,
			@RequestParam(name = "funding_no") int fundingno,
			@RequestParam(name = "deliverycharge") int deliverycharge,
			@RequestParam(name = "funding_pay_reword") String[] reword,
			@RequestParam(name = "funding_pay_price") String[] price,
			@RequestParam(name = "funding_pay_rewordEA") String[] rewordEA,
			@RequestParam(name = "cheer_pay") String cheer_pay,
			@RequestParam(name = "cheer_pay_price") int cheer_pay_price,
			@RequestParam(name = "cheer_pay_EA") String cheer_pay_EA,
			@RequestParam(name = "userId") String userId,
			ModelAndView mv) {
		try {
			
			Funding funding = funService.selectOne(fundingno);	
			System.out.println("선택한 펀딩 정보 :" + funding);
			for(int i=0; i<reword.length; i++) {
			System.out.println("선택한 리워드 정보 :" + reword[i]);
			System.out.println("선택한 리워드 갯수정보 :" + rewordEA[i]);
			}
			mv.addObject("funding_pay_price",funding_pay_price);
			mv.addObject("funding_pay_rewordEA",funding_pay_rewordEA);
			mv.addObject("funding", funService.selectOne(fundingno));
			mv.addObject("deliverycharge", deliverycharge);
			mv.addObject("reward", reword);
			mv.addObject("price", price);
			mv.addObject("rewordEA", rewordEA);
			mv.addObject("cheer_pay", cheer_pay);
			mv.addObject("cheer_pay_price", cheer_pay_price);
			mv.addObject("cheer_pay_EA", cheer_pay_EA);
			mv.setViewName("funding/fundingpay");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;  // 펀딩 결제 페이지
	}
	
	// 펀딩 결제 완료 페이지 이동
	@RequestMapping(value = "funding/fundingresult", method = RequestMethod.POST) 
	public ModelAndView fundingresult(
			@RequestParam(name = "reward") String[] reword,
			@RequestParam(name = "rewardEA") int[] rewardEA,
			@RequestParam(name = "rewardPrice") int[] rewardPrice,
		
			@RequestParam(name = "cheer",required=false) String cheer,
			@RequestParam(name = "cheerEA",required=false) String cheerEA,
			@RequestParam(name = "cheerPrice",required=false) String cheerPrice,
			
			@RequestParam(name = "totalPrice") int totalPrice,
			@RequestParam(name = "userId") String userId,
			@RequestParam(name = "userAddr") String userAddr,
			@RequestParam(name = "fundingno") int fundingno,
			@RequestParam(name = "paycat") String paycat,
			@RequestParam(name = "name") String name,
			@RequestParam(name = "tel_head") String tel_head,
			@RequestParam(name = "message") String message,
			User user,
			Order order,
			Reward reward,
			OrderDetail orderDetail,
			OrderRefund orderRefund,
			
			ModelAndView mv) {
		try {
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
			
			sumTotalPrice += totalPrice;
			System.out.println("주문후 합계금액  :" + sumTotalPrice);
			
			funding.setCurrentprice(sumTotalPrice);
			funding.setFundingno(fundingno);
			
			int sumTotalPriceResult = funService.priceUpdate(funding); 
			System.out.println("주문후 합계금액 결과는  :" + sumTotalPriceResult);
			
			user.setUserId(userId);
			user.setUserAddress(userAddr);
			List<User> searchId = adService.selectUserId(user); // 아이디로 검색한 리스트 가져오기
			
			// 주문 테이블 입력
			order.setDeliveryAddr(userAddr); 
			order.setId(userId);
			order.setOrderTotalPrice(totalPrice);
			if(paycat.equals("카드 간편")) {
				order.setPaymentType('0');
			}else {
				order.setPaymentType('1');
			}
			order.setRecipient(name);
			order.setRecipientPhone(tel_head);
			order.setFundingNo(fundingno);
			order.setDeliveryMessage(message);
			
			orderResult = funService.insertOrders(order);
			System.out.println("주문 입력 결과 "+ orderResult);
			
			
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
				
				//주문 상세 입력 시작
				orderDetail.setOrderNo(funService.selectOrderNo(order));
				orderDetail.setRewardNo(funService.selectRewardNo(reward));
				orderDetail.setRewardCount(rewardEA[i]);
				orderDetail.setRewardPrice(rewardPrice[i]);
				if(paycat.equals("카드 간편")) {
					orderDetail.setOrderStatus('1');
				}else {
					orderDetail.setOrderStatus('0');
				}
				System.out.println("주문번호는 ="+orderDetail.getOrderNo());
				System.out.println("리워드 번호는 ="+orderDetail.getRewardNo());
				orderDetailResult = funService.insertOrdersDetail(orderDetail);
				System.out.println("주문상세 입력결과는 = " + orderDetailResult);
				// 주문 상세 입력 끝
				
				int renewRewardStock = rewardStock - rewardEA[i];
				System.out.println("리워드의 현재 수량은" + rewardStock + "주문 수량은" + rewardEA[i] + "남은 수량은 " + renewRewardStock);
				System.out.println("리워드 이름" + reword[i] +"리워드 남은 개수" + renewRewardStock);
				
				reward.setRewardEA(renewRewardStock);
				
				rewardStockChange = funService.rewardStockChange(reward);
				
				if(rewardStockChange >0) {
					System.out.println("리워드 수량변경 정상적으로 완료");
				}else {
					System.out.println("리워드 수량변경 중 오류 발생");
				}
				reward.setRewardNo(orderDetail.getRewardNo());
				rewardCount = funService.rewardCount(reward);
				System.out.println("리워드 참가 인원은 =" + rewardCount);
				int Count = rewardCount + 1;
				
				reward.setRewardCount(Count);
				rewardCountIncrease = funService.rewardCountIncrease(reward);
				System.out.println("리워드 참가인원 변경 결과 =" + rewardCountIncrease);
			}
			
			
			mv.addObject("funding", funding);
			mv.addObject("searchId", searchId);
			
			mv.addObject("reward", reword);
			mv.addObject("rewardEA", rewardEA);
			mv.addObject("rewardPrice", rewardPrice);
			
			mv.addObject("cheer", cheer);
			mv.addObject("cheerEA", cheerEA);
			mv.addObject("cheerPrice", cheerPrice);
			
			mv.addObject("totalPrice", totalPrice);
			mv.addObject("paycat", paycat);
			mv.setViewName("funding/fundingpayResult");
			
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;  // 펀딩 결제완료 페이지
	}
	
	// 중복 주문 검사
	@ResponseBody
	@RequestMapping(value = "funding/orderCheck", method = RequestMethod.POST, produces = "application/text; charset=utf-8")  
	public String ordersCheck(
			@RequestParam(name = "userId") String userId,
			@RequestParam(name = "fundingno") int fundingno,
			Order orders
			) {
	
			String Check = null;
			int ordersCheck = 0;
		try {
			orders.setFundingNo(fundingno);
			orders.setId(userId);
			
			ordersCheck= funService.selectOrderCheck(orders);

			
			if(ordersCheck > 0) {
				System.out.println("result : " + ordersCheck);
				Check = "중복 주문";
			}else {
				System.out.println("result : " + ordersCheck);
				Check = "주문 가능";
			}
			System.out.println("Check : " + Check);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Check;
	}
	
	@RequestMapping(value = "funding/clickLike", method = RequestMethod.POST)
	@ResponseBody
	public int clickLike(@RequestParam("fundingno") int fundingno, @RequestParam("Id") String Id, ModelAndView mv,
			ModelAndView model) { // 추천
		int result = -1;
		int likecnt = 0;
		try {
			result = funService.checklike(fundingno, Id);
			if (result == 0) { // 좋아요 안되어있는 상태라면 클릭했을때 좋아요
				funService.insertLike(fundingno, Id);
				System.out.println("좋아요 완료");
			} else if (result == 1) { // 좋아요 되어있는 상태라면 클릭했을때 좋아요 취소
				funService.deleteLike(fundingno, Id);
				System.out.println("좋아요 해제");
			} else {
				}
			likecnt = funService.likecnt(fundingno); // 총 좋아요 수
			System.out.println("총 추천수=" + likecnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return likecnt;
	}
	
	@RequestMapping(value = "funinsert", method = RequestMethod.GET)
	public ModelAndView insertFunding() {
		return null; // 펀딩 입력
	}

	@RequestMapping(value = "funupdate", method = RequestMethod.GET)
	public ModelAndView updateFunding() {
		return null; // 펀딩 수정
	}

	@RequestMapping(value = "fundelete", method = RequestMethod.GET)
	public ModelAndView deleteFunding() {
		return null; // 펀딩 삭제
	}

	@RequestMapping(value = "funlike", method = RequestMethod.GET)
	public ModelAndView getPreference() { // TODO 선호하는 펀딩 정보 이거는 수정이 필요해보임 추가도
		return null;

	}
}
