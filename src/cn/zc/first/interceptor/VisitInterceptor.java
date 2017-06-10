package cn.zc.first.interceptor;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.zc.first.common.IpUtil;
import cn.zc.first.controller.GifController;
import cn.zc.first.memcached.Memcached;

/**
 * 
 * <p>
 * Title: HandlerInterceptor1
 * </p>
 * <p>
 * Description:测试拦截器1
 * </p>
 * <p>
 * Company: www.itcast.com
 * </p>
 * 
 * @author 传智.燕青
 * @date 2015-4-14下午4:45:47
 * @version 1.0
 */
public class VisitInterceptor implements HandlerInterceptor {

	Logger logger = Logger.getLogger(VisitInterceptor.class);

	// 进入 Handler方法之前执行
	// 用于身份认证、身份授权
	// 比如身份认证，如果认证通过表示当前用户没有登陆，需要此方法拦截不再向下执行
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		try {
			String ip = getRemoteHost(request);
			logger.info(ip + " come in");
			Map<String, String> ipMap = (Map<String, String>) Memcached.get("ipMap");
			if (null != ipMap && ipMap.containsKey(ip)) {
				logger.info(ip + " already exsit....");
				return true;
			}
			logger.info(ip + " is new ....");
			if (null == ipMap) {
				ipMap = new HashMap<String, String>();
			}

			IpUtil addressUtils = new IpUtil();
			String address = addressUtils.getAddresses("ip=" + ip, "utf-8");

			if (StringUtils.isNotBlank(address)) {
				ipMap.put(ip, address);
				logger.info(ip + "===" + address);
			}
			Memcached.set("ipMap", ipMap, new Date(1000 * 60 * 60 * 24));
		} catch (UnsupportedEncodingException e) {
			logger.error(e);
		} catch (Exception e) {
			logger.error(e);
		}
		return true;
	}

	// 进入Handler方法之后，返回modelAndView之前执行
	// 应用场景从modelAndView出发：将公用的模型数据(比如菜单导航)在这里传到视图，也可以在这里统一指定视图
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

//		System.out.println("HandlerInterceptor1...postHandle");

	}

	// 执行Handler完成执行此方法
	// 应用场景：统一异常处理，统一日志处理
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

//		System.out.println("HandlerInterceptor1...afterCompletion");
	}

	public String getRemoteHost(javax.servlet.http.HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
	}
}
