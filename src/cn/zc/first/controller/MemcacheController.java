package cn.zc.first.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.zc.first.memcached.Memcached;

@Controller
@RequestMapping("/foreground")
public class MemcacheController extends BaseController{
	
	
	@RequestMapping("/cachedTest")
	public void cachedTest() throws Exception {
		Map<String, String> ipMap = (Map<String, String>) Memcached.get("ipMap");
		for (Map.Entry<String,String> map : ipMap.entrySet()) {
			System.out.println(map.getKey()+":"+map.getValue());
		}
		
	}
	
	@RequestMapping("/cachedTest1")
	public void cachedTest1() throws Exception {
		Memcached.set("1235", "我们");
		System.out.println(Memcached.get("1235"));
	}

}
