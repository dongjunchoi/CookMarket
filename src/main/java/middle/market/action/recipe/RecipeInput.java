package middle.market.action.recipe;


import java.io.IOException;



import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.RecipeServiceImpl;

import middle.market.vo.RecipeVO;

import middle.web.IAction;



public class RecipeInput implements IAction {



	

	

	

	@Override

	public boolean isRedirect() {

		return false;

	}



	@Override

	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		//String id = 로그인해서 받아온 아이디

		//반드시 고치기 1 임의로 설정해줌. 

		//String id = "coral"; 

		HttpSession session = request.getSession(false);
		    
		String id = (String)session.getAttribute("id");
		    
		String cont = request.getParameter("cont");

		String title = request.getParameter("title");  

		

		RecipeVO vo = new RecipeVO();

		vo.setId(id);

		vo.setRb_content(cont);

		vo.setRb_title(title);

		

		//service 객체 받아오기 

		RecipeServiceImpl service = RecipeServiceImpl.getInstance();

		//vo 를 insert 해서 레시피 등록하기 

		int res = service.recipeInsert(vo); 

		

		//첨부파일을 넣기 위해서 만들어진 rb_cod 를 코드를 가지고 온다. 

		// https://bin-repository.tistory.com/116 (후...) 

		

		

		

		

		

		

		return null;

	}



}