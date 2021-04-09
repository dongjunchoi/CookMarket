package middle.market.action.user;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.UserServiceImpl;
import middle.market.vo.UserVO;
import middle.web.IAction;

public class Mail implements IAction{

	

		@Override
		public boolean isRedirect() {
			// TODO Auto-generated method stub
			return false;
		}
		
		// 계정
		static final String USER = "choidongjun0@naver.com";
		// 비밀번호
		static final String PASSWORD = "dongjun12!";
		
		@Override
		public String process(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
			
			String email = request.getParameter("email");
			
			//1.받는사람, 메일제목, 내용
			String mail_EncodingType = "EUC-KR";
			
			//2. Property에 SMTP 서버 정보를 설정
			Properties prop = new Properties();
			String host = "smtp.naver.com";
			int port = 465; 
			
			// SMTP 서버명
			prop.put("mail.smtp.host", host);
			
			// SMTP 포트명
			prop.put("mail.smtp.port", port);
			
			// 권한 설정, SSL 연결
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.ssl.enable", "true");
			prop.put("mail.smtp.ssl.trust", host);
			
			prop.put("mail.mime.charset", mail_EncodingType);
			
			// 세션 인스턴스화
			Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(USER, PASSWORD);
				}
			});
		//	session.setDebug(true);
			//인증 번호 생성기
	        StringBuffer temp =new StringBuffer();
	        Random rnd = new Random();
	        for(int i=0;i<10;i++)
	        {
	            int rIndex = rnd.nextInt(3);
	            switch (rIndex) {
	            case 0:
	                // a-z
	                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
	                break;
	            case 1:
	                // A-Z
	                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
	                break;
	            case 2:
	                // 0-9
	                temp.append((rnd.nextInt(10)));
	                break;
	            }
	        }
	        String authKey = temp.toString();
	        System.out.println(authKey);
	        
	        //메일 보내기
			try {
//				if(!(email.equals(null))){
					MimeMessage message = new MimeMessage(session);
					
					// 발신자
					message.setFrom(new InternetAddress(USER));
					
					// 수신자 메일주소
					message.addRecipient(Message.RecipientType.TO,  new InternetAddress(email));
					
					// subject (메일 제목)
					message.setSubject("[TTIT]요청하신 인증번호를 알려드립니다. ");
					
					// text (메일 내용)
					message.setText("요청하신 인증 번호는 "+authKey +"입니다.");
					
					// 메일 전송
					Transport.send(message);
					
					HttpSession sessionAuthKey = request.getSession(); 
					sessionAuthKey.setAttribute("authKey", authKey);
					
					request.setAttribute("authKey", authKey);
					System.out.println("인증번호 전송 완료");
//				}else{
//					System.out.println("오류 - 메일 제목 또는 내용을 받아올 수 없습니다");
//					return null;
//				}
			}catch(AddressException e){
				e.printStackTrace();
			}catch(MessagingException e){
				e.printStackTrace();
			}
			return "/mail.jsp";
		}

	}

