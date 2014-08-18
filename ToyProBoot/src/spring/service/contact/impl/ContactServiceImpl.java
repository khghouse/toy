package spring.service.contact.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import spring.domain.RentalShop;
import spring.service.contact.ContactDao;
import spring.service.contact.ContactService;

@Service
public class ContactServiceImpl implements ContactService
{
	@Autowired
	@Qualifier("contactDaoImpl")
	private ContactDao contactDao;
	
	public ContactServiceImpl()
	{
		System.out.println("ContactServiceImpl 기본생성자 호출!!");
	}
	
	@Override
	public List<RentalShop> getRentalShopData(int guCode) throws Exception
	{
		// TODO Auto-generated method stub
		return contactDao.getRentalShopData(guCode);
	}

	@Override
	public List<RentalShop> getLocation(int rentalCode) throws Exception
	{
		// TODO Auto-generated method stub
		return contactDao.getLocation(rentalCode);
	}
}
