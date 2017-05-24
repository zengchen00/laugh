import java.io.File;

import cn.zc.first.common.PropertiesUtil;


public class Test {

	public static void main(String[] args) {
		String path = PropertiesUtil.getValue("gifServerPath") + File.separator + "2017/04/28//1493385894300.gif";
		File file = new File(path);
		file.deleteOnExit();
	}

}
