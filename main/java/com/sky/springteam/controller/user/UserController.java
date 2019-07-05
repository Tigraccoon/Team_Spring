package com.sky.springteam.controller.user;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sky.springteam.model.user.dto.UserDTO;
import com.sky.springteam.service.user.UserService;

@Controller
@RequestMapping("user/*")
public class UserController {
	
	@Inject
	UserService userService;
	
	//링크 이동
	@RequestMapping("login.go")
	public String logingo() {
		return "user/login";
	}
	
	@RequestMapping("finduser.go")
	public String findusergo() {
		return "user/finduser";
	}
	
	@RequestMapping("signup.go")
	public String signupgo() {
		return "user/signup1";
	}
	
	//마이페이지
	@RequestMapping("updateuser.go")
	public String updateusergo() {
		return "user/updateuser";
	}
	
	
	//링크+데이터 이동
	@RequestMapping("login.do")
	public ModelAndView logindo(HttpSession session, ModelAndView mav, @ModelAttribute UserDTO dto) {
		
		String userid = dto.getUserid();
		String pwd = dto.getPwd();
		
		if(userService.idCheck(userid)) {	//아이디 검사
			//아이디 있음
			
			if(userService.pwdCheck(userid, pwd)) {	//비밀번호 검사
				//비밀번호 맞음
				
				mav.setViewName("index");
				session.setAttribute("user", userService.viewUser(userid));
				
			} else {	//비밀번호 틀림
				
				mav.setViewName("user/login");
				mav.addObject("message1", "비밀번호가 다릅니다.");
				mav.addObject("message2", "확인하고 다시 로그인해주세요!");
				
			}
			
		} else {	//아이디 없음
			
			mav.setViewName("user/login");
			mav.addObject("message1", "아이디가 없습니다.");
			mav.addObject("message2", "확인하고 다시 로그인해주세요!");
			
		}
		
		return mav;
	}
	
	@RequestMapping("logout.do")
	public String logoutdo(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/user/login.go?message1='로그아웃되었습니다.'";
	}
	
	
}
