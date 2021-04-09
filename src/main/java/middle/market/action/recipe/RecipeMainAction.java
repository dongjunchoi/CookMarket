package middle.market.action.recipe;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.RecipeService;
import middle.market.service.RecipeServiceImpl;
import middle.market.vo.RecipeVO;
import middle.web.IAction;

public class RecipeMainAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//레시피서비스의 service 객체 받아오기
		RecipeService reService = RecipeServiceImpl.getInstance();
		
		//전체 레시피 리스트 받아오기 
		
		List<RecipeVO> recipeList = reService.viewAllRecipe();
	
		request.setAttribute("recipeList", recipeList);
		
		
		return "/recipe/recipemain.jsp";
	}

}
