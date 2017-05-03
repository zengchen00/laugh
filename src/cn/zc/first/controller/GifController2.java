package cn.zc.first.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang.NumberUtils;
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
import cn.zc.first.po.ArticleDetail;
import cn.zc.first.po.ArticleDetailVo;
import cn.zc.first.po.ArticleVo;
import cn.zc.first.service.ArticleDetailService;
import cn.zc.first.service.ArticleService;
import cn.zc.first.service.CommentService;

@Controller
@RequestMapping("/foreground")
public class GifController2 {
	
	@Autowired
	private ArticleService articleServiceImpl;
	
	@Autowired
	private ArticleDetailService articleDetailServiceImpl;
	
	@Autowired
	private CommonFunctions commonFunctions;
	
	@Autowired
	private CommentService commentService;
	
	
	@RequestMapping(value="/getGif" ,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getGif(HttpServletRequest request,@RequestBody Map<String, String> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(map.containsKey("id")){
			int id=Integer.parseInt(map.get("id"));
			ArticleDetail articleDetail = articleDetailServiceImpl.selectById(id);
			resultMap.put("url", articleDetail.getImg_url());
			JSONObject  json = JSONObject .fromObject(resultMap);
			return  json.toString();
		}
		return  null;
	}
	
	@RequestMapping("/gifIndex")
	public ModelAndView gifIndex(String pageNum) throws Exception {
		if(pageNum == null || !NumberUtils.isNumber(pageNum)){
			pageNum="1";
		}
		ModelAndView mv = new ModelAndView("foreground/gifIndex");
		//查最新6期
		Page page = new Page();
		int totalRecord = articleServiceImpl.selectTotal(MyConstants.ARTICLE_STATE_ONLINE);
		page.setTotalRecord(totalRecord);
		page.setNumPerPage(MyConstants.GIF_NUM_PER);
		page.setCurrPage(Integer.parseInt(pageNum));
		page.init();
		
		ArticleVo av = new ArticleVo();
		av.setState(MyConstants.ARTICLE_STATE_ONLINE);
		av.setPage(page);
		av.setOrderBy("periods");
		av.setOrderType("desc");
		List<Article> articles = articleServiceImpl.selectCurrPage(av);
		
		av = new ArticleVo();
		av.setState(MyConstants.ARTICLE_STATE_ONLINE);
		av.setOrderBy("open");
		av.setOrderType("desc");
		page.setNumPerPage(MyConstants.ARTICLE_RINGKING);
		page.setStartPage(0);
		av.setPage(page);
		List<Article> articleRanking = articleServiceImpl.selectCurrPage(av);
		
		mv.addObject("page",page);
		mv.addObject("articles",articles);
		mv.addObject("articleRanking",articleRanking);
		mv.addObject("cur","2");
		return mv;
	}
	
	@RequestMapping("/gifDetail")
	public ModelAndView gifDetail(HttpServletRequest request,
			String id) throws Exception {
		ModelAndView mv = new ModelAndView("foreground/gifDetail");
		if(id == null || !NumberUtils.isNumber(id)){
			mv.setViewName("redirect:/foreground/gifIndex");
			return mv;
		}
		Page page = new Page();
		Article article = articleServiceImpl.selectArticleById(Integer.valueOf(id));
		if(article == null){
			mv.setViewName("redirect:/foreground/gifIndex");
			return mv;
		}
		//查询详情
		int totalRecord = article.getArticleDetails().size();
		page.setTotalRecord(totalRecord);
		page.setNumPerPage(MyConstants.GIF_DETAIL_PER);
		page.setCurrPage(1);
		page.init();
		ArticleDetailVo av = new ArticleDetailVo();
		av.setArticleId(Integer.parseInt(id));
		av.setPage(page);
		List<ArticleDetail> articleDetails = articleDetailServiceImpl.selectCurrPage(av);
		// 更新查看次数
		ArticleVo articleVo = new ArticleVo();
		articleVo.setId(Integer.valueOf(id));
		articleVo.setOpen(article.getOpen() + 1);
		articleServiceImpl.updateArticleOpens(articleVo);

		// 查出热情推荐
		articleVo = new ArticleVo();
		articleVo.setState(MyConstants.ARTICLE_STATE_ONLINE);
		articleVo.setOrderBy("open");
		articleVo.setOrderType("asc");
		page.setNumPerPage(MyConstants.GIF_DETAIL_SHOW);
		page.setStartPage(0);
		articleVo.setPage(page);
		List<Article> articleRanking = articleServiceImpl.selectCurrPage(articleVo);

		//向页面传值
		mv.addObject("page",page);
		mv.addObject("articleId",id);
		mv.addObject("cur","2");
		mv.addObject("articleDetails",articleDetails);
		mv.addObject("articleRanking",articleRanking);
		return mv;
	}
	
	@RequestMapping(value="/queryDetailPage" ,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String queryDetailPage(HttpServletRequest request,@RequestBody Map<String, String> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(map.containsKey("pageNum")){
			int currPageNum=Integer.parseInt(map.get("pageNum"));
			int articleId = Integer.parseInt(map.get("articleId"));
			int totalRecord = articleDetailServiceImpl.countNum(articleId);
			Page page = new Page();
			page.setTotalRecord(totalRecord);
			page.setNumPerPage(MyConstants.GIF_DETAIL_PER);
			page.setCurrPage(currPageNum);
			page.init();
			
			ArticleDetailVo av = new ArticleDetailVo();
			av.setArticleId(articleId);
			av.setPage(page);
			
			List<ArticleDetail> articleDetails = articleDetailServiceImpl.selectCurrPage(av);
			resultMap.put("page", page);
//			resultMap.put("numPerPage", MyConstants.GIF_DETAIL_PER);
			resultMap.put("articleDetails", articleDetails);
			JSONObject  json = JSONObject .fromObject(resultMap);
			return  json.toString();
		}
		return  null;
	}
	
}
