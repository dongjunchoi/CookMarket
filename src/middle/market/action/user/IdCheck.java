package middle.market.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.UserServiceImpl;
import middle.web.IAction;

public class IdCheck implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String intputId = request.getParameter("id");
		
		UserServiceImpl service = UserServiceImpl.getInstance();
		
		String resId = service.selectId(intputId);
		
		request.setAttribute("resId", resId);
		
		return "/idCheck.jsp";
	}

}
