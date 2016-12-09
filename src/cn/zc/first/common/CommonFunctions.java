package cn.zc.first.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonFunctions {
	public String getCurrentTimeStr() {
		StringBuffer sBuffer = new StringBuffer();
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Long time = date.getTime();
		return sBuffer.append(dateFormat.format(date)).append(time).toString();
	}
	
	public String DateToStr(Date date,String str) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(str);
		return dateFormat.format(date);
	}
	
}
