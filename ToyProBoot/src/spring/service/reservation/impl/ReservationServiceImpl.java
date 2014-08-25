package spring.service.reservation.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import spring.domain.Reservation;
import spring.domain.User;
import spring.service.reservation.ReservationDao;
import spring.service.reservation.ReservationService;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	@Qualifier("reservationDaoImpl")
	private ReservationDao reservationDao;
	
	public ReservationServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println("ReservationServiceImpl() 기본생성자 호출!!");
	}

	@Override
	public void addReservation(Reservation reservation) throws Exception {
		// TODO Auto-generated method stub
		reservationDao.addReservation(reservation);
	}

	@Override
	public Map<String, Object> getReservationList(Map<String, Object> map)
			throws Exception {
		
		List<Reservation> list = reservationDao.getReservationList(map);
		int totalCount = reservationDao.getTotalCount(map);
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("totalCount", new Integer(totalCount));
		
		return returnMap;

	}
}
