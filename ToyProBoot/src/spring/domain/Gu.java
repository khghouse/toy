package spring.domain;

public class Gu 
{
	private int guCode;
	private String guName;
	
	public Gu()
	{
		
	}

	public int getGuCode() {
		return guCode;
	}

	public String getGuName() {
		return guName;
	}

	public void setGuCode(int guCode) {
		this.guCode = guCode;
	}

	public void setGuName(String guName) {
		this.guName = guName;
	}

	@Override
	public String toString() {
		return "Gu [guCode=" + guCode + ", guName=" + guName + "]";
	}
}
