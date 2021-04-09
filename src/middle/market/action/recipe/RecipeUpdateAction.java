package middle.market.action.recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.RecipeServiceImpl;
import middle.market.vo.RecipeVO;
import middle.web.IAction;

public class RecipeUpdateAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String rbCod = request.getParameter("rbcod");
		String cont = request.getParameter("cont");
		
		System.out.println("확인용 : " + rbCod);
		System.out.println("확인용 내용 :" + cont);
		
		RecipeVO vo = new RecipeVO(); 
		
		vo.setRb_cod(rbCod);
		vo.setRb_content(cont);

		
		
		RecipeServiceImpl service = RecipeServiceImpl.getInstance();
		
		
		int res = service.RecipeUpdate(vo);
		System.out.println(res);
		
		 request.setAttribute("res", res);
		
		return "/recipe/recipeUpdateCheck.jsp";
	}

}
