package middle.market.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.UserServiceImpl;
import middle.market.vo.UserVO;
import middle.web.IAction;

public class SearchId implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		
		UserVO vo = new UserVO();
		
		vo.setName(name);
		vo.setEmail(email);
		
		UserServiceImpl service = UserServiceImpl.getInstance();
		HttpSession session = request.getSession();
		
		String resId = service.searchid(vo);

		if(resId == null) {
			return "/searchId.jsp";
		}else {
			session.setAttribute("resId", resId);
			request.setAttribute("resId", resId);
			return "/searchId.jsp";
		}
			
		
	}

}
