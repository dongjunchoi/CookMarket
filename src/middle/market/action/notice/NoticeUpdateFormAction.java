package middle.market.action.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.NoticeService;
import middle.market.service.NoticeServiceImpl;
import middle.market.vo.NoticeVO;
import middle.web.IAction;

public class NoticeUpdateFormAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String n_title = request.getParameter("n_title");
		
		NoticeService service = NoticeServiceImpl.getInstance();
		
		NoticeVO noticeVo = service.getNotice(n_title);
		
		request.setAttribute("noticeVo", noticeVo);
		System.out.println("dd");
		return "/notice/noticeUpdateForm.jsp";
	}
	
	
}
