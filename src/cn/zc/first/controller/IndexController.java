package cn.zc.first.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.zc.first.common.CommonFunctions;

@Controller
@RequestMapping("/foreground")
public class IndexController {
	
	@Autowired
	private CommonFunctions commonFunctions;
	
	@RequestMapping("/index")
	public String addGif() throws Exception {
		return "foreground/index";

	}
	
	@RequestMapping("/mobile")
	public String mobile() throws Exception {
		return "foreground/mobile";

	}
	
}
