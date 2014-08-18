package spring.service.parse.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import spring.domain.guro.GuroRentalShop;
import spring.domain.guro.GuroToy;
import spring.service.parse.ParseDao;
import spring.service.parse.ParseService;

@Service
public class ParseServiceImpl implements ParseService
{
	@Autowired
	@Qualifier("parseDaoImpl")
	private ParseDao parseDao;
	
	public ParseServiceImpl()
	{
		// TODO Auto-generated constructor stub
		System.out.println("ParseServiceImpl() 기본 생성자 호출!!");
	}
	
	@Override
	public int guroRentalShopParsing(List<GuroRentalShop> rentalShopList) throws Exception
	{
		// TODO Auto-generated method stub
		return parseDao.guroRentalShopParsing(rentalShopList);
	}
	
	@Override
	public int guroToyParsing(List<GuroToy> toyList,
			List<String> dbToyIdList) throws Exception {
		// TODO Auto-generated method stub
		return parseDao.guroToyParsing(toyList, dbToyIdList);
	}
}
