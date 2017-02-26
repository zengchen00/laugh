package cn.zc.first.controller;

import java.util.ArrayList;
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
import cn.zc.first.po.Comment;
import cn.zc.first.po.CommentVo;
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
	
	@RequestMapping(value="/queryCurrPage",produces = "text/html;charset=UTF-8")
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
	
	@RequestMapping("/gifDetail")
	public ModelAndView gifDetail(HttpServletRequest request,
			String id) throws Exception {
		ModelAndView mv = new ModelAndView("foreground/gifDetail");
		if(id == null || !NumberUtils.isNumber(id)){
			mv.setViewName("redirect:/foreground/gif");
			return mv;
		}
		
		Article article = articleServiceImpl.selectArticleById(Integer.valueOf(id));
		if(article == null){
			mv.setViewName("redirect:/foreground/gif");
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
		
		//查询评论
		int totalRecord1 = commentService.countNum(Integer.valueOf(id));
		Page commentPage = new Page();
		commentPage.setTotalRecord(totalRecord1);
		commentPage.setNumPerPage(8);
		commentPage.setCurrPage(1);
		commentPage.init();
		CommentVo av1 = new CommentVo();
		av1.setArticleId(id);
		av1.setPage(commentPage);
		List<Comment> commentList = commentService.selectCurrPage(av1);
		
		//更新查看次数
		ArticleVo articleVo = new ArticleVo();
		articleVo.setId(Integer.valueOf(id));
		articleVo.setOpen(article.getOpen()+1);
		articleServiceImpl.updateArticleOpens(articleVo);
		
		//向页面传值
		mv.addObject("page",page);
		mv.addObject("commentPage",commentPage);
		mv.addObject("articleId",id);
		mv.addObject("cur","2");
		mv.addObject("commentList",commentList);
		mv.addObject("articleDetails",articleDetails);
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
