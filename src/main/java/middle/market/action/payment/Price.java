package middle.market.action.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.GroceryService;
import middle.market.service.GroceryServiceImpl;
import middle.market.service.OrderService;
import middle.market.service.OrderServiceImple;
import middle.market.service.UserService;
import middle.market.service.UserServiceImpl;
import middle.market.vo.GroceryVO;
import middle.market.vo.OrderVO;
import middle.market.vo.UserVO;
import middle.web.IAction;

public class Price implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		UserService service = UserServiceImpl.getInstance();
		GroceryService service2 = GroceryServiceImpl.getInstance();
		OrderService oservice = OrderServiceImple.getInstance();
		
		String id= (String) session.getAttribute("id");
		String grocery_cod = request.getParameter("grocery_cod");
		int count = Integer.parseInt(request.getParameter("count"));
		
		GroceryVO vo2 = service2.getGrocery(grocery_cod);
		UserVO vo = service.UserView(id);
		OrderVO ordervo = new OrderVO();
		
		int sum = (Integer.parseInt(vo2.getG_price())*count);
		int point = Integer.parseInt(vo.getPoint());
		int sum2 = sum + 3000;
		
		String result = "";
		
		if(point < sum2) {
			request.setAttribute("cod", grocery_cod);
			result =  "/pay/notsale.jsp";
		} else {
			String pr_cod = vo2.getGrocery_cod();
			int order_price = Integer.parseInt(vo2.getG_price());
			String pr_name = vo2.getG_name();
			
			ordervo.setId(id);
			ordervo.setPr_cod(pr_cod);
			ordervo.setOrder_price(order_price);
			ordervo.setPr_name(pr_name);
			ordervo.setPr_count(count);
			
			int a = oservice.insertOrder(ordervo);
			if(a != 1) {
				result =  "/pay/notsale.jsp";
			} else {
				request.setAttribute("vo2", vo2);
				request.setAttribute("vo", vo);
				request.setAttribute("count", count);
				request.setAttribute("sum", sum);
				request.setAttribute("sum2", sum2);
				result =  "/pay/price.jsp";
			}
		}
		return result;
	}
}
