package spring.service.reservation;

import java.util.List;
import java.util.Map;

import spring.domain.Reservation;
import spring.domain.Search;
import spring.domain.User;

public interface ReservationDao {
	
	public void addReservation(Reservation reservation) throws Exception;

	public List<Reservation> getReservationList(Map<String, Object> map) throws Exception;
	
	public int getTotalCount(Map<String, Object> map) throws Exception;
}
