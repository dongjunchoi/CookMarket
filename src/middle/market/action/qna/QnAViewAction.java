package middle.market.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.QnAService;
import middle.market.service.QnAServiceImpl;
import middle.market.service.UserService;
import middle.market.service.UserServiceImpl;
import middle.market.vo.QnAVO;
import middle.market.vo.UserVO;
import middle.web.IAction;

public class QnAViewAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String q_cod = request.getParameter("q_cod");
		
		UserService service1 = UserServiceImpl.getInstance();
		QnAService service = QnAServiceImpl.getInstance();
		
		UserVO vo = service1.UserView(id);
		QnAVO qnaVo = service.getQnA(q_cod);
		
		request.setAttribute("vo", vo);
		request.setAttribute("qnaVo", qnaVo);
		
		return "/qna/qnaView.jsp";
		
	}
	
}











