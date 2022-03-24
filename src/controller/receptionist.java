package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import modal.OfficerInfo;

//Refactoring Method: Replacing Conditional with Polymorphism
//Class: [controller/Login.java]
//Why?->	Switch case was implemented to redirect the officer based on their role. 
//How?->	Adding subclass [receptionist] of super class [OfficerRole].

public class receptionist extends OfficerRole{

	@Override
	public int Type() {
		return receptionist;
	}
	
	@Override
	public void sendRedirectByOfficerRole( HttpServletResponse response, OfficerInfo oi)
	{
		try {
			response.sendRedirect("receptionist/receptionistDashboard.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
