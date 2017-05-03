package cn.zc.first.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zc.first.po.User;
import cn.zc.first.service.UserService;

import com.ndktools.javamd5.Mademd5;

@Controller
@RequestMapping("/background")
public class BLoginController extends BaseController{
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login() throws Exception {
		return "background/login";

	}
	
	@RequestMapping("/index")
	public String gotoIndex() throws Exception {
		return "background/index";

	}
	
	@RequestMapping(value = "/doLogin", method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody
	public String doLogin(HttpSession session, @RequestBody Map<String, String> map) throws Exception {
		Mademd5 md = new Mademd5();
		String passwordMd5 = md.toMd5(map.get("password"));
		User user = new User();
		user.setName(map.get("username"));
		user.setPassword(passwordMd5);
		List<User> users = userService.getUser(user);
		if(users != null && users.size() > 0){
			user = users.get(0);
			session.setAttribute("currentUser", user);
			resultMap.put("success", true);
			resultMap.put("msg", "登录成功！");
		}else{
			resultMap.put("false", true);
			resultMap.put("msg", "不存在用户或者登录密码错误！");
		}
		JSONObject json = JSONObject.fromObject(resultMap);
		return json.toString();
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.removeAttribute("currentUser");
		return "redirect:login.html";

	}
}
