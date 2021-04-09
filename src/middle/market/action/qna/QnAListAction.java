package middle.market.action.qna;

import java.io.IOException;
import java.util.List;

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

public class QnAListAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		QnAService qnaService = QnAServiceImpl.getInstance();
		UserService service = UserServiceImpl.getInstance();
		
		String id = (String) session.getAttribute("id");
		
		UserVO vo = service.UserView(id);
		List<QnAVO> qnaList = qnaService.getAllQnAList();
		
		request.setAttribute("vo", vo);
		request.setAttribute("qnaList", qnaList);
		return "/qna/qnaList.jsp";
	}
	
}















