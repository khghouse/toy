package spring.common.parse.schedule;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;



public class Do extends QuartzJobBean {
	private AutoParsing AutoParsing;
	
	
	public void setAutoParsing(AutoParsing AutoParsing){
		this.AutoParsing=AutoParsing;
	}
	
	
	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		// TODO Auto-generated method stub
		
		try {
			AutoParsing.guroRentalShopParsing();
			AutoParsing.guroToyParsing();
			System.out.println("파싱 완료");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("이미 파싱되었습니다");
		}
		
	}
	
}
