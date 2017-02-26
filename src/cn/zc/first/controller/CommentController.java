package cn.zc.first.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zc.first.common.MyConstants;
import cn.zc.first.common.Page;
import cn.zc.first.po.ArticleDetail;
import cn.zc.first.po.ArticleDetailVo;
import cn.zc.first.po.Comment;
import cn.zc.first.po.CommentVo;
import cn.zc.first.service.CommentService;

@Controller
@RequestMapping("/foreground")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	Map<String,Object> map = new HashMap<String,Object>(); 
	
	@RequestMapping(value="/commentSave",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String commentSave(HttpServletRequest request,HttpServletResponse response,String content,String articleId) throws Exception {
         /*设置字符集为'UTF-8'*/
        response.setCharacterEncoding("UTF-8"); 
		String userIP=request.getRemoteAddr();
		Comment comment = new Comment();
		comment.setUserComment(content);
		comment.setArticleId(articleId);
		comment.setGuestIp(userIP);
		comment.setCreateDate(new Date());
		commentService.insert(comment);
		List<Comment> comments = commentService.selectByArtId(articleId);
		
		map.put("success", true);
		map.put("comments", comments);
		JSONArray json = JSONArray.fromObject(map); 
		return json.toString();
	}
	
	@RequestMapping(value="/queryCommentPage",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String queryDetailPage(HttpServletRequest request,@RequestBody Map<String, String> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(map.containsKey("pageNum")){
			int currPageNum=Integer.parseInt(map.get("pageNum"));
			int articleId = Integer.parseInt(map.get("articleId"));
			int totalRecord = commentService.countNum(articleId);
			Page page = new Page();
			page.setTotalRecord(totalRecord);
			page.setNumPerPage(8);
			page.setCurrPage(currPageNum);
			page.init();
			
			CommentVo av1 = new CommentVo();
			av1.setArticleId(map.get("articleId"));
			av1.setPage(page);
			List<Comment> commentList = commentService.selectCurrPage(av1);
			
			resultMap.put("page", page);
			resultMap.put("comments", commentList);
			JSONObject  json = JSONObject .fromObject(resultMap);
			return  json.toString();
		}
		return  null;
	}
}
