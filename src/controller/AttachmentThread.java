package controller;

import java.io.File;

public class AttachmentThread extends Thread {
		String to,msg,subject,path;
		public void run(){
			MailAttachment.send(this.to, this.subject, this.msg, this.path);
		}
		public void StartThread(String to, String msg, String subject,String path){
			this.msg = msg ;
			this.to = to ;
			this.subject = subject ;
			this.path = path ;
			this.start();
		}

}
