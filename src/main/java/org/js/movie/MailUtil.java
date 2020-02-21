/**
 * @FileName : MailUtil.java
 */
package org.js.movie;

import org.apache.commons.mail.HtmlEmail;

/**
 * @author 진수
 *
 */
public class MailUtil {

	public static void sendMail(String email, String subject, String msg) throws Exception{

		String charSet = "UTF-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "jskim9199";
		String hostSMTPpwd = "kjs9199!";
		
		String fromEmail = "jskim9199@naver.com";
		String fromName = "MovieCritic";

		try {
		HtmlEmail mail = new HtmlEmail();
		mail.setDebug(true);
		mail.setCharset(charSet);
		mail.setSSLOnConnect(true);
		mail.setHostName(hostSMTP);
		mail.setSmtpPort(587);
		
		mail.setAuthentication(hostSMTPid, hostSMTPpwd);
		mail.setStartTLSEnabled(true);
		mail.addTo(email);
		mail.setFrom(fromEmail, fromName, charSet);
		mail.setSubject(subject);
		mail.setHtmlMsg(msg);
		mail.send();
		} catch(Exception e){
		e.printStackTrace();
		}
	}
}
