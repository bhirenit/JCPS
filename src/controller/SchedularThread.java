package controller;

import schedule.DBScheduler;

public class SchedularThread extends Thread {
	public String to , subject ,msg, delay , timetoquery;
	public void run(){
		try {
			DBScheduler.startSchedular(this.delay, this.timetoquery, this.to, this.msg, this.subject);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void StartThread(String delay, String timetoquery ,String to, String msg, String subject){
		this.msg = msg ;
		this.to = to ;
		this.subject = subject ;
		this.delay = delay ;
		this.timetoquery = timetoquery ;
		this.start();
	}
}
