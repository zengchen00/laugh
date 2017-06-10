package cn.zc.first.task;

import java.util.Date;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import cn.zc.first.memcached.Memcached;
import cn.zc.first.po.VisitRecordVo;
import cn.zc.first.service.VisitRecordService;

@Component
public class visitorTask {
	
	@Autowired
	private VisitRecordService visitRecordServiceImpl;
	
	Logger logger = Logger.getLogger(visitorTask.class);
	
    @Scheduled(cron = "0 50 23 * * ?")
    public void insertVisit(){
    	Map<String, String> ipMap = (Map<String, String>) Memcached.get("ipMap");
    	if(null != ipMap){
    		logger.info("size:"+ ipMap.size());
    		for (Map.Entry<String,String> map : ipMap.entrySet()) {
    			VisitRecordVo vo = new VisitRecordVo();
    			vo.setIp(map.getKey());
    			String detailStr = map.getValue();
    			logger.info(map.getKey()+":"+ detailStr+"  "+detailStr.split(",").length);
    			if(detailStr != null && detailStr.split(",",-1).length > 2){
    				String[] detail = detailStr.split(",",-1);
    				vo.setProvince(detail[0]);
    				vo.setCity(detail[1]);
    				vo.setArea(detail[2]);
    				vo.setVisitDate(new Date());
    				visitRecordServiceImpl.insert(vo);
    				logger.info("do insert "+ map.getKey());
    			}
    		}
    	}
    	
    }
}