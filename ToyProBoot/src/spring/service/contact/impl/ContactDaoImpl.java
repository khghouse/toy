package spring.service.contact.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import spring.domain.RentalShop;
import spring.service.contact.ContactDao;

@Repository
public class ContactDaoImpl implements ContactDao
{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public ContactDaoImpl()
	{
		System.out.println("ContactDaoImpl 기본생성자 호출!!");
	}
	
	@Override
	public List<RentalShop> getRentalShopData(int guCode) throws Exception
	{
		// TODO Auto-generated method stub
		return sqlSession.selectList("ContactMapper.getRentalShopData", guCode);
	}

	@Override
	public List<RentalShop> getLocation(int rentalCode) throws Exception
	{
		// TODO Auto-generated method stub
		return sqlSession.selectList("ContactMapper.getLocation", rentalCode);
	}
}
