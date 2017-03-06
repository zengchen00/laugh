package cn.zc.first.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.zc.first.common.CommonFunctions;

@Controller
@RequestMapping("/background")
public class JokeController {
	
	@Autowired
	private CommonFunctions commonFunctions;
	
	@RequestMapping("/addJoke")
	public ModelAndView addGif() throws Exception {
		ModelAndView mv = new ModelAndView("background/joke/addJoke");
		mv.addObject("cur","9");
		return mv;
	}
	
	
}
