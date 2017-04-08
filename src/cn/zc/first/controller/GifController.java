package cn.zc.first.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import cn.zc.first.common.CommonFunctions;
import cn.zc.first.common.MyConstants;
import cn.zc.first.common.Page;
import cn.zc.first.common.PropertiesUtil;
import cn.zc.first.po.Article;
import cn.zc.first.po.ArticleDetail;
import cn.zc.first.po.ArticleVo;
import cn.zc.first.po.Joke;
import cn.zc.first.po.JokeVo;
import cn.zc.first.po.User;
import cn.zc.first.service.ArticleDetailService;
import cn.zc.first.service.ArticleService;

@Controller
@RequestMapping("/background")
public class GifController extends BaseController{
	
	private SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@Autowired
	private ArticleService articleServiceImpl;
	
	@Autowired
	private ArticleDetailService articleDetailServiceImpl;
	
	@Autowired
	private CommonFunctions commonFunctions;
	
	@RequestMapping("/addGif")
	public ModelAndView addGif() throws Exception {
		ModelAndView mv = new ModelAndView("background/gif/addGif");
		mv.addObject("cur","1");
		return mv;
	}
	
	@RequestMapping("/readyGif")
	public ModelAndView readyGif() throws Exception {
		ModelAndView mv = new ModelAndView("background/gif/readyGif");
		mv.addObject("cur","2");
		return mv;
	}
	
