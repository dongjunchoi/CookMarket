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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.UserServiceImpl;
import middle.market.vo.UserVO;
import middle.web.IAction;

public class SearchPass implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		UserVO vo = new UserVO();
		
		vo.setId(id);
		vo.setEmail(email);
		
		UserServiceImpl service = UserServiceImpl.getInstance();
		HttpSession session = request.getSession();
		
		String resPass = service.searchPass(vo);
		
		if(resPass==null) {
			return "/searchPass.jsp";
		}else {
			session.setAttribute("resPass", resPass);
			request.setAttribute("resPass", resPass);
			return "/searchPass.jsp";
		}
	}

}
