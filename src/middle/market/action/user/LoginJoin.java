package middle.market.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middle.market.service.UserServiceImpl;
import middle.market.vo.UserVO;
import middle.web.IAction;
// 가입
public class LoginJoin implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
//		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String zip = request.getParameter("zip");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		UserVO vo = new UserVO();
		
		vo.setId(id);
		vo.setPass(pass);
		vo.setName(name);
		vo.setPhone(phone);
		vo.setEmail(email);
		vo.setZip(zip);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		
		UserServiceImpl service = UserServiceImpl.getInstance();
		
		String resId = service.insertMember(vo);
		
		request.setAttribute("resId", resId);
		
		return "/joinres.jsp";
	}

}
