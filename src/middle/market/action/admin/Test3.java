package middle.market.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.UserService;
import middle.market.service.UserServiceImpl;
import middle.web.IAction;

public class Test3 implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		UserService service = UserServiceImpl.getInstance();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		service.lastLogin(id);
		
		return "/logout.jsp";
	}

}
