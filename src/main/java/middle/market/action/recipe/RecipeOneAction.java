package middle.market.action.recipe;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.RecipeService;
import middle.market.service.RecipeServiceImpl;
import middle.market.vo.RecipeReviewVO;
import middle.market.vo.RecipeVO;
import middle.web.IAction;

public class RecipeOneAction implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//pk 컬럼인 rb_cod 를 받아왔다. 
		String rbcod = request.getParameter("rbcod"); 
		//service 객체 받아오기 
		RecipeService reService = RecipeServiceImpl.getInstance(); 
		
		// 레시피의 컬럼 정보들 받아오기 
		
		RecipeVO vo = reService.viewOneRecipe(rbcod); 
		
		request.setAttribute("oneRecipe", vo);
		
		//이 1개의 레시피에 대한(rb_cod 가 같은 ) 댓글목록 전체 list 가져오기 
		
		List<RecipeReviewVO> replyList = reService.viewRecipeReply(rbcod);  
		request.setAttribute("replylist", replyList );
		
//		//[id1, 내용] , [id2, 내용]...
//		ArrayList<String> outerList = new ArrayList<String>(); 
//		
//		// [id, 내용]
//		ArrayList<String> innerList = new ArrayList<String>(); 
//		
//		for(int i = 0 ; i < replyList.size(); i++) {
//			innerList.add(replyList.get(i).getId());
//			innerList.add(replyList.get(i).getBa_content()); 
//			
//			outerList.addAll(innerList);
//			
//		}
//		
//		System.out.println("검사용" + outerList);
//					
//		
//		request.setAttribute("replylist", outerList);
//		
		
		return "/recipe/recipeone.jsp";
	}

}
