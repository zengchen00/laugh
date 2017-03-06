package cn.zc.first.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zc.first.po.User;
import cn.zc.first.service.UserService;

import com.ndktools.javamd5.Mademd5;

@Controller
@RequestMapping("/background")
public class BLoginController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login() throws Exception {
		return "background/login";

	}
	
	@RequestMapping("/index")
	public String gotoIndex() throws Exception {
		return "index";

	}
	
	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    @ResponseBody
	public String doLogin(HttpSession session, String username, String password) throws Exception {
		Mademd5 md = new Mademd5();
		String passwordMd5 = md.toMd5(password);
		User user = new User();
		user.setName(username);
		user.setPassword(passwordMd5);
		List<User> users = userService.getUser(user);
		if(users != null && users.size() > 0){
			user = users.get(0);
			session.setAttribute("currentUser", user);
			return "0000";
		}
		return "0001";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.removeAttribute("currentUser");
		return "redirect:login.html";

	}
}
