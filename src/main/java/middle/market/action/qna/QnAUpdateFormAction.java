package middle.market.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.QnAService;
import middle.market.service.QnAServiceImpl;
import middle.market.vo.QnAVO;
import middle.web.IAction;

public class QnAUpdateFormAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String q_cod = request.getParameter("q_cod");
		
		QnAService service = QnAServiceImpl.getInstance();
		
		QnAVO qnaVo = service.getQnA(q_cod);
		
		request.setAttribute("qnaVo", qnaVo);
		
		return "/qna/qnaUpdateForm.jsp";
	}
	
	
}
