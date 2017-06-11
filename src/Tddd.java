import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import cn.zc.first.memcached.Memcached;
import cn.zc.first.po.VisitRecordVo;


public class Tddd {

	public static void main(String[] args) {
		Map<String, String> ipMap = new HashMap<String, String>();
		ipMap.put("1", "11,88,");
		ipMap.put("2", "22,99,");
		ipMap.put("3", "33,00,");
		
    	if(null != ipMap){
    		for (Map.Entry<String,String> map : ipMap.entrySet()) {
    			VisitRecordVo vo = new VisitRecordVo();
    			vo.setIp(map.getKey());
    			String detailStr = map.getValue();
    			if(detailStr != null && detailStr.split(",",-1).length > 2){
    				String[] detail = detailStr.split(",",-1);
    				vo.setProvince(detail[0]);
    				vo.setCity(detail[1]);
    				vo.setArea(detail[2]);
    				vo.setVisitDate(new Date());
    				System.out.println("do insert "+ map.getKey());
    			}
    		}
    	}

	}

}
