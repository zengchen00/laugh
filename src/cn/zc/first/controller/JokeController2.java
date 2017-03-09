package cn.zc.first.controller;

import java.util.HashMap;
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
import cn.zc.first.po.Joke;
import cn.zc.first.po.JokeVo;
import cn.zc.first.service.JokeService;

@Controller
@RequestMapping("/foreground")
public class JokeController2 {
	
	@Autowired
	private JokeService jokeService;
	
	@Autowired
	private CommonFunctions commonFunctions;
	
	@RequestMapping("/addJoke")
	public ModelAndView addGif() throws Exception {
		ModelAndView mv = new ModelAndView("background/joke/addJoke");
		mv.addObject("cur","9");
		return mv;
	}
	
	@RequestMapping(value="/getJoke" ,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getJoke(HttpServletRequest request,@RequestBody Map<String, String> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(map.containsKey("id")){
			JokeVo jokeVo = new JokeVo();
			jokeVo.setId(Integer.valueOf(map.get("id")));
			Joke joke = jokeService.queryJokeById(jokeVo);
			resultMap.put("title",joke.getTitle());
			resultMap.put("content",joke.getContent());
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
