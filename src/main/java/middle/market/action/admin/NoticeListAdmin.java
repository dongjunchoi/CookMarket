package middle.market.action.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.NoticeService;
import middle.market.service.NoticeServiceImpl;
import middle.market.vo.NoticeVO;
import middle.web.IAction;

public class NoticeListAdmin implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		NoticeService noticeService = NoticeServiceImpl.getInstance();
		List<NoticeVO> noticeList = noticeService.getAllNoticeList();
		
		request.setAttribute("noticeList", noticeList);
		return "/admin/noticeListAdmin.jsp";
	}

}
