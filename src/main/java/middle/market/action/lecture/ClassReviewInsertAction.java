package middle.market.action.lecture;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.ClassServiceImpl;
import middle.market.service.RecipeService;
import middle.market.service.RecipeServiceImpl;
import middle.market.vo.ClassReviewVO;
import middle.market.vo.RecipeReviewVO;
import middle.web.IAction;


import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import middle.market.service.RecipeServiceImpl;

import middle.market.vo.RecipeReviewVO;

import middle.web.IAction;



public class ClassReviewInsertAction implements IAction {

  public boolean isRedirect() {

    return false;

  }

  

  public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    request.setCharacterEncoding("utf-8");

    String baCont = request.getParameter("replyCont");

    String rbCod = request.getParameter("rbcod");

    ClassReviewVO vo = new ClassReviewVO();

    
    vo.setClass_cod(rbCod);
    
    
    vo.setCr_content(baCont);



    vo.setId("coral");
    
    
    
    
    
    System.out.println(baCont);
    
    System.out.println(rbCod);

    ClassServiceImpl service = ClassServiceImpl.getInstance();

    //res = 1 이면 insert 성공 0 이면 실패 

    int res = service.insertClassReview(vo);
    System.out.println(res);
    

    

    request.setAttribute("res", res);

    

    //<이수정>

    return "/class/classReviewInsert.jsp" ;

  }

}

