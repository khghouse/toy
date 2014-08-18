package spring.service.parse.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import spring.domain.Gu;
import spring.domain.guro.GuroRentalShop;
import spring.domain.guro.GuroToy;
import spring.service.parse.ParseDao;

@Repository
public class ParseDaoImpl implements ParseDao
{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public ParseDaoImpl()
	{
		System.out.println("ParseDaoImpl() 기본생성자 호출!!");
	}
	
	@Override
	public int guroRentalShopParsing(List<GuroRentalShop> rentalShopList) throws Exception
	{
		// TODO Auto-generated method stub
		int count = 0;
		for(GuroRentalShop guroRentalShop : rentalShopList)
		{
			Gu gu = new Gu();
			int guCode = sqlSession.selectOne("ParseMapper.getGuCode", guroRentalShop.getGuName());
			gu.setGuCode(guCode);
			guroRentalShop.setGuCode(gu);
			System.out.println("dao impl : "+guroRentalShop);
			sqlSession.insert("ParseMapper.guroRentalShopParsing", guroRentalShop);
			count++;
		}
		return count;
	}
	
	@Override
	public int guroToyParsing(List<GuroToy> toyList, List<String> dbToyIdList) throws Exception
	{
		// TODO Auto-generated method stub
		boolean check = false;
		int insertCount = 0;
		
		for(int i = 0 ; i < toyList.size() ; i++)
		{
			check = false;
			
//			System.out.println("toyList.get("+i+").getToyIdid : "+toyList.get(i).getToyIdid());
//			System.out.println(dbToyIdList.size());
			for(int j = 0 ; j < dbToyIdList.size() ; j++)
			{
//				System.out.println(dbToyIdList.get(j));
				if(toyList.get(i).getToyIdid().equals(dbToyIdList.get(j)))
				{
					check = true;
					continue;
				}
			}
			if(!check)
			{
				sqlSession.insert("ParseMapper.guroToyParsing", toyList.get(i));
				insertCount++;
			}
		}
		
		return insertCount;
	}
}
