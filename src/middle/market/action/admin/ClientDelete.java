package middle.market.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.UserService;
import middle.market.service.UserServiceImpl;
import middle.web.IAction;

public class ClientDelete implements IAction {

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		UserService service = UserServiceImpl.getInstance();
		
		String id = request.getParameter("user_id");
		
		service.DeleteUser(id);
		
		
		
		return "/admin/clientAdmin.do";
	}

}