	@RequestMapping(value="/getReadyGif" ,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getReadyGif(@RequestParam("rows") String rows,
			@RequestParam("page") String page,@RequestParam("sidx") 
			String sidx,@RequestParam("sord") String sord) throws Exception {
		int oneRecord = Integer.valueOf(rows);
		int pageNo = Integer.valueOf(page);
		Page pageUtil = new Page();
		int totalRecord = articleServiceImpl.selectTotal(MyConstants.ARTICLE_STATE_READY);
		pageUtil.setTotalRecord(totalRecord);
		pageUtil.setNumPerPage(oneRecord);
		pageUtil.setCurrPage(pageNo);
		pageUtil.init();
		ArticleVo av = new ArticleVo();
		av.setOrderBy(sidx);
		av.setOrderType(sord);
		av.setPage(pageUtil);
		av.setState(MyConstants.ARTICLE_STATE_READY);
		List<Article> articles = articleServiceImpl.selectCurrPage(av);
		resultMap.put("rows", articles);
		resultMap.put("total", pageUtil.getTotalPage());
		resultMap.put("records", totalRecord);
		JSONObject  json = JSONObject .fromObject(resultMap);
		return  json.toString();
	}
	
	@RequestMapping("/onlineGif")
	public ModelAndView onlineGif() throws Exception {
		ModelAndView mv = new ModelAndView("background/gif/onlineGif");
		List<Article> articles = articleServiceImpl.selectArticleByStatus(MyConstants.ARTICLE_STATE_ONLINE);
		mv.addObject("articles", articles);
		mv.addObject("cur","3");
		return mv;
	}
	
	@RequestMapping(value="/getOnGif" ,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getOnGif(@RequestParam("rows") String rows,
			@RequestParam("page") String page,@RequestParam("sidx") 
			String sidx,@RequestParam("sord") String sord) throws Exception {
		int oneRecord = Integer.valueOf(rows);
		int pageNo = Integer.valueOf(page);
		Page pageUtil = new Page();
		int totalRecord = articleServiceImpl.selectTotal(MyConstants.ARTICLE_STATE_ONLINE);
		pageUtil.setTotalRecord(totalRecord);
		pageUtil.setNumPerPage(oneRecord);
		pageUtil.setCurrPage(pageNo);
		pageUtil.init();
		ArticleVo av = new ArticleVo();
		av.setOrderBy(sidx);
		av.setOrderType(sord);
		av.setPage(pageUtil);
		av.setState(MyConstants.ARTICLE_STATE_ONLINE);
		List<Article> articles = articleServiceImpl.selectCurrPage(av);
		resultMap.put("rows", articles);
		resultMap.put("total", pageUtil.getTotalPage());
		resultMap.put("records", totalRecord);
		JSONObject  json = JSONObject .fromObject(resultMap);
		return  json.toString();
	}
	
	@RequestMapping("/deleteGif")
	public ModelAndView deleteGif() throws Exception {
		ModelAndView mv = new ModelAndView("background/gif/deleteGif");
		List<Article> articles = articleServiceImpl.selectArticleByStatus(MyConstants.ARTICLE_STATE_DELETE);
		mv.addObject("articles", articles);
		mv.addObject("cur","4");
		return mv;
	}
	
	@RequestMapping(value="/getDelGif" ,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getDelGif(@RequestParam("rows") String rows,
			@RequestParam("page") String page,@RequestParam("sidx") 
			String sidx,@RequestParam("sord") String sord) throws Exception {
		int oneRecord = Integer.valueOf(rows);
		int pageNo = Integer.valueOf(page);
		Page pageUtil = new Page();
		int totalRecord = articleServiceImpl.selectTotal(MyConstants.ARTICLE_STATE_DELETE);
		pageUtil.setTotalRecord(totalRecord);
		pageUtil.setNumPerPage(oneRecord);
		pageUtil.setCurrPage(pageNo);
		pageUtil.init();
		ArticleVo av = new ArticleVo();
		av.setOrderBy(sidx);
		av.setOrderType(sord);
		av.setPage(pageUtil);
		av.setState(MyConstants.ARTICLE_STATE_DELETE);
		List<Article> articles = articleServiceImpl.selectCurrPage(av);
		resultMap.put("rows", articles);
		resultMap.put("total", pageUtil.getTotalPage());
		resultMap.put("records", totalRecord);
		JSONObject  json = JSONObject .fromObject(resultMap);
		return  json.toString();
	}
	
	/**
	 * 更改状态
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/doGifState" ,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String doGifState(HttpServletRequest request, @RequestBody Map<String, String> map) throws Exception {
		if (!map.containsKey("idList") || !map.containsKey("state")) {
			resultMap.put("success", false);
			resultMap.put("msg", "操作失败！");
			JSONObject json = JSONObject.fromObject(resultMap);
			return json.toString();
		}
		String idList = map.get("idList");
		String[] idListArry = idList.split(",");
		for (String id : idListArry) {
			User currentUser = (User) request.getSession().getAttribute("currentUser");
			ArticleVo articleVo = new ArticleVo();
			articleVo.setUserName(currentUser.getName());
			articleVo.setState(Integer.valueOf(map.get("state")));
			articleVo.setId(Integer.valueOf(id));
			Date date = new Date();
			articleVo.setModifyDate(date);
			articleVo.setModifyDateStr(df.format(date));
			articleServiceImpl.updateById(articleVo);
		}
		resultMap.put("success", true);
		resultMap.put("msg", "操作成功！");
		JSONObject json = JSONObject.fromObject(resultMap);
		return json.toString();
	}
	
	/**
	 * 上传gif图片
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/doAddGifs", method=RequestMethod.POST)
    public ModelAndView uploadFiles(HttpServletRequest request, @RequestParam("periods") String periods,
    		@RequestParam("title") String title) throws Exception {  
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
//        	String fileDesc = descs[0];//封面图片描述
//        	int indexNum = articleServiceImpl.selectMaxIndex() + 1;
        	Article article = saveGifArticle(currentUser,filePath,title,Integer.parseInt(periods));
        	
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
	private Article saveGifArticle(User currentUser, String filePath, String fileDesc,int indexNum) {
		Article article = new Article();
		article.setType(1);
		Date date = new Date();
		article.setCreateDateStr(df.format(date));
		article.setModifyDateStr(df.format(date));
		article.setCreateDate(date);
		article.setModifyDate(date);
		article.setDescription(fileDesc);
		article.setImgUrl(filePath);
		article.setState(1);
		article.setPeriods(indexNum);
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
		   String newFileName = commonFunctions.getCurrentTimeStr() + "_" + fileName;
	       String path = PropertiesUtil.getValue("gifServerPath") + File.separator 
	    		   + newFileName;
	       File newImage = new File(path);
	       multipartFile.transferTo(newImage);
	       return newFileName;
	}       
}
