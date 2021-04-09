package middle.market.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.UserService;
import middle.market.service.UserServiceImpl;
import middle.market.vo.UserVO;
import middle.web.IAction;

public class MyinformationAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		UserService service = UserServiceImpl.getInstance();
		
		String id = (String)session.getAttribute("id");
		
		UserVO vo = service.UserView(id);
		
		request.setAttribute("vo", vo);
		
		return "/mypage/Myinformation.jsp";
	}

}
