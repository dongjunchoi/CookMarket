package middle.market.action.recipe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.RecipeServiceImpl;
import middle.market.vo.RecipeReviewVO;
import middle.web.IAction;



public class RecipeReviewAction implements IAction {

  public boolean isRedirect() {

    return false;

  }

  

  public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    request.setCharacterEncoding("utf-8");

    String baCont = request.getParameter("replyCont");

    String rbCod = request.getParameter("rbcod");

    RecipeReviewVO vo = new RecipeReviewVO();

    //session 연결
    HttpSession session = request.getSession(false);
    
    String id = (String)session.getAttribute("id");
    
    //String id = "coral";
    
    vo.setBa_content(baCont);

    vo.setRb_cod(rbCod);
   

//    세션 연결하면 이부분 고치기 중요!!!!!!!!!!!!
    //vo.setId(id);
    vo.setId(id);
    
  
    
    
    
    System.out.println(baCont);
    
    System.out.println(rbCod);

    RecipeServiceImpl service = RecipeServiceImpl.getInstance();

    //res = 1 이면 insert 성공 0 이면 실패 

    int res = service.recipeReplyinsert(vo);
    System.out.println(res);
    

    

    request.setAttribute("res", res);

    

    //<이수정>

    return "/recipe/recipeReplyInsert.jsp" ;

  }

}

