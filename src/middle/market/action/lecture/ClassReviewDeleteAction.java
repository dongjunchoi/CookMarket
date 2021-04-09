package middle.market.action.lecture;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.ClassService;
import middle.market.service.ClassServiceImpl;
import middle.web.IAction;

public class ClassReviewDeleteAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String bacod = request.getParameter("bacod"); 
		ClassService reService = ClassServiceImpl.getInstance();
		
		int res = reService.deleteClassReview(bacod);
		request.setAttribute("res", res);
		
		return "/class/classReviewDelete.jsp";
	}

}
