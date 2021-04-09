package middle.market.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.QnAService;
import middle.market.service.QnAServiceImpl;
import middle.web.IAction;

public class QnADeleteAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String q_cod = request.getParameter("q_cod");
		
		QnAService service = QnAServiceImpl.getInstance();
		
		service.deleteQnA(q_cod);
		return "/qna/qnaList.do";
	}
	
}
