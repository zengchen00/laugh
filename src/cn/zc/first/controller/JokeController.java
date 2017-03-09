package cn.zc.first.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.zc.first.common.CommonFunctions;
import cn.zc.first.common.MyConstants;
import cn.zc.first.po.Joke;
import cn.zc.first.po.JokeVo;
import cn.zc.first.po.User;
import cn.zc.first.service.JokeService;

@Controller
@RequestMapping("/background")
public class JokeController {
	
	@Autowired
	private JokeService jokeService;
	
	@Autowired
	private CommonFunctions commonFunctions;
	
	@RequestMapping(value="/getReadyJoke" ,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getReadyJoke() throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Joke> jokeList = new ArrayList<Joke>();
		for (int i = 0; i < 10; i++) {
			Joke joke = new Joke();
			
			joke.setId(i);
			joke.setTitle("xxx"+ i);
			joke.setAuthor("jjj"+i);
			jokeList.add(joke);
		}
		resultMap.put("rows", jokeList);
		resultMap.put("total", 1);
		resultMap.put("records", 10);
		JSONObject  json = JSONObject .fromObject(resultMap);
		return  json.toString();
	}
	
	@RequestMapping("/readyJoke")
	public ModelAndView readyJoke() throws Exception {
		ModelAndView mv = new ModelAndView("background/joke/readyJoke");
		mv.addObject("cur","10");
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
	public String queryDetailPage(HttpServletRequest request,@RequestBody Map<String, String> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(map.containsKey("content") && map.containsKey("title")){
			JokeVo jokeVo = new JokeVo();
			//判断session
			HttpSession session  = request.getSession();
			//从session中取出用户身份信息
			User currentUser = (User) session.getAttribute("currentUser");
			jokeVo.setTitle(map.get("title"));
			jokeVo.setState(MyConstants.ARTICLE_STATE_READY);
			jokeVo.setContent(map.get("content"));
			jokeVo.setAuthor(currentUser.getName());
			jokeVo.setCreateDate(new Date());
			jokeVo.setModifyDate(new Date());
			
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
