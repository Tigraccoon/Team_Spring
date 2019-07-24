package com.sky.springteam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class instructorController {

	@RequestMapping(value = "/instructor.do")
	/* method = RequestMethod.GET */
	public ModelAndView instructorView(ModelAndView mv) throws Exception {
		mv.setViewName("instructor/instructor");
		return mv;
	}
}
