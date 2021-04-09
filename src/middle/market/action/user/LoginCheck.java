package middle.market.action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import middle.market.service.UserServiceImpl;
import middle.market.vo.UserVO;
import middle.web.IAction;
import oracle.net.aso.g;

public class LoginCheck implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		//response.setContentType("application/json; charset=utf-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		UserServiceImpl service = UserServiceImpl.getInstance();
		
		String result = null;
		int cnt = 0;
		
			UserVO vo = new UserVO();
			
			vo.setId(id);
			vo.setPass(pass);
			cnt = service.loginCheckSelect(vo);
			
			if("admin".equals(id) && cnt==1) {
				return  "/admin/adminMain.jsp";
			}else if(cnt==1) {
				vo = service.UserView(id);
				request.setAttribute("vo", vo);
				result = "/loginpro.jsp";
			}else if(cnt != 1) {
				result = "/login.jsp";
			}
		System.out.println(result);
		return result;
		
		
	}

}
