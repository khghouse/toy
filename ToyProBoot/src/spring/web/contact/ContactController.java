package spring.web.contact;

import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.domain.RentalShop;
import spring.service.contact.ContactService;

@Controller
@RequestMapping("/contact/*")
public class ContactController
{
	@Autowired
	@Qualifier("contactServiceImpl")
	private ContactService contactService;
	
	public ContactController()
	{
		System.out.println("ContactController 기본생성자 호출!!");
	}
	
	@RequestMapping(value="/getRentalShopData/{guCode}")
	public @ResponseBody String getRentalName(@PathVariable int guCode) throws Exception
	{
		List<RentalShop> list = contactService.getRentalShopData(guCode);
		
//		for(RentalShop a : list)
//			System.out.println(a);
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		String jsonRentalName = objectMapper.writeValueAsString(list);
//		System.out.println(jsonRentalName);
		return jsonRentalName;
	}
	
	@RequestMapping(value="/getLocation/{rentalCode}")
	public @ResponseBody String getLocation(@PathVariable int rentalCode) throws Exception
	{
		List<RentalShop> list = contactService.getLocation(rentalCode);
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		String jsonLocation = objectMapper.writeValueAsString(list);
		
		return jsonLocation;
	}
}
