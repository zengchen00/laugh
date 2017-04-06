package cn.zc.first.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.zc.first.po.Article;
import cn.zc.first.service.ArticleService;

@Controller
@RequestMapping("/foreground")
public class IndexController {
	
	@Autowired
	private ArticleService articleServiceImpl;
	
	@RequestMapping("/index")
	public ModelAndView addGif() throws Exception {
		ModelAndView mv = new ModelAndView("foreground/index");
		List<Article> articles = articleServiceImpl.selectForIndex();
		mv.addObject("articles",articles);
		mv.addObject("cur","1");
		return mv;

	}
	
	@RequestMapping("/index2")
	public ModelAndView index2() throws Exception {
		ModelAndView mv = new ModelAndView("foreground/index2");
		return mv;

	}
	
	@RequestMapping("/gifIndex2")
	public ModelAndView gifIndex2() throws Exception {
		ModelAndView mv = new ModelAndView("foreground/gifIndex2");
		return mv;

	}
	
//	@RequestMapping("/jokeIndex")
//	public ModelAndView jokeIndex() throws Exception {
//		ModelAndView mv = new ModelAndView("foreground/jokeIndex");
//		return mv;
//
//	}
	
	@RequestMapping("/gifDetail2")
	public ModelAndView gifDetail2() throws Exception {
		ModelAndView mv = new ModelAndView("foreground/gifDetail2");
		return mv;

	}
	
//	@RequestMapping("/jokeDetail")
//	public ModelAndView jokeDetail() throws Exception {
//		ModelAndView mv = new ModelAndView("foreground/jokeDetail");
//		return mv;
//
//	}
	
	@RequestMapping("/mobile")
	public String mobile() throws Exception {
		return "foreground/mobile";

	}
	
}
