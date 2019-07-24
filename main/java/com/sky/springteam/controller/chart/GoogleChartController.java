package com.sky.springteam.controller.chart;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.sky.springteam.service.chart.GoogleChartService;

@RestController //ajax => json으로 리턴 (스프링4.0부터 지원)
//만약 Controller로 하게되면 메소드에 @ResponseBody를 써야 json으로 리턴
@RequestMapping("chart/*") //공통 url mapping
public class GoogleChartController {
	
	@Inject
	GoogleChartService googleChartService;
	
	@RequestMapping("chart02.do")
	public ModelAndView chart2() {
		return new ModelAndView("chart/skychart");
	}
	
	@RequestMapping("cart_money_list.do")
	public JSONObject cart_money_list() {
		return googleChartService.getChartData();
	}


}
