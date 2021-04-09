package middle.market.action.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.UserService;
import middle.market.service.UserServiceImpl;
import middle.market.vo.UserVO;
import middle.web.IAction;

public class ClientAdmin implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		UserService service = UserServiceImpl.getInstance();
		
		List<UserVO> list = service.AllUser();	
		request.setAttribute("list", list);
		
		return "/admin/clientAdmin.jsp";
	}
}
