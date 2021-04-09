package middle.market.action.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.NoticeService;
import middle.market.service.NoticeServiceImpl;
import middle.market.vo.NoticeVO;
import middle.web.IAction;

public class NoticeUpdateAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		String m_name = request.getParameter("m_name");
		
		NoticeVO noticeVo = new NoticeVO();
		
		noticeVo.setN_title(n_title);
		noticeVo.setN_content(n_content);
		noticeVo.setN_name(m_name);
		
		NoticeService service = NoticeServiceImpl.getInstance();
		
		service.updateNotice(noticeVo);
		
		return "/notice/noticeList.do";
	}

}

















