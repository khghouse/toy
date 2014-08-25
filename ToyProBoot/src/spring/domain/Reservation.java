package spring.domain;

import java.util.Date;

public class Reservation
{
	private int reservationCode;
	private User userId;
	private Toy toyCode;
	private String regDate;
	private String rentalDate;
	private String returnDate;
	
	public Reservation() {
		// TODO Auto-generated constructor stub
	}

	public int getReservationCode() {
		return reservationCode;
	}

	public void setReservationCode(int reservationCode) {
		this.reservationCode = reservationCode;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	public Toy getToyCode() {
		return toyCode;
	}

	public void setToyCode(Toy toyCode) {
		this.toyCode = toyCode;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getRentalDate() {
		return rentalDate;
	}

	public void setRentalDate(String rentalDate) {
		this.rentalDate = rentalDate;
	}

	public String getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	@Override
	public String toString() {
		return "Reservation [reservationCode=" + reservationCode + ", userId="
				+ userId + ", toyCode=" + toyCode + ", regDate=" + regDate
				+ ", rentalDate=" + rentalDate + ", returnDate=" + returnDate
				+ "]";
	}
}
