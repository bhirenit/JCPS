package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import modal.OfficerInfo;

//Refactoring Method: Replacing Conditional with Polymorphism
//Class: [controller/Login.java]
//Why?->	Switch case was implemented to redirect the officer based on their role. 
//How?->	Adding subclass [insurance] of super class [OfficerRole].

public class insurance extends OfficerRole{

	@Override
	public int Type() {
		return insurance;
	}
	
	@Override
	public void sendRedirectByOfficerRole( HttpServletResponse response, OfficerInfo oi)
	{
		try {
			response.sendRedirect("insurance/insuranceDashboard.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

