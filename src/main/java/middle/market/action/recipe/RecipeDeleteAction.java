package middle.market.action.recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.RecipeServiceImpl;
import middle.web.IAction;

public class RecipeDeleteAction implements IAction {

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		RecipeServiceImpl service = RecipeServiceImpl.getInstance();

		String rbcod = request.getParameter("rbcod"); 
		System.out.println("컨트롤러에서 rbcod 검사 : " + rbcod);
			
	
			int res1 = service.deleteAllReply(rbcod);
			System.out.println("댓글 삭제 검사 : " + res1);
			int res2 = service.recipeDelete(rbcod); 
			System.out.println("글 삭제 검사 : " + res2);
			return  "/recipe/recipemain.do";
		
		
		
	}

}
