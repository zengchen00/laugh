package cn.zc.first.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.zc.first.common.CommonFunctions;
import cn.zc.first.common.MyConstants;
import cn.zc.first.common.Page;
import cn.zc.first.po.Article;
import cn.zc.first.po.ArticleVo;
import cn.zc.first.service.ArticleService;

@Controller
@RequestMapping("/foreground")
public class GifController2 {
	
	@Autowired
	private ArticleService articleServiceImpl;
	
	@Autowired
	private CommonFunctions commonFunctions;
	
	
	@Autowired
	private Page page;
	
	@RequestMapping("/gif")
	public ModelAndView gif() throws Exception {
		ModelAndView mv = new ModelAndView("foreground/gifIndex");
		int totalRecord = articleServiceImpl.selectTotal(MyConstants.ARTICLE_STATE_ONLINE);
		page.setTotalRecord(totalRecord);
		page.setNumPerPage(MyConstants.GIF_NUM_PER);
		page.setCurrPage(1);
		page.init();
		
		ArticleVo av = new ArticleVo();
		av.setState(MyConstants.ARTICLE_STATE_ONLINE);
		av.setFromLimit(page.getStartPage());
		av.setEndLimit(page.getNumPerPage());
		av.setOrderBy("INDEXNUM");
		av.setOrderType("desc");
		List<Article> articles = articleServiceImpl.selectCurrPage(av);
		
		av = new ArticleVo();
		av.setState(MyConstants.ARTICLE_STATE_ONLINE);
		av.setFromLimit(0);
		av.setEndLimit(MyConstants.ARTICLE_RINGKING);
		av.setOrderBy("OPEN");
		av.setOrderType("desc");
		List<Article> articleRanking = articleServiceImpl.selectCurrPage(av);
		List<Article> openRanking = new ArrayList<Article>();
		for (Article article : articleRanking) {
			article.setCreateDateStr(commonFunctions.DateToStr(article.getCreateDate(), "yyyy-MM-dd"));
			openRanking.add(article);
		}
		
		mv.addObject("page",page);
		mv.addObject("articles",articles);
		mv.addObject("articleRanking",openRanking);
		mv.addObject("cur","2");
		return mv;
	}
	
	@RequestMapping("/queryCurrPage")
	@ResponseBody
	public String queryCurrPage(HttpServletRequest request,@RequestBody Map<String, String> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(map.containsKey("cp")){
			int currPageNum=Integer.parseInt(map.get("cp"));
			int totalRecord = articleServiceImpl.selectTotal(MyConstants.ARTICLE_STATE_ONLINE);
			page.setTotalRecord(totalRecord);
			page.setNumPerPage(MyConstants.GIF_NUM_PER);
			page.setCurrPage(currPageNum);
			page.init();
			
			ArticleVo av = new ArticleVo();
			av.setState(MyConstants.ARTICLE_STATE_ONLINE);
			av.setOrderBy("INDEXNUM");
			av.setOrderType("desc");
			av.setFromLimit(page.getStartPage());
			av.setEndLimit(page.getNumPerPage());
			List<Article> articles = articleServiceImpl.selectCurrPage(av);
			resultMap.put("page", page);
			resultMap.put("articles", articles);
			JSONObject  json = JSONObject .fromObject(resultMap);
			return  json.toString();
		}
		return  null;
	}
	
}
