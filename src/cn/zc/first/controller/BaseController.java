package cn.zc.first.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

public class BaseController {
	
	@Autowired  
	HttpServletRequest request;
	
//	@Autowired  
//	HttpServletResponse response;
//	
//	@Autowired  
//	HttpSession session;
}