package middle.market.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.NoticeService;
import middle.market.service.NoticeServiceImpl;
import middle.market.vo.NoticeVO;
import middle.web.IAction;

public class NoticeViewAdmin implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String n_title = request.getParameter("n_title");
		System.out.println(n_title);
		
		NoticeService service = NoticeServiceImpl.getInstance();
		
		NoticeVO noticeVo = service.getNotice(n_title);
		
		request.setAttribute("noticeVo", noticeVo);
		
		return "/admin/noticeViewAdmin.jsp";
	}

}
