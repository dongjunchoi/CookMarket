package middle.market.action.lecture;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.ClassService;
import middle.market.service.ClassServiceImpl;
import middle.market.vo.ClassReviewVO;
import middle.market.vo.ClassVO;
import middle.web.IAction;

public class ClassViewAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String class_cod = request.getParameter("class_cod");
		System.out.println(class_cod);
		
		ClassService service = ClassServiceImpl.getInstance();
		
		ClassVO classVo = service.getClass(class_cod);
		
		request.setAttribute("classVo", classVo);
		
		List<ClassReviewVO> reviewList = service.getAllClassReviewList(class_cod);
		request.setAttribute("reviewList", reviewList);
		
		return "/class/classView.jsp";
	}

}
