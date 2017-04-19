package cn.zc.first.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.zc.first.common.MyConstants;
import cn.zc.first.common.Page;
import cn.zc.first.po.Article;
import cn.zc.first.po.ArticleVo;
import cn.zc.first.po.Joke;
import cn.zc.first.po.JokeVo;
import cn.zc.first.service.ArticleService;
import cn.zc.first.service.JokeService;

@Controller
@RequestMapping("/foreground")
public class IndexController {
	
	@Autowired
	private ArticleService articleServiceImpl;
	
	@Autowired
	private JokeService jokeService;
	
	@RequestMapping("/index")
	public ModelAndView addGif() throws Exception {
		ModelAndView mv = new ModelAndView("foreground/index");
		//查gif最新 4 期
		Page page = new Page();
		page.setNumPerPage(MyConstants.INDEX_GIF_NUM);
		page.setStartPage(0);
		ArticleVo av = new ArticleVo();
		av.setState(MyConstants.ARTICLE_STATE_ONLINE);
		av.setPage(page);
		av.setOrderBy("periods");
		av.setOrderType("desc");
		List<Article> articles = articleServiceImpl.selectCurrPage(av);
		//查joke最新 2 期
		JokeVo jokeVo = new JokeVo();
		jokeVo.setState(MyConstants.JOKE_STATE_ONLINE);
		jokeVo.setOrderBy("periods");
		jokeVo.setOrderType("desc");
		page.setNumPerPage(MyConstants.INDEX_JOKE_NUM);
		jokeVo.setPage(page);
		List<Joke> jokes = jokeService.selectCurrPage(jokeVo);
		
		mv.addObject("cur","1");
		mv.addObject("articles",articles);
		mv.addObject("jokes",jokes);
		return mv;

	}
	
	@RequestMapping("/index2")
	public ModelAndView index2() throws Exception {
		ModelAndView mv = new ModelAndView("foreground/index2");
		return mv;

	}
	
	@RequestMapping("/aboutUs")
	public ModelAndView aboutUs() throws Exception {
		ModelAndView mv = new ModelAndView("foreground/aboutUs");
		mv.addObject("cur","4");
		return mv;

	}
	
	@RequestMapping("/mobile")
	public String mobile() throws Exception {
		return "foreground/mobile";

	}
	
}
