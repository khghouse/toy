package spring.service.parse;

import java.util.List;

import spring.domain.guro.GuroRentalShop;
import spring.domain.guro.GuroToy;

public interface ParseService
{
	public int guroRentalShopParsing(List<GuroRentalShop> rentalShopList) throws Exception;
	
	public int guroToyParsing(List<GuroToy> toyList, List<String> dbToyIdList) throws Exception;
}
