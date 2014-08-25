package spring.web.reservation;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.domain.Page;
import spring.domain.RentalShop;
import spring.domain.Reservation;
import spring.domain.Search;
import spring.domain.Toy;
import spring.domain.User;
import spring.service.reservation.ReservationService;

@Controller
@RequestMapping("/reservation/*")
public class ReservationController
{
	@Autowired
	@Qualifier("reservationServiceImpl")
	private ReservationService reservationService;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	public ReservationController() {
		// TODO Auto-generated constructor stub
		System.out.println("ReservationController() 기본 생성자 호출!!");
	}

	@RequestMapping(value="/addReservation/{rentalCode}/{toyCode}")
	public @ResponseBody String getRentalState(@ModelAttribute Reservation reservation, @ModelAttribute Toy toy, @ModelAttribute RentalShop rentalShop, @PathVariable int rentalCode, @PathVariable String toyCode, HttpSession session) throws Exception
	{
		/*System.out.println("탓나?>");*/
		System.out.println(reservation);
		System.out.println(toy);
		System.out.println(rentalShop);
		
		rentalShop.setRentalCode(rentalCode);
		
		toy.setToyCode(toyCode);
		toy.setRentalCode(rentalShop);
		
		reservation.setToyCode(toy);
		reservation.setUserId((User)session.getAttribute("user"));
		
		reservationService.addReservation(reservation);
	
		return "/app/updateRentalState/"+toy.getToyCode()+"/"+toy.getRentalCode().getRentalCode();
		/*return null;*/
	}
	
	@RequestMapping(value="/getReservationList/{currentPage}")
	public @ResponseBody String getReservationList(@PathVariable Integer currentPage, HttpSession session) throws Exception
	{
		System.out.println("타라");
		Search search = new Search();
		search.setPageSize(pageSize);
		search.setCurrentPage(currentPage);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", (User)session.getAttribute("user"));
		map.put("search", search);
		
		Map<String, Object> returnMap = reservationService.getReservationList(map);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)returnMap.get("totalCount")).intValue(), pageUnit, pageSize);
		
		Map<String, Object> reservationMap = new HashMap<String, Object>();
		
		reservationMap.put("list", returnMap.get("list"));
		reservationMap.put("search", search);
		reservationMap.put("resultPage", resultPage);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonList = objectMapper.writeValueAsString(reservationMap);
		
		return jsonList;
	}
}
