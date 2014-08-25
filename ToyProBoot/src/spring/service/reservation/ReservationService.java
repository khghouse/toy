package spring.service.reservation;

import java.util.Map;

import spring.domain.Reservation;

public interface ReservationService {
	
	public void addReservation(Reservation reservation) throws Exception;
	
	public Map<String, Object> getReservationList(Map<String, Object> map) throws Exception;

}
