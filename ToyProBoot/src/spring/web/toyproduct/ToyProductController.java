package spring.web.toyproduct;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.common.parse.GuroRentalShopParsing;
import spring.common.parse.GuroToyParsing;
import spring.domain.Page;
import spring.domain.Search;
import spring.domain.guro.GuroRentalShop;
import spring.domain.guro.GuroToy;
import spring.service.toyproduct.ToyProductService;

@Controller
public class ToyProductController
{
	@Autowired
	@Qualifier("toyProductServiceImpl")
	private ToyProductService toyProductService;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	public ToyProductController()
	{
		System.out.println("ToyProductController 기본생성자 호출!!");
	}
	
	@RequestMapping(value="/showList/{searchConditionAge}/{searchConditionCate}/{searchKeyword}/{currentPage}/{shopCode}")
	public @ResponseBody String listToyProductList(@PathVariable String searchConditionCate, @PathVariable String searchConditionAge,@PathVariable String searchKeyword,@PathVariable String currentPage,@PathVariable String shopCode) throws Exception{
		Search search=new Search();
		search.setPageSize(pageSize);
		search.setSearchConditionAge(searchConditionAge);
		search.setSearchConditionCate(searchConditionCate);
		search.setSearchKeyword(searchKeyword);
		if(!shopCode.equals("null")){
			search.setShopCode(Integer.parseInt(shopCode));
		}
		if(currentPage.equals("null")){
			search.setCurrentPage(1);
		}else{
			search.setCurrentPage(Integer.parseInt(currentPage));
		}
		System.out.println(search);
		Map<String, Object> map  = toyProductService.getToyList(search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		map.remove("totalCount");
		map.put("search", search);
		map.put("page", resultPage);
		ObjectMapper objectMapper =
				new ObjectMapper();
		String jsonCount = objectMapper.writeValueAsString(map);
		System.out.println("jsonCount : "+jsonCount);
		return jsonCount;
	}
	
	@RequestMapping(value="/showCount/{searchConditionAge}/{searchConditionCate}/{searchKeyword}")
	public @ResponseBody String showCount(@PathVariable String searchConditionCate, @PathVariable String searchConditionAge,@PathVariable String searchKeyword) throws Exception
	{
		Search search=new Search();
		search.setPageSize(pageSize);
		search.setSearchConditionAge(searchConditionAge);
		search.setSearchConditionCate(searchConditionCate);
		search.setSearchKeyword(searchKeyword);
		if(search.getCurrentPage() ==null){
			search.setCurrentPage(1);
		}
		System.out.println(search);
		int a[] = toyProductService.getToyCount(search);
		ObjectMapper objectMapper =
				new ObjectMapper();
		String jsonCount = objectMapper.writeValueAsString(a);
		System.out.println(jsonCount+"jsonCount \n\n");
		return jsonCount;
	}
}
