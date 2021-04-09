package middle.market.action.grocery;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.GroceryService;
import middle.market.service.GroceryServiceImpl;
import middle.market.vo.GroceryVO;
import middle.web.IAction;

public class GroceryViewUser implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		GroceryService service = GroceryServiceImpl.getInstance();
		
		List<GroceryVO> list = service.getAllGroceryList();
		
		request.setAttribute("list", list);
		
		return "/grocery/Foodmain.jsp";
	}

}
