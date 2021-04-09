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

public class Paygrocery implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("id");
		
		UserService userservice = UserServiceImpl.getInstance();
		UserVO uservo = userservice.UserView(id);
		
		//유저 포인트 가져오기
		int point = Integer.parseInt(uservo.getPoint());
		int money = Integer.parseInt(request.getParameter("price"));
		int res = (point - money);
		String res1 = Integer.toString(res);
		
		uservo.setPoint(res1);
		uservo.setId(id);
		userservice.resPoint(uservo);
		
		return "/pay/payresult.jsp";
	}

}
