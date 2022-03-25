package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import modal.OfficerInfo;

//Refactoring Method: Replacing Conditional with Polymorphism
//Class: [controller/Login.java]
//Why?->	Switch case was implemented to redirect the officer based on their role. 
//How?->	Adding super class [OfficerRole].

public abstract class OfficerRole{
	public final int service_advisor = 0;
	public final int floor_incharge = 1;
	public final int receptionist = 2;
	public final int customer = 3;
	public final int admin = 4;
	public final int insurance = 5;
	
	public abstract int Type();
	

	public void sendRedirectByOfficerRole( HttpServletResponse response, OfficerInfo oi)
	{
		try {
			response.sendRedirect("index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
