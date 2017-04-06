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
import cn.zc.first.po.Joke;
import cn.zc.first.po.JokeVo;
import cn.zc.first.service.JokeService;

@Controller
@RequestMapping("/foreground")
public class JokeController2 extends BaseController{
	
	@Autowired
	private JokeService jokeService;
	
	/**
	 * 笑话首页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/jokeIndex" ,produces = "text/html;charset=UTF-8")
	public ModelAndView jokeIndex() throws Exception {
		ModelAndView mv = new ModelAndView("foreground/jokeIndex");
		//查询最新5期笑话
		JokeVo jokeVo = new JokeVo();
		jokeVo.setState(MyConstants.JOKE_STATE_ONLINE);
		jokeVo.setOrderBy("periods");
		jokeVo.setOrderType("desc");
		Page page = new Page();
		page.setStartPage(0);
		page.setNumPerPage(MyConstants.JOKE_INDEX_NUM);
		jokeVo.setPage(page);
		List<Joke> jokes = jokeService.selectCurrPage(jokeVo);
		
		
		mv.addObject("page",page);
		mv.addObject("jokes",jokes);
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
		JokeVo jokeVo = new JokeVo();
		jokeVo.setId(Integer.parseInt(id));
		Joke joke = jokeService.queryJokeById(jokeVo);
		mv.addObject("cur","3");
		mv.addObject("joke",joke);
		return mv;
	}
	
}
