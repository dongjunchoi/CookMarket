package middle.market.action.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.GroceryService;
import middle.market.service.GroceryServiceImpl;
import middle.market.vo.GroceryVO;
import middle.web.IAction;

public class Paymain implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		GroceryService service = GroceryServiceImpl.getInstance();
		String cod = request.getParameter("cod");
		
		GroceryVO vo = service.getGrocery(cod);
		
		request.setAttribute("vo", vo);
		
		return "/pay/paymain.jsp";
	}

}
