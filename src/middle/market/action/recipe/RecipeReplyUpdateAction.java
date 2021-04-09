package middle.market.action.recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.RecipeService;
import middle.market.service.RecipeServiceImpl;
import middle.market.vo.RecipeReviewVO;
import middle.web.IAction;

public class RecipeReplyUpdateAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		RecipeService reService = RecipeServiceImpl.getInstance();
		String bacod = request.getParameter("bacod");
		String cont = request.getParameter("cont"); 
		
		
		RecipeReviewVO vo = new RecipeReviewVO();  
		
		vo.setBa_cod(bacod);
		vo.setBa_content(cont);
		
		int res = reService.updateReply(vo);
		
		request.setAttribute("res", res);
		
		
		return "/recipe/replyUpdate.jsp";
	}

}
