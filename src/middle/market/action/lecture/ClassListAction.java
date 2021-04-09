package middle.market.action.lecture;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.ClassService;
import middle.market.service.ClassServiceImpl;
import middle.market.vo.ClassVO;
import middle.web.IAction;

public class ClassListAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ClassService classService = ClassServiceImpl.getInstance();
		List<ClassVO> classList = classService.getAllClassList();
		
		request.setAttribute("classList", classList);
		return "/class/classList.jsp";
	}

}

























