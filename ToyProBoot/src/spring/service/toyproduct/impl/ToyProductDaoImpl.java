package spring.service.toyproduct.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import spring.domain.Search;
import spring.domain.Toy;
import spring.domain.guro.GuroRentalShop;
import spring.domain.guro.GuroToy;
import spring.service.toyproduct.ToyProductDao;

@Repository("toyProductDaoImpl")
public class ToyProductDaoImpl implements ToyProductDao
{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public ToyProductDaoImpl()
	{
		System.out.println("ToyProductDaoImpl() 기본생성자 호출!!");
	}
	
	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
	}

/*	@Override
	public int guroRentalShopParsing(List<GuroRentalShop> rentalShopList) throws Exception
	{
		// TODO Auto-generated method stub
		int count = 0;
		for(GuroRentalShop guroRentalShop : rentalShopList)
		{
			sqlSession.update("ToyProductMapper.guroRentalShopParsing", guroRentalShop);
			count++;
		}
		return count;
	}*/
	
	@Override
	public List<Toy> getToyList(Search search) throws Exception {
		if(search.getShopCode()==0){
			System.out.println("토이리스트 실행!!");
			return sqlSession.selectList("ToyProductMapper.getToyList", search);
		}else{
			System.out.println("토이리스트2 실행!!");
			return sqlSession.selectList("ToyProductMapper.getToyList2", search);
		}
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		if(search.getShopCode()==0){
			System.out.println("겟토탈카운트");
			return (Integer)sqlSession.selectOne("ToyProductMapper.getTotalCount", search);	
		}else{
			System.out.println("겟토탈카운트2");
			return (Integer)sqlSession.selectOne("ToyProductMapper.getTotalCount2", search);
		}
		
	}
	
//	@Override
//	public void deleteList() throws Exception {
//		// TODO Auto-generated method stub
//		sqlSession.delete("ToyProductMapper.deleteList");
//		
//	}
	
	@Override
	public List<String> getToyId() throws Exception
	{
		// TODO Auto-generated method stub
		return sqlSession.selectList("ToyProductMapper.getToyId");
	}

/*	@Override
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
				sqlSession.insert("ToyProductMapper.guroToyParsing", toyList.get(i));
				insertCount++;
			}
		}
		
		return insertCount;
	}*/
	
	@Override
	public int[] getToyCount(Search search) throws Exception{
		
		int shopCode[]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40};
		int toyCount[]=new int[40];
		System.out.println(search);
		
		for(int i=0;i<40;i++){
			search.setShopCode(shopCode[i]);
			toyCount[i]=(Integer)sqlSession.selectOne("ToyProductMapper.getToyCount", search);
			//toyCount[i]=sqlSession.selectOne("ToyProductMapper.getTotalCount", search);
			System.out.print(toyCount[i]);
		}
		return toyCount;
	}
	
	@Override
	public Toy getToy(String toyCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ToyProductMapper.getToy", toyCode);
	}

	@Override
	public void updateRentalState(Toy toy) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("ToyProductMapper.updateRentalState", toy);
	}
}
