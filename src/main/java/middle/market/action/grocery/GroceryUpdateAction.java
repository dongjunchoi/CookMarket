package middle.market.action.grocery;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.GroceryService;
import middle.market.service.GroceryServiceImpl;
import middle.market.vo.GroceryVO;
import middle.web.IAction;

public class GroceryUpdateAction implements IAction {

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String grocery_cod = request.getParameter("grocery_cod");
		String g_name = request.getParameter("g_name");
		String g_price = request.getParameter("g_price");
		String seller_cod = request.getParameter("seller_cod");
		
		GroceryVO groceryVo = new GroceryVO();

		groceryVo.setGrocery_cod(grocery_cod);
		groceryVo.setG_name(g_name);
		groceryVo.setG_price(g_price);
		groceryVo.setSeller_cod(seller_cod);
		
		GroceryService service = GroceryServiceImpl.getInstance();
		
		service.updateGrocery(groceryVo);
		
		return "/grocery/groceryList.do";
	}

}
