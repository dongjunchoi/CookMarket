package middle.market.action.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.QnAService;
import middle.market.service.QnAServiceImpl;
import middle.market.vo.QnAVO;
import middle.web.IAction;

public class QnAUpdateAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String q_cod = request.getParameter("q_cod");
		String q_content = request.getParameter("q_content");
		String qq_cod = request.getParameter("qq_cod");
		
		QnAVO qnaVo = new QnAVO();
		
		qnaVo.setQ_content(q_content);
		qnaVo.setQq_cod(qq_cod);
		qnaVo.setQ_cod(q_cod);
		
		QnAService service = QnAServiceImpl.getInstance();
		
		service.updateQnA(qnaVo);
		
		return "/qna/qnaList.do";
	}

}

















