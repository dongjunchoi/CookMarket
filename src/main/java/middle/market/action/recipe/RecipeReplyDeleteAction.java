package middle.market.action.recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.RecipeService;
import middle.market.service.RecipeServiceImpl;
import middle.web.IAction;

public class RecipeReplyDeleteAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String bacod = request.getParameter("bacod"); 
		System.out.println("검사 딜리트 엑션 : " + bacod);
		RecipeService reService = RecipeServiceImpl.getInstance();
		
		int res = reService.deleteReply(bacod);
		request.setAttribute("res", res);
		
		return "/recipe/recipeReplyDelete.jsp";
	}

}
