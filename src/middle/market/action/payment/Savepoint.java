package middle.market.action.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.UserService;
import middle.market.service.UserServiceImpl;
import middle.market.vo.ChargeVO;
import middle.market.vo.UserVO;
import middle.web.IAction;

public class Savepoint implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserService service = UserServiceImpl.getInstance();
		
		HttpSession session = request.getSession(false);
		
		String id = (String)session.getAttribute("id");
		String money = (String)session.getAttribute("mon");
		
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPoint(money);
		
		ChargeVO vo2 = new ChargeVO();  
		vo2.setId(id);
		vo2.setCharge(Integer.parseInt(money));
		
		service.savePoing(vo);
		int res = service.savePointtext(vo2);
		
		session.removeAttribute("mon");
		session.removeAttribute("point");
		session.setAttribute("point", res);
		
		return "/mypage/Coinmain.do";
	}

}
