package middle.market.action.qna;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.QnAService;
import middle.market.service.QnAServiceImpl;
import middle.market.vo.QnAVO;
import middle.web.IAction;

public class QnAInsertAction implements IAction {

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String q_content = request.getParameter("q_content");
		String qq_cod = request.getParameter("qq_cod");
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		Date date = new Date();
		
		String time = format1.format(date);
		
		QnAVO qnaVo = new QnAVO();
		
		qnaVo.setQ_cod(time);
		qnaVo.setId(id);
		qnaVo.setQ_content(q_content);
		qnaVo.setQq_cod(qq_cod);
		
		
		QnAService service = QnAServiceImpl.getInstance();
		service.insertQnA(qnaVo);
		
		
		
		return "/qna/qnaList.do";
	}

	
	
}
