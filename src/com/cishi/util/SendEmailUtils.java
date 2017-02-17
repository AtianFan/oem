/**
 * @Title: SendEmail.java
 * @Package com.cishi.util
 * @Description: TODO
 * Copyright: Copyright (c) 2016
 * Company:上海开言技术有限公司
 * @author Paddy
 * @date 2017年1月18日 下午7:42:01
 * @version V1.0
 */



package com.cishi.util;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;


/**
 * @ClassName: SendEmail
 * @Description: TODO
 * @author Paddy
 * @date 2017年1月18日 下午7:42:01
 */

public class SendEmailUtils {
	
	private static final String  emailSMTP = "mail.m-and-n.com";
	private static final String  userName = "liumingyue@m-and-n.com";
	private static final String  passWord = "lingran123";
	
	public static void sendEmail(String to,String content){
		Properties props = System.getProperties();
		props.put("mail.smtp.host", emailSMTP);
		MyAuthenticator authenticator = new MyAuthenticator(userName,passWord);
		Session session = Session.getDefaultInstance(props, authenticator);
		Message mailMessage = new MimeMessage(session);
		Address from;
		try {
			from = new InternetAddress(userName,MimeUtility.decodeText(userName));
			mailMessage.setFrom(from);
			mailMessage.addRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			mailMessage.setSubject("磁石云(天津)数字科技有限公司");
			mailMessage.setSentDate(new Date());
			Multipart mainPart = new MimeMultipart();
			BodyPart html = new MimeBodyPart();
			html.setContent(content, "text/html; charset=utf-8");
			mainPart.addBodyPart(html);
			mailMessage.setContent(mainPart);
			mailMessage.saveChanges();
			Transport transport = session.getTransport("smtp");
			transport.connect(emailSMTP, userName, passWord);
			transport.sendMessage(mailMessage,mailMessage.getAllRecipients());
            transport.close();      
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	static  class MyAuthenticator extends Authenticator {
		String userName = null;
		String password = null;

		public MyAuthenticator() {
		}

		public MyAuthenticator(String username, String password) {
			this.userName = username;
			this.password = password;
		}

		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(userName, password);
		}
	}
	public static void main(String[] args) {
		sendEmail("464046752@qq.com","sss");
	}
	
}
