package middle.market.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.UserService;
import middle.market.service.UserServiceImpl;
import middle.market.vo.UserVO;
import middle.web.IAction;

public class ClientDetailAdmin implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("user_id");
		
		UserService service = UserServiceImpl.getInstance();
		
		UserVO uservo = service.UserView(id);
		
		request.setAttribute("userDetail", uservo);
		
		return "/admin/userDetail.jsp";
	}

}
