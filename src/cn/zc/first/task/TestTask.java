package cn.zc.first.task;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import cn.zc.first.service.VisitRecordService;

@Component
public class TestTask {
	
	@Autowired
	private VisitRecordService visitRecordServiceImpl;
	
	Logger logger = Logger.getLogger(TestTask.class);
	
    @Scheduled(cron = "0 45 22 * * ?")
    public void test(){
    	logger.info("so so so so ");
    }
}