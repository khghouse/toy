package spring.service.contact;

import java.util.List;

import spring.domain.RentalShop;

public interface ContactService
{
	public List<RentalShop> getRentalShopData(int guCode) throws Exception;
	
	public List<RentalShop> getLocation(int rentalCode) throws Exception;
}
