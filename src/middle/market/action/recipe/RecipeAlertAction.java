package middle.market.action.recipe;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.RecipeServiceImpl;
import middle.web.IAction;



public class RecipeAlertAction implements IAction {



	@Override

	public boolean isRedirect() {

		return false;

	}



	@Override

	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String rbcod = request.getParameter("rbcod");

		
		RecipeServiceImpl service = RecipeServiceImpl.getInstance();


		// 해당 레시피에 대해서 신고하면 alert 컬럼에 'x' 가 표시 

		int res = service.alertRecipe(rbcod); 
		System.out.println(res);
		request.setAttribute("res", res);
		

		//관리자에게 신고가 들어가면 메일로 알려주기 

		// 클래스 main 으로 했는데, https://heodolf.tistory.com/99 이렇게 해도 가능한가? 

		// 위에 url 들어가서 실행부분 환경변수 설정해주어야함 

		

		//컨텐츠 인코딩

		final String bodyEncoding = "UTF-8";

		

		String subject = "관리자님 레시피 신고가 들어왔습니다.";

		//보낼 이메일 주소: . 

		String fromEmail = "leesujung0527@gmail.com"; 

		String fromUsername = "Cooke Market Manager";

		//받을 이메일 주소 : 관리자들의 이메일을 , 로 연결해서 여러개를 설정 가능 "이메일1, 이메일2 "; 

		String toEmail = "leesujung0527@gmail.com";

		//구글 계정 

		final String username = "leesujung0527@gmail.com";

		//발급받은 비밀번호

		final String password = "ofcu fcfs viuz nagc"; 

		

		

		//메일에 출력할 텍스트

		

		StringBuffer sb = new StringBuffer();

		sb.append("<h1>안녕하세요 관리자님 알람이 왔습니다.</h1>\n");

		sb.append("<h4>" + rbcod + "게시글이 신고가 들어왔습니다. 확인부탁드려요</h4>\n");

		String html = sb.toString();

		

		//메일 옵션 설정

		

		Properties props = new Properties();

		props.put("mail.transport.protocol", "smtp");

		 props.put("mail.smtp.host", "smtp.gmail.com");

	    props.put("mail.smtp.port", "465");

	    props.put("mail.smtp.auth", "true");

	 

	    props.put("mail.smtp.quitwait", "false");

	    props.put("mail.smtp.socketFactory.port", "465");

	    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

	    props.put("mail.smtp.socketFactory.fallback", "false");

	    

	    try {

	      // 메일 서버  인증 계정 설정]

	    	//import 는 찾아볼것 

	      Authenticator auth = new Authenticator() {

	        protected PasswordAuthentication getPasswordAuthentication() {

	          return new PasswordAuthentication(username, password);

	        }

	      };

	      

	      // 메일 세션 생성

	      Session session = Session.getInstance(props, auth);

	      

	      // 메일 송/수신 옵션 설정

	      Message message = new MimeMessage(session);

	      message.setFrom(new InternetAddress(fromEmail, fromUsername));

	      message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));

	      message.setSubject(subject);

	      message.setSentDate(new Date());

	      

	      // 메일 콘텐츠 설정

	      Multipart mParts = new MimeMultipart();

	      MimeBodyPart mTextPart = new MimeBodyPart();

	      MimeBodyPart mFilePart = null;

	 

	      // 메일 콘텐츠 - 내용

	      mTextPart.setText(html, bodyEncoding, "html");

	      mParts.addBodyPart(mTextPart);

	            

	      // 메일 콘텐츠 설정

	      message.setContent(mParts);

	      

	      // MIME 타입 설정

	      MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();

	      MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");

	      MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");

	      MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");

	      MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");

	      MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");

	      CommandMap.setDefaultCommandMap(MailcapCmdMap);

	 

	      // 메일 발송

	      Transport.send( message );

	      

	    } catch ( Exception e ) {

	      e.printStackTrace();

	    }

	

		

		

		return "/recipe/recipeAlert.jsp";

	}



}