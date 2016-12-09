package cn.zc.first.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import cn.zc.first.common.CommonFunctions;
import cn.zc.first.common.MyConstants;

@Controller  
@RequestMapping("/fileUploadController")  
public class FileUploadController extends MultiActionController { 
	
	@Autowired
	private CommonFunctions commonFunctions;
	
	@RequestMapping(value="/uploadFiles", method=RequestMethod.POST)
    public ModelAndView uploadFiles(HttpServletRequest request, HttpServletResponse response) {  
        ModelAndView mav = new ModelAndView("success");  
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
        MultiValueMap<String, MultipartFile> multiValueMap = multipartRequest.getMultiFileMap();  
        List<MultipartFile> file = multiValueMap.get("clientFile");  
        if(file.size()>0){
        	for (MultipartFile multipartFile : file) {
        		try {
					SaveFileFromInputStream(multipartFile,multipartFile.getInputStream(),multipartFile.getOriginalFilename());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
        }  
        return mav;  
    }
	
	public void SaveFileFromInputStream(MultipartFile multipartFile ,InputStream stream,String fileName) throws IOException{      
	       String path = MyConstants.GIF_SERVER_PATH + File.separator 
	    		   + commonFunctions.getCurrentTimeStr() + "_" + fileName;
	       File newImage = new File(path);
	       multipartFile.transferTo(newImage);
	   }       
}  
