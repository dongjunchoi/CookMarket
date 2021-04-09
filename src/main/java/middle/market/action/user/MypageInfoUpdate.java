package middle.market.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.UserService;
import middle.market.service.UserServiceImpl;
import middle.web.IAction;

public class MypageInfoUpdate implements IAction {

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
		
		String email = (String)request.getAttribute("email");
		
		
		
		return null;
	}

}
