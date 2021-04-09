package middle.market.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middle.market.service.UserService;
import middle.market.service.UserServiceImpl;
import middle.market.vo.UserVO;
import middle.web.IAction;

public class AddrUpdate implements IAction {

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		UserService service = UserServiceImpl.getInstance();
		
		UserVO vo = new UserVO();
		
		HttpSession session =request.getSession(false);
		String id = (String)session.getAttribute("id");
		String zip = request.getParameter("zip");
		String add1 = request.getParameter("add1");
		String add2 = request.getParameter("add2");
		
		vo.setZip(zip);
		vo.setAddr1(add1);
		vo.setAddr2(add2);
		vo.setId(id);
		
		service.addrUpdate(vo);
		
		return "/user/Myinformationupdate.do";
	}

}
