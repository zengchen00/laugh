package cn.zc.first.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.zc.first.common.CommonFunctions;
import cn.zc.first.service.ArticleDetailService;
import cn.zc.first.service.ArticleService;

@Controller
@RequestMapping("/foreground")
public class GifController2 {
	
	@Autowired
	private ArticleService articleServiceImpl;
	
	@Autowired
	private ArticleDetailService articleDetailServiceImpl;
	
	@Autowired
	private CommonFunctions commonFunctions;
	
	@RequestMapping("/gif")
	public String gif() throws Exception {
		return "foreground/gifIndex";

	}
	
}
