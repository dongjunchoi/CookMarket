package middle.market.action.payment;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.ChargeService;
import middle.market.service.ChargeServiceImpl;
import middle.market.service.OrderService;
import middle.market.service.OrderServiceImple;
import middle.market.service.UserService;
import middle.market.service.UserServiceImpl;
import middle.market.vo.ChargeVO;
import middle.market.vo.OrderVO;
import middle.market.vo.UserVO;
import middle.web.IAction;

public class Coinmain implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession(false);
		
		String id =(String)session.getAttribute("id");
		ChargeService cservice = ChargeServiceImpl.getInstance();
		OrderService oservice = OrderServiceImple.getInstance();
		UserService service = UserServiceImpl.getInstance();
		
		UserVO vo = new UserVO();
		List<ChargeVO> clist = null;
		List<OrderVO> olist = null;
		if(id !=null) {
			clist = cservice.sCharge(id);
			olist = oservice.sOrder(id);
			vo = service.UserView(id);
		}
		request.setAttribute("vo", vo);
		request.setAttribute("clist", clist);
		request.setAttribute("olist", olist);
		
		
		
		return "/mypage/Coinmain.jsp";
	}

}
