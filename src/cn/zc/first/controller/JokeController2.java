package cn.zc.first.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.NumberUtils;
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
public class JokeController2 extends BaseController{
	
	@Autowired
	private JokeService jokeService;
	
	@Autowired
	private ArticleService articleServiceImpl;
	
	/**
	 * 笑话首页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/jokeIndex" ,produces = "text/html;charset=UTF-8")
	public ModelAndView jokeIndex(String pageNum) throws Exception {
		if(pageNum == null || !NumberUtils.isNumber(pageNum)){
			pageNum="1";
		}
		ModelAndView mv = new ModelAndView("foreground/jokeIndex");
		int total = jokeService.countNum(MyConstants.JOKE_STATE_ONLINE);
		//查询最新5期笑话
		JokeVo jokeVo = new JokeVo();
		jokeVo.setState(MyConstants.JOKE_STATE_ONLINE);
		jokeVo.setOrderBy("periods");
		jokeVo.setOrderType("desc");
		Page page = new Page();
		page.setTotalRecord(total);
		page.setCurrPage(Integer.parseInt(pageNum));
		page.setNumPerPage(MyConstants.JOKE_INDEX_NUM);
		page.init();
		jokeVo.setPage(page);
		List<Joke> jokes = jokeService.selectCurrPage(jokeVo);
		//点击排行榜
		jokeVo.setOrderBy("open");
		jokeVo.setOrderType("desc");
		page.setNumPerPage(MyConstants.JOKE_RINGKING);
		page.setStartPage(0);
		jokeVo.setPage(page);
		List<Joke> jokeRank = jokeService.selectCurrPage(jokeVo);
		
		mv.addObject("page",page);
		mv.addObject("jokes",jokes);
		mv.addObject("jokeRank",jokeRank);
		mv.addObject("cur","3");
		return mv;
	}
	
	@RequestMapping("/jokeDetail")
	public ModelAndView jokeDetail(HttpServletRequest request,
			String id) throws Exception {
		ModelAndView mv = new ModelAndView("foreground/jokeDetail");
		if(id == null || !NumberUtils.isNumber(id)){
			mv.setViewName("redirect:/foreground/jokeIndex");
			return mv;
		}
		//本篇
		JokeVo jokeVo = new JokeVo();
		jokeVo.setId(Integer.parseInt(id));
		Joke joke = jokeService.queryJokeById(jokeVo);
		//本篇阅读次数+1
		jokeVo.setOpen(joke.getOpen() + 1);
		jokeService.updateOpen(jokeVo);
		//上一篇
		int prePeriod = joke.getPeriods() - 1;
		JokeVo jokeVo1 = new JokeVo();
		jokeVo1.setPeriods(prePeriod);
		jokeVo1.setState(MyConstants.JOKE_STATE_ONLINE);
		Joke jokePre = jokeService.selectPreSuf(jokeVo1);
		//下一篇
		int sufPeriod = joke.getPeriods() + 1;
		JokeVo jokeVo2 = new JokeVo();
		jokeVo2.setPeriods(sufPeriod);
		jokeVo2.setState(MyConstants.JOKE_STATE_ONLINE);
		Joke jokeSuf = jokeService.selectPreSuf(jokeVo2);
		//查gif最新 4 期
		Page page = new Page();
		page.setNumPerPage(MyConstants.JOKE_DETAIL_GIF);
		page.setStartPage(0);
		ArticleVo av = new ArticleVo();
		av.setState(MyConstants.ARTICLE_STATE_ONLINE);
		av.setPage(page);
		av.setOrderBy("open");
		av.setOrderType("desc");
		List<Article> articles = articleServiceImpl.selectCurrPage(av);
				
		mv.addObject("jokeSuf",jokeSuf);
		mv.addObject("jokePre",jokePre);
		mv.addObject("cur","3");
		mv.addObject("joke",joke);
		mv.addObject("articles",articles);
		return mv;
	}
	
}
