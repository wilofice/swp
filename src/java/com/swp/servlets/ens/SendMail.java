/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swp.servlets.ens;

import java.util.Properties;
import javax.mail.Address;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
    
    public static void envoyerMail(String towhom, String msgobjet, String msg) {
        String to = towhom;

      // Sender's email ID needs to be mentioned
      String from = "swapmylecture";
      final String username = "swapmylecture@gmail.com";//change accordingly
      final String password = "swapmylecture2017";//change accordingly

      // Assuming you are sending email through relay.jangosmtp.net
      String host = "smtp.gmail.com";

      Properties props = System.getProperties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", host);
      //props.put("mail.smtp.user", from);
      props.put("mail.smtp.ssl.enable", "true");
      props.put("mail.smtp.port", "465");
      props.put("mail.smtp.quitwait", "false");
      //System.out.println("ici1");

      // Get the Session object.
      Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
	   }
         });

      session.setDebug(true);

      try {
	   // Create a default MimeMessage object.
	   Message message = new MimeMessage(session);
	
	   // Set From: header field of the header.
	   message.setFrom(new InternetAddress(from));
	
	   // Set To: header field of the header.
	   message.setRecipients(Message.RecipientType.TO,
               InternetAddress.parse(to));
	
	   // Set Subject: header field
	   message.setSubject(msgobjet);
	
	   // Now set the actual message
	   message.setText(msg);

	   // Send message
           Transport t = session.getTransport("smtp");
          
           t.connect(host, username, password);
  
	   t.send(message, message.getAllRecipients());

	   System.out.println("Sent message successfully....");

      } catch (MessagingException e) {
         throw new RuntimeException(e);
      }
    }
    
}
