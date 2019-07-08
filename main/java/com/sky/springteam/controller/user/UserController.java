package com.sky.springteam.controller.user;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String logingo(@RequestParam(defaultValue="") String message1, 
						@RequestParam(defaultValue="") String message2, Model model) {
		model.addAttribute("message1", message1);
		model.addAttribute("message2", message2);
		
		return "user/login";
	}
	
	@RequestMapping("finduser.go")
	public String findusergo() {
		return "user/finduser";
	}
	
	@RequestMapping("finduser2.go")
	public String finduser2go() {
		return "user/finduser2";
	}
	
	@RequestMapping("signup.go")
	public String signupgo() {
		return "user/signup1";
	}
	
	@RequestMapping("signup2.go")
	public String signup2go() {
		return "user/signup2";
	}
	
	@RequestMapping("signup3.go")
	public String signup3go() {
		return "user/signup3";
	}
	
	@RequestMapping("pwdcheck.go")
	public String pwdcheckgo(@RequestParam(defaultValue="") String message, Model model) {
		model.addAttribute("message", message);
		
		return "user/pwdcheck";
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
	public String logoutdo(HttpSession session, Model model) {
		
		session.invalidate();
		model.addAttribute("message1", "로그아웃 되었습니다.");
		return "/user/login";
	}
	
	
	@RequestMapping("signup1.do")
	public ModelAndView signup1do (@ModelAttribute UserDTO dto, ModelAndView mav) {
		
		if(userService.idCheck(dto.getUserid())) {
			//아이디 중복
			
			mav.setViewName("user/signup1");
			mav.addObject("hasUserid", "이미 가입된 아이디입니다.");
			if(userService.emailCheck(dto.getEmail())){
				mav.addObject("hasEmail", "이미 가입된 이메일입니다.");
			}
		} else {
			//아이디 중복 아님
			if(userService.emailCheck(dto.getEmail())){
				mav.setViewName("user/signup1");
				mav.addObject("hasEmail", "이미 가입된 이메일입니다.");
			} else {
				//아이디, 이메일 중복 아님
				mav.setViewName("user/signup2");
				mav.addObject("userid", dto.getUserid());
				mav.addObject("email", dto.getEmail());
			}
			
		}
		
		return mav;
	}
	
	@RequestMapping("signup2.do")
	public ModelAndView signup2do (@ModelAttribute UserDTO dto, ModelAndView mav) {
		
		userService.insertUser(dto);
		mav.setViewName("user/signup3");
		mav.addObject("userid", dto.getUserid());
		
		return mav;
	}
	
	@RequestMapping("finduser.do")
	public ModelAndView finduser(@ModelAttribute UserDTO dto, ModelAndView mav) {
		
		dto = userService.findUser(dto.getEmail(), dto.getName());
		
		if(dto.getUserid().equals("아이디, 비밀번호 찾기에 실패하였습니다. 이메일, 이름을 확인하세요!")) {
			mav.setViewName("user/finduser");
			mav.addObject("cantfind", dto.getUserid());
			mav.addObject("email", dto.getEmail());
			mav.addObject("name", dto.getName());
			
		} else {
			mav.setViewName("user/finduser2");
			mav.addObject("userid", dto.getUserid());
			mav.addObject("pwd", dto.getPwd());
			
		}
		return mav;
	}
	
	@RequestMapping("pwdcheck.do")
	public ModelAndView pwdcheckdo(@ModelAttribute UserDTO dto, ModelAndView mav) {
		
		if(userService.pwdCheck(dto.getUserid(), dto.getPwd())) {
			//비밀번호 맞음
			mav.setViewName("user/updateuser");
			
		} else {
			mav.setViewName("user/pwdcheck");
			mav.addObject("message", "비밀번호가 다릅니다!");
		}
		
		return mav;
	}
	
	@RequestMapping("updateuser.do")
	public void updateuserdo(@ModelAttribute UserDTO dto, Model model, HttpSession session) {
		
		userService.updateUser(dto);
		
		logoutdo(session, model);
	}
	
	@RequestMapping("deleteuser.do")
	public void deleteuserdo(@ModelAttribute UserDTO dto, Model model, HttpSession session) {
		
		userService.deleteUser(dto.getUserid());
		
		logoutdo(session, model);
	}
	
	
}
