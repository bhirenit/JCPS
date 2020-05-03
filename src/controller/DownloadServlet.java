package controller;
import java.awt.Graphics;
import java.awt.GraphicsEnvironment;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.URL;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JEditorPane;

import com.pdfcrowd.Pdfcrowd;

@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  response.setContentType("text/html");
		  int jobcardNumber = Integer.parseInt(request.getParameter("id"));
		  PrintWriter out = response.getWriter();
	        
		
		 URL oracle = new URL("http://localhost:8080/JCPS5.0/serviceadvisor/jobcardview.jsp?id="+jobcardNumber);
	        BufferedReader in = new BufferedReader(
	        new InputStreamReader(oracle.openStream()));
	        String inputLine,jobCard="";
	        while ((inputLine = in.readLine()) != null)
	            jobCard=jobCard + inputLine;
	        in.close();
	     /*   try {
	        	 OutputStream file = new FileOutputStream(new File("F:\\"+jobcardNumber+".pdf"));
	 		    Document document = new Document();
	 		    PdfWriter writer = PdfWriter.getInstance(document, file);
	 		    document.open();
	 		    InputStream is = new ByteArrayInputStream(jobCard.getBytes());
	 		    XMLWorkerHelper.getInstance().parseXHtml(writer, document, is);
	 		    document.close();
	 		    file.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
*/
	     /*   int width = 2000, height = 3000;

		    BufferedImage image = GraphicsEnvironment.getLocalGraphicsEnvironment()
		        .getDefaultScreenDevice().getDefaultConfiguration()
		        .createCompatibleImage(width, height);

		    Graphics graphics = image.createGraphics();

		    JEditorPane jep = new JEditorPane("text/html", jobCard);
		    jep.setSize(width, height);
		    jep.print(graphics);

		    ImageIO.write(image, "png", new File("F://"+jobcardNumber+".png"));
		
      */
	        
	        	
	        
		 try {
	            // create the API client instance
	            Pdfcrowd.HtmlToPdfClient client = new Pdfcrowd.HtmlToPdfClient("jcps", "ed685ade75f2fcf75e7ce17c0ef4032d");
	            client.setPageDimensions("20in", "12in");
	            // run the conversion and write the result to a file
	            client.convertStringToFile(jobCard, "F://Hackathon/"+jobcardNumber+".pdf");
	        }
	        catch(Pdfcrowd.Error why) {
	            // report the error
	            System.err.println("Pdfcrowd Error: " + why);

	            // handle the exception here or rethrow and handle it at a higher level
	            throw why;
	        }
	        catch(IOException why) {
	            // report the error
	            System.err.println("IO Error: " + why.getMessage());

	            // handle the exception here or rethrow and handle it at a higher level
	            throw why;
	        }
	        
	        
	        
	/*        
	        try {
	            // create the API client instance
	            Pdfcrowd.HtmlToImageClient client = new Pdfcrowd.HtmlToImageClient("tryconvo", "15e747d6b32fc0016076f14122c25516");

	            // configure the conversion
	            client.setOutputFormat("png");

	            // run the conversion and write the result to a file
	            client.convertStringToFile(jobCard, "F:\\gunjan.png");
	        }
	        catch(Pdfcrowd.Error why) {
	            // report the error
	            System.err.println("Pdfcrowd Error: " + why);

	            // handle the exception here or rethrow and handle it at a higher level
	            throw why;
	        }
	        catch(IOException why) {
	            // report the error
	            System.err.println("IO Error: " + why.getMessage());

	            // handle the exception here or rethrow and handle it at a higher level
	            throw why;
	        }*/ //for image
	        
	        
	        
	        
		 String filename = jobcardNumber+".pdf"; 
		  String filepath = "F://Hackathon/"; 
		  response.setContentType("APPLICATION/OCTET-STREAM"); 
		  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\""); 

		  java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath + filename);
		  int i; 
		  while ((i=fileInputStream.read()) != -1) {
		    out.write(i); 
		  } 
		  fileInputStream.close(); 
		  out.close(); 
	}

}
