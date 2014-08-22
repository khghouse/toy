package spring.web.gallery;

import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.service.gallery.GalleryService;

@Controller
public class GalleryController{
	@Autowired
	@Qualifier("galleryServiceImpl")
	private GalleryService galleryService;
	
	
	
	@RequestMapping(value="/showImg")
	public @ResponseBody String showImg() throws Exception
	{
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", galleryService.getImgList());
		ObjectMapper objectMapper =
				new ObjectMapper();
		
		String jsonCount = objectMapper.writeValueAsString(map);
		System.out.println(jsonCount+"jsonCount \n\n");
		return jsonCount;
	}	

}
