package cn.zc.first.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import cn.zc.first.common.CommonFunctions;
import cn.zc.first.common.MyConstants;
import cn.zc.first.po.Article;
import cn.zc.first.po.ArticleDetail;
import cn.zc.first.po.ArticleVo;
import cn.zc.first.po.User;
import cn.zc.first.service.ArticleDetailService;
import cn.zc.first.service.ArticleService;

@Controller
@RequestMapping("/background")
public class GifController {
	
	@Autowired
	private ArticleService articleServiceImpl;
	
	@Autowired
	private ArticleDetailService articleDetailServiceImpl;
	
	@Autowired
	private CommonFunctions commonFunctions;
	
	@RequestMapping("/addGif")
	public String addGif() throws Exception {
		return "background/gif/addGif";

	}
	
	@RequestMapping("/readyGif")
	public ModelAndView readyGif() throws Exception {
		ModelAndView mv = new ModelAndView("background/gif/readyGif");
		List<Article> articles = articleServiceImpl.selectArticleByStatus(MyConstants.ARTICLE_STATE_READY);
		mv.addObject("articles", articles);
		return mv;
	}
	
	@RequestMapping("/onlineGif")
	public ModelAndView onlineGif() throws Exception {
		ModelAndView mv = new ModelAndView("background/gif/onlineGif");
		List<Article> articles = articleServiceImpl.selectArticleByStatus(MyConstants.ARTICLE_STATE_ONLINE);
		mv.addObject("articles", articles);
		return mv;
	}
	
	@RequestMapping("/deleteGif")
	public ModelAndView deleteGif() throws Exception {
		ModelAndView mv = new ModelAndView("background/gif/deleteGif");
		List<Article> articles = articleServiceImpl.selectArticleByStatus(MyConstants.ARTICLE_STATE_DELETE);
		mv.addObject("articles", articles);
		return mv;
	}
	
	/**
	 * 下线gif文章
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/downArticle")
	@ResponseBody
	public String downArticle(HttpServletRequest request,@RequestBody Map<String, String> map) throws Exception {
		if(map.containsKey("articleId")){
			int articleId=Integer.parseInt(map.get("articleId"));
			User currentUser = (User) request.getSession().getAttribute("currentUser");
			ArticleVo avo = new ArticleVo(articleId,MyConstants.ARTICLE_STATE_READY,currentUser.getName(),new Date());
			articleServiceImpl.updateById(avo);
			return  "0000";
		}
		return  "0001";
	}
	
	/**
	 * 逻辑删除gif文章
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteArticle")
	@ResponseBody
	public String deleteArticle(HttpServletRequest request,@RequestBody Map<String, String> map) throws Exception {
		if(map.containsKey("articleId")){
			int articleId=Integer.parseInt(map.get("articleId"));
			User currentUser = (User) request.getSession().getAttribute("currentUser");
			ArticleVo avo = new ArticleVo(articleId,MyConstants.ARTICLE_STATE_DELETE,currentUser.getName(),new Date());
			articleServiceImpl.updateById(avo);
			return  "0000";
		}
		return  "0001";
	}
	
	/**
	 * 上线gif文章
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/onlineArticle")
	@ResponseBody
	public String onlineArticle(HttpServletRequest request,@RequestBody Map<String, String> map) throws Exception {
		if(map.containsKey("articleId")){
			int articleId=Integer.parseInt(map.get("articleId"));
			User currentUser = (User) request.getSession().getAttribute("currentUser");
			ArticleVo avo = new ArticleVo(articleId,MyConstants.ARTICLE_STATE_ONLINE,currentUser.getName(),new Date());
			articleServiceImpl.updateById(avo);
			return  "0000";
		}
		return  "0001";
	}
	
	/**
	 * 上传gif图片
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/doAddGifs", method=RequestMethod.POST)
    public ModelAndView uploadFiles(HttpServletRequest request, HttpServletResponse response) throws Exception {  
        ModelAndView mav = new ModelAndView("success");  
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
        MultiValueMap<String, MultipartFile> multiValueMap = multipartRequest.getMultiFileMap();  
        List<MultipartFile> file = multiValueMap.get("clientFile");
        Map<String, String[]> map =  multipartRequest.getParameterMap();
        String[] descs = (String[]) map.get("fileDes");//每张图片的描述文字
        
        if(file.size()>0 && (descs.length ==file.size())){
        	User currentUser = (User) request.getSession().getAttribute("currentUser");
        	//保存gif文章
        	MultipartFile multipartFile = file.get(0);
        	String filePath = SaveFileFromInputStream(multipartFile,multipartFile.getInputStream(),multipartFile.getOriginalFilename());//封面图片
        	String fileDesc = descs[0];//封面图片描述
        	Article article = saveGifArticle(currentUser,filePath,fileDesc);
        	
        	//保存gif文章详情数据
        	for (int i = 0; i < file.size(); i++) {
        		MultipartFile multipartFileEach = file.get(i);
        		try {
        			//上传文件到服务器并返回文件全路径
					String filePathEach = SaveFileFromInputStream(multipartFileEach,multipartFileEach.getInputStream(),multipartFileEach.getOriginalFilename());
					String fileDescEach = descs[i];//图片描述
					saveGifArticleDetail(article,filePathEach,fileDescEach);
					
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
        }else{
        	mav.setViewName("error");
        }
        return mav;  
    }

	/**
	 * 创建gif文章详情
	 * @param id
	 * @param filePath
	 * @param fileDesc
	 */
	private void saveGifArticleDetail(Article article, String filePath, String fileDesc) {
		ArticleDetail articleDetail = new ArticleDetail(article,fileDesc,filePath);
		articleDetailServiceImpl.insert(articleDetail);
	}

	/**
	 * 创建gif文章
	 * @param currentUser
	 * @param filePath
	 * @param fileDesc
	 * @return
	 */
	private Article saveGifArticle(User currentUser, String filePath, String fileDesc) {
		Article article = new Article();
		article.setType(1);
		article.setCreateDate(new Date());
		article.setModifyDate(new Date());
		article.setDescription(fileDesc);
		article.setImgUrl(filePath);
		article.setState(1);
		article.setUserName(currentUser.getName());
		articleServiceImpl.insert(article);
		return article;
		
	}

	/**
	 * 上传图片到服务器
	 * @param multipartFile
	 * @param stream
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public String SaveFileFromInputStream(MultipartFile multipartFile ,InputStream stream,String fileName) throws IOException{      
	       String path = MyConstants.GIF_SERVER_PATH + File.separator 
	    		   + commonFunctions.getCurrentTimeStr() + "_" + fileName;
	       File newImage = new File(path);
	       multipartFile.transferTo(newImage);
	       return path;
	}       
}
