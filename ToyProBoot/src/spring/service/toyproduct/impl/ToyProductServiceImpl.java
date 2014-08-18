package spring.service.toyproduct.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import spring.domain.Search;
import spring.domain.Toy;
import spring.domain.guro.GuroRentalShop;
import spring.domain.guro.GuroToy;
import spring.service.toyproduct.ToyProductDao;
import spring.service.toyproduct.ToyProductService;

@Service("toyProductServiceImpl")
public class ToyProductServiceImpl implements ToyProductService
{
	@Autowired
	@Qualifier("toyProductDaoImpl")
	private ToyProductDao toyProductDao;
	
	private ToyProductDao toyProductDao2 = new ToyProductDaoImpl();

	public ToyProductServiceImpl()
	{
		System.out.println("ToyProductServiceImpl 기본생성자!!");
	}
	
	public void setToyProductDao(ToyProductDao toyProductDao)
	{
		this.toyProductDao = toyProductDao;
	}

/*	@Override
	public int guroRentalShopParsing(List<GuroRentalShop> rentalShopList) throws Exception
	{
		// TODO Auto-generated method stub
		return toyProductDao.guroRentalShopParsing(rentalShopList);
	}*/
	
	@Override
	public Map<String, Object> getToyList(Search search) throws Exception {
		List<Toy> list = toyProductDao.getToyList(search);
		int totalCount = toyProductDao.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}
		
		@Override
		public List<String> getToyId() throws Exception
		{
			// TODO Auto-generated method stub
			return toyProductDao.getToyId();
		}

/*		@Override
		public int guroToyParsing(List<GuroToy> toyList,
				List<String> dbToyIdList) throws Exception {
			// TODO Auto-generated method stub
			return toyProductDao.guroToyParsing(toyList, dbToyIdList);
		}*/

		@Override
		public int[] getToyCount(Search search) throws Exception {
			// TODO Auto-generated method stub
			return toyProductDao.getToyCount(search);
		}
}
