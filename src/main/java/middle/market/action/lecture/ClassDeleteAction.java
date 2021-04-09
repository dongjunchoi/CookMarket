package middle.market.action.lecture;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.ClassService;
import middle.market.service.ClassServiceImpl;
import middle.market.service.NoticeService;
import middle.market.service.NoticeServiceImpl;
import middle.web.IAction;

public class ClassDeleteAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String cbcod = request.getParameter("cbcod");
		
		
		
		
		ClassService service = ClassServiceImpl.getInstance();
		//관련된 댓글 전체 삭제 
		service.deleteAllReview(cbcod);
		
		service.deleteClass(cbcod);
		return "/class/classList.do";
	}
	
}
