package com.kh.market.member.model.service;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.market.member.model.vo.Member;


@Service("mailsender")
public class MailServiceImpl implements MailService{

	@Autowired
	private JavaMailSender mailsender;
	
	@Autowired
	private MemberService mService;
	
	// 이메일 난수 만드는 메서드
		private String init() {
			Random ran = new Random();
			StringBuffer sb = new StringBuffer();
			int num = 0;

			do {
				num = ran.nextInt(75) + 48;
				if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
					sb.append((char) num);
				} else {
					continue;
				}

			} while (sb.length() < size);
			if (lowerCheck) {
				return sb.toString().toLowerCase();
			}
			return sb.toString();
		}

		// 난수를 이용한 키 생성
		private boolean lowerCheck;
		private int size;

		public String getKey(boolean lowerCheck, int size) {
			this.lowerCheck = lowerCheck;
			this.size = size;
			return init();
		}


	@Override
	public void mailSendWithUserKey(String mem_email, String mem_id, HttpServletRequest request) {

		InetAddress inetAddress = null;
		try {
			inetAddress = InetAddress.getLocalHost();
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String key = getKey(false, 20);

		System.out.println("memmail" + mem_email + "Key" + key);

		MimeMessage mail = mailsender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 MS :p MarketFully 입니다!</h2><br><br>" + "<h3>" + mem_id + "님</h3>"
				+ "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " + "<a href='http://" + inetAddress.getHostAddress() + ":"
				+ request.getServerPort() + request.getContextPath() + "/registSuccess?user_id=" + mem_id + "&user_key="
				+ key + "'>인증하기</a></p>" + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
				// 메일안될경우 inetAddress.getHostAddress()를 "localhost" 텍스트로 변경하면됨
		try {
			mail.setSubject("[본인인증] MS :p MarketFully 회원가입 인증메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(mem_email));
			mailsender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	// 비밀번호 찾기 이메일인증
	@Override
	public void mailsendWithPassword(String mem_name, String mem_id, String mem_email, HttpServletRequest request) {
		
		InetAddress inetAddress = null;
	      try {
	         inetAddress = InetAddress.getLocalHost();
	      } catch (UnknownHostException e1) {
	         // TODO Auto-generated catch block
	         e1.printStackTrace();
	      }
		
		String key = getKey(false,20);

		System.out.println("memmail" + mem_email + "Key" + key);
		
		MimeMessage mail = mailsender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '"+ mem_name +"' 님</h2><br><br>" 
				+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : green'>'" + key +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
				+ "<a href='http://"+inetAddress.getHostAddress()+":"+request.getServerPort() + request.getContextPath() + "/login.do"+"'> :p 로그인</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";

		try {
			mail.setSubject("MS :p 회원님의 임시 비밀번호가 발급되었습니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(mem_email));
			mailsender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}		
		
		// 데이터 베이스에 값 저장
		Member m = new Member(mem_id,mem_email,mem_name);
		
		//Member m = new Member( mEM_ID,  mEM_EMAIL,  mEM_NAME);
		
		m.setMem_pwd(key);
		//m.setMEM_PWD(key);
		mService.changePwd(m);
		
	}







	



	

}
