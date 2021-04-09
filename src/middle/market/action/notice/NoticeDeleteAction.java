package middle.market.action.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.NoticeService;
import middle.market.service.NoticeServiceImpl;
import middle.web.IAction;

public class NoticeDeleteAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String n_title = request.getParameter("n_title");
		
		NoticeService service = NoticeServiceImpl.getInstance();
		
		service.deleteNotice(n_title);
		return "/notice/noticeList.do";
	}
	
}
