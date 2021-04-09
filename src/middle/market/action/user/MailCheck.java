package middle.market.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.web.IAction;

public class MailCheck implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
	
		String authKey = (String) session.getAttribute("authKey");
	
		String Certification = request.getParameter("Certificationbtn_1");
		if(authKey.equals(Certification)) {
			request.setAttribute("Certification",Certification);
		}

		
		return "/mailCheck.jsp";
	}

}
