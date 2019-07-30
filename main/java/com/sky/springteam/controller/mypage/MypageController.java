package com.sky.springteam.controller.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sky.springteam.model.mypage.dto.MypageDTO;
import com.sky.springteam.model.user.dto.UserDTO;
import com.sky.springteam.service.mypage.MypageService;
import com.sky.springteam.service.user.UserService;

@Controller
@RequestMapping("mypage/*")
public class MypageController {
	
	@Inject
	MypageService mypageService;
	@Inject
	UserService userService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		//세션변수 확인
		UserDTO dto = (UserDTO)session.getAttribute("user");
		String userid = dto.getUserid();
		System.out.println("\r"+userid+"\r");
		if(userid != null) {//로그인한 경우
			List<MypageDTO> list=mypageService.listMypage(userid);
			//장바구니 합계 계산
			int sumMoney = mypageService.sumMoney(userid);
			Map<String, Object> map = new HashMap<>();

			map.put("sumMoney", sumMoney);//장바구니 금액 합계
			
			map.put("list", list);//맵에 자료 추가
			
			for(MypageDTO a : list) {
				System.out.println("\r"+a.getImg_url()+"\r");
			}
			
			map.put("count", list.size());
			mav.setViewName("cart/cart_list");//jsp페이지 이름
			mav.addObject("map",map);//jsp에 전달할 데이터
		}//else {//로그인하지 않은 경우 userid < null
		return mav;
		
//			return new ModelAndView("user/login", "로그인하세요", null);
	//	}
		
	}
	
	
	@RequestMapping("insert.do")//세부적인 url mapping
	public String insert(HttpSession session, @ModelAttribute MypageDTO dto) {
		//세션에 userid 변수가 존재하는지 확인
		UserDTO dto1 = (UserDTO)session.getAttribute("user");
		String userid = dto1.getUserid();
		//String subject_name = dto.getSubject_name();
//		if(userid==null) {//로그인 하지 않은 상태
//			return "redirect:/member/login.do";//로그인 페이지로
//		}
		//장바구니에 insert 처리 후 장바구니 목록으로 이동
		dto.setUserid(userid);
		
		dto1.setClass_name(dto.getSubject_name());
		userService.classupdate(dto1);
		//if(mypageService.checkCart(subject_name)) {
			//System.out.println("통과");
			mypageService.insert(dto);
			return "user/updateuser.jsp?#myclass";
		//}else {
			//System.out.println("통과1");
		//	return "redirect:/subject/list.do";
		//}
	}//insert()

	
	//장바구니 개별 상품 삭제
	//@RequestParam : request.getParameter()
	@RequestMapping("delete.do")
	public String delete(@RequestParam int cart_id, HttpSession session) {
		if((UserDTO)session.getAttribute("user") != null)
			mypageService.delete(cart_id);
		return "user/updateuser.jsp?id=myclass";
	}//delete()
	
	@RequestMapping("deleteAll.do")
	public String deleteAll(HttpSession session) {
		//세션변수 조회(로그인 여부 검사)
		UserDTO dto = (UserDTO)session.getAttribute("user");
		String userid = dto.getUserid();
		if (userid != null) {//로그인한 상태이면
			//장바구니를 비우고
			mypageService.deleteAll(userid);
		}
		//장바구니 목록으로 이동
		return "user/updateuser.jsp?id=myclass";
	}//deleteAll()
	
	
}
