package middle.market.action.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.NoticeService;
import middle.market.service.NoticeServiceImpl;
import middle.market.service.UserService;
import middle.market.service.UserServiceImpl;
import middle.market.vo.NoticeVO;
import middle.market.vo.UserVO;
import middle.web.IAction;

public class NoticeListAction implements IAction{

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
		
		HttpSession session =request.getSession();
		UserService service = UserServiceImpl.getInstance();
		UserVO vo = new UserVO();
		
		String id = (String)session.getAttribute("id");
		
		vo = service.UserView(id);
		
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("vo", vo);
		return "/notice/noticeList.jsp";
	}
	
}















