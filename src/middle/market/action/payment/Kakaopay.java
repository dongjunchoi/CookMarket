package middle.market.action.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.UserService;
import middle.market.service.UserServiceImpl;
import middle.market.vo.UserVO;
import middle.web.IAction;

public class Kakaopay implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		UserService service = UserServiceImpl.getInstance();
		HttpSession session = request.getSession(false);
		
		String id = (String)session.getAttribute("id");
		String mon = request.getParameter("money");
		
		int money = Integer.parseInt(request.getParameter("money"));
		//String money = request.getParameter("money");
		//int money = Integer.parseInt(request.getParameter("test123"));
		
		session.setAttribute("mon", mon);
		
		UserVO vo = service.UserView(id);
		request.setAttribute("vo", vo);
		request.setAttribute("money", money);
		
		return "/pay/kakaopay2.jsp";
		//return null;
	}

}
