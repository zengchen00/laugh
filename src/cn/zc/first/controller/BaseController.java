package cn.zc.first.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

public class BaseController {
	
	Map<String, Object> resultMap = new HashMap<String, Object>();
	
	@Autowired  
	HttpServletRequest request;
	
//	@Autowired  
//	HttpServletResponse response;
//	
//	@Autowired  
//	HttpSession session;
}
