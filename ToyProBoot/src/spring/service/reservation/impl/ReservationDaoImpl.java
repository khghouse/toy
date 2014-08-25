package spring.service.reservation.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.domain.Reservation;
import spring.domain.Search;
import spring.domain.User;
import spring.service.reservation.ReservationDao;

@Repository
public class ReservationDaoImpl implements ReservationDao
{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public ReservationDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println("ReservationDaoImpl() 기본생성자 호출!!");
	}

	@Override
	public void addReservation(Reservation reservation) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("ReservationMapper.addReservation", reservation);
	}

	@Override
	public List<Reservation> getReservationList(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ReservationMapper.getReservationList", map);
	}

	@Override
	public int getTotalCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ReservationMapper.getTotalCount", map);
	}
}
