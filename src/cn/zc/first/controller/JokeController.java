package cn.zc.first.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.zc.first.common.CommonFunctions;
import cn.zc.first.common.MyConstants;
import cn.zc.first.common.Page;
import cn.zc.first.po.Joke;
import cn.zc.first.po.JokeVo;
import cn.zc.first.po.User;
import cn.zc.first.service.JokeService;

@Controller
@RequestMapping("/background")
public class JokeController extends BaseController{
	
	@Autowired
	private JokeService jokeService;
	
	@Autowired
	private CommonFunctions commonFunctions;
	
	private SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	/**
	 * 更改笑话状态
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/doJokeState" ,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String doJokeState(HttpServletRequest request, @RequestBody Map<String, String> map) throws Exception {
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
			JokeVo jokeVo = new JokeVo();
			jokeVo.setAuthor(currentUser.getName());
			jokeVo.setState(Integer.valueOf(map.get("state")));
			jokeVo.setId(Integer.valueOf(id));
			Date date = new Date();
			jokeVo.setModifyDate(date);
			jokeVo.setModifyDateStr(df.format(date));
			jokeService.updateState(jokeVo);
		}
		resultMap.put("success", true);
		resultMap.put("msg", "操作成功！");
		JSONObject json = JSONObject.fromObject(resultMap);
		return json.toString();
	}
	
	
	@RequestMapping(value="/getReadyJoke" ,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getReadyJoke(@RequestParam("rows") String rows,
			@RequestParam("page") String page,@RequestParam("sidx") 
			String sidx,@RequestParam("sord") String sord) throws Exception {
		int oneRecord = Integer.valueOf(rows);
		int pageNo = Integer.valueOf(page);
		Page pageUtil = new Page();
		int totalRecord = jokeService.countNum(MyConstants.JOKE_STATE_READY);
		pageUtil.setTotalRecord(totalRecord);
		pageUtil.setNumPerPage(oneRecord);
		pageUtil.setCurrPage(pageNo);
		pageUtil.init();
		JokeVo jokeVo = new JokeVo();
		jokeVo.setOrderBy(sidx);
		jokeVo.setOrderType(sord);
		jokeVo.setPage(pageUtil);
		jokeVo.setState(MyConstants.JOKE_STATE_READY);
		List<Joke> jokeList = jokeService.selectCurrPage(jokeVo);
		resultMap.put("rows", jokeList);
		resultMap.put("total", pageUtil.getTotalPage());
		resultMap.put("records", totalRecord);
		JSONObject  json = JSONObject .fromObject(resultMap);
		return  json.toString();
	}
	
	@RequestMapping(value="/getOnJoke" ,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getOnJoke(@RequestParam("rows") String rows,
			@RequestParam("page") String page,@RequestParam("sidx") 
	String sidx,@RequestParam("sord") String sord) throws Exception {
		int oneRecord = Integer.valueOf(rows);
		int pageNo = Integer.valueOf(page);
		Page pageUtil = new Page();
		int totalRecord = jokeService.countNum(MyConstants.JOKE_STATE_ONLINE);
		pageUtil.setTotalRecord(totalRecord);
		pageUtil.setNumPerPage(oneRecord);
		pageUtil.setCurrPage(pageNo);
		pageUtil.init();
		JokeVo jokeVo = new JokeVo();
		jokeVo.setOrderBy(sidx);
		jokeVo.setOrderType(sord);
		jokeVo.setPage(pageUtil);
		jokeVo.setState(MyConstants.JOKE_STATE_ONLINE);
		List<Joke> jokeList = jokeService.selectCurrPage(jokeVo);
		resultMap.put("rows", jokeList);
		resultMap.put("total", pageUtil.getTotalPage());
		resultMap.put("records", totalRecord);
		JSONObject  json = JSONObject .fromObject(resultMap);
		return  json.toString();
	}
	
	@RequestMapping(value="/getDeleteJoke" ,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getDeleteJoke(@RequestParam("rows") String rows,
			@RequestParam("page") String page,@RequestParam("sidx") 
	String sidx,@RequestParam("sord") String sord) throws Exception {
		int oneRecord = Integer.valueOf(rows);
		int pageNo = Integer.valueOf(page);
		Page pageUtil = new Page();
		int totalRecord = jokeService.countNum(MyConstants.JOKE_STATE_DELETE);
		pageUtil.setTotalRecord(totalRecord);
		pageUtil.setNumPerPage(oneRecord);
		pageUtil.setCurrPage(pageNo);
		pageUtil.init();
		JokeVo jokeVo = new JokeVo();
		jokeVo.setOrderBy(sidx);
		jokeVo.setOrderType(sord);
		jokeVo.setPage(pageUtil);
		jokeVo.setState(MyConstants.JOKE_STATE_DELETE);
		List<Joke> jokeList = jokeService.selectCurrPage(jokeVo);
		resultMap.put("rows", jokeList);
		resultMap.put("total", pageUtil.getTotalPage());
		resultMap.put("records", totalRecord);
		JSONObject  json = JSONObject .fromObject(resultMap);
		return  json.toString();
	}
	
	@RequestMapping("/readyJoke")
	public ModelAndView readyJoke() throws Exception {
		ModelAndView mv = new ModelAndView("background/joke/readyJoke");
		mv.addObject("cur","10");
		return mv;
	}
	@RequestMapping("/onJoke")
	public ModelAndView onJoke() throws Exception {
		ModelAndView mv = new ModelAndView("background/joke/onJoke");
		mv.addObject("cur","11");
		return mv;
	}
	@RequestMapping("/deleteJoke")
	public ModelAndView deleteyJoke() throws Exception {
		ModelAndView mv = new ModelAndView("background/joke/deleteJoke");
		mv.addObject("cur","12");
		return mv;
	}
	
	@RequestMapping("/addJoke")
	public ModelAndView addGif() throws Exception {
		ModelAndView mv = new ModelAndView("background/joke/addJoke");
		mv.addObject("cur","9");
		return mv;
	}
	
	@RequestMapping(value="/saveJoke" ,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String saveJoke(HttpServletRequest request,@RequestBody Map<String, String> map) throws Exception {
		if(map.containsKey("content") && map.containsKey("title")&& map.containsKey("period")){
			JokeVo jokeVo = new JokeVo();
			//判断session
			HttpSession session  = request.getSession();
			//从session中取出用户身份信息
			User currentUser = (User) session.getAttribute("currentUser");
			jokeVo.setTitle(map.get("title"));
			jokeVo.setState(MyConstants.ARTICLE_STATE_READY);
			jokeVo.setContent(map.get("content"));
			jokeVo.setAuthor(currentUser.getName());
			Date date = new Date();
			jokeVo.setCreateDate(date);
			jokeVo.setModifyDate(date);
			jokeVo.setCreateDateStr(df.format(date));
			jokeVo.setModifyDateStr(df.format(date));
			jokeVo.setPeriods(Integer.parseInt(map.get("period").trim()));
			
			jokeService.insert(jokeVo);
			resultMap.put("success",true);
			resultMap.put("msg","插入笑话成功！");
			
		}else{
			resultMap.put("success",false);
			resultMap.put("msg","参数有误");
		}
		JSONObject  json = JSONObject .fromObject(resultMap);
		return  json.toString();
	}
	
}
