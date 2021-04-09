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
import middle.market.vo.UserVO;
import middle.web.IAction;

public class Qnaboard implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession(false);
		
		String id = (String)session.getAttribute("id");
		
		QnAService service = QnAServiceImpl.getInstance();
		UserService service1 = UserServiceImpl.getInstance();
		
		UserVO vo = service1.UserView(id);
		
		/*String name = service.userName(id);
		
		session.setAttribute("name", name);*/
		request.setAttribute("vo", vo);
		
		return "/qnaboard/Qnaboard.jsp";
	}

}
