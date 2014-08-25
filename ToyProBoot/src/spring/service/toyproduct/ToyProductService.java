package spring.service.toyproduct;

import java.util.List;
import java.util.Map;

import spring.domain.Search;
import spring.domain.Toy;
import spring.domain.guro.GuroRentalShop;
import spring.domain.guro.GuroToy;

public interface ToyProductService
{

	public Map<String, Object>getToyList(Search search) throws Exception;
	
//	public int guroRentalShopParsing(List<GuroRentalShop> rentalShopList) throws Exception;
//	
//	public int guroToyParsing(List<GuroToy> toyList, List<String> dbToyIdList) throws Exception;
	
	public List<String> getToyId() throws Exception;

	public int[] getToyCount(Search search) throws Exception;
	
	public Toy getToy(String toyCode) throws Exception;
	
	public void updateRentalState(Toy toy) throws Exception;
}
