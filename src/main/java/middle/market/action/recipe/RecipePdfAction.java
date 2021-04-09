package middle.market.action.recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.RecipeService;
import middle.market.service.RecipeServiceImpl;
import middle.market.vo.RecipeVO;
import middle.web.IAction;

public class RecipePdfAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//레시피 코드를 받아옴 
		String rbcod = request.getParameter("rbcod");
		System.out.println("action 에서 rbcod :  " + rbcod);
		
		//레시피의 내용을 가져올것임
		
		RecipeService service = RecipeServiceImpl.getInstance();
		RecipeVO vo =  service.viewOneRecipe(rbcod);
		
		request.setAttribute("recipevo", vo);
		
		
		
		return "/recipe/recipePdf.jsp";
	}

}
