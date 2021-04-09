package middle.market.action.lecture;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.ClassService;
import middle.market.service.ClassServiceImpl;
import middle.market.vo.ClassReviewVO;
import middle.web.IAction;

public class ClassReviewUpdateAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		ClassService reService = ClassServiceImpl.getInstance();
		String bacod = request.getParameter("bacod");
		String cont = request.getParameter("cont"); 
		
		
		ClassReviewVO vo = new ClassReviewVO();  
		
		vo.setCr_cod(bacod);
		vo.setCr_content(cont);;
		
		
		int res = reService.updateClassReview(vo);
		
		request.setAttribute("res", res);
		
		
		return "/class/classReviewUpdate.jsp";
	}

}
