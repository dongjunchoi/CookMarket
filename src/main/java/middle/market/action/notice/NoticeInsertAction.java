package middle.market.action.notice;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.NoticeService;
import middle.market.service.NoticeServiceImpl;
import middle.market.vo.NoticeVO;
import middle.web.IAction;

public class NoticeInsertAction implements IAction {

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
		
		HttpSession session = request.getSession(false);
		
		String m_name = (String)session.getAttribute("name");
		//String m_name = request.getParameter("m_name");
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		Date date = new Date();
		
		String time = format1.format(date);
		
		NoticeVO noticeVo = new NoticeVO();
		noticeVo.setN_code(time);
		noticeVo.setN_title(n_title);
		noticeVo.setN_content(n_content);
		noticeVo.setN_name(m_name);
		
		
		NoticeService service = NoticeServiceImpl.getInstance();
		
		service.insertNotice(noticeVo);
		
		return "/notice/noticeList.do";
	}

	
	
}
