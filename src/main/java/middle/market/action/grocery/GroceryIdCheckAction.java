package middle.market.action.grocery;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import middle.market.service.GroceryService;
import middle.market.service.GroceryServiceImpl;
import middle.web.IAction;

public class GroceryIdCheckAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");

		String grocery_cod = request.getParameter("grocery_cod");
		GroceryService service = GroceryServiceImpl.getInstance();
		
		int cnt = service.getGroceryCount(grocery_cod);
		
		Gson gson = new Gson();
		String result = null;
		
		if(cnt==1){ // 중복되는 경우
			result = gson.toJson("Fail");
		}else{ // 중복되지 않을 경우
			result = gson.toJson("OK");
		}
		
		PrintWriter out = response.getWriter();
		out.println(result);
		response.flushBuffer();
		
		return null;  // Ajax로 호출한 Action객체의 반환값은 null로 한다.
	}

}
