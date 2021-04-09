package middle.market.action.lecture;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import middle.market.service.ClassService;
import middle.market.service.ClassServiceImpl;
import middle.market.vo.ClassVO;
import middle.web.IAction;

public class ClassUpdateAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String savePath = "D:\\A_TeachingMaterial\\4.MiddleProject\\workspace\\CookMarket\\WebContent\\upload";
		int sizeLimit = 1024*1024*15;
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		request.setCharacterEncoding("utf-8");
		String class_cod = multi.getParameter("class_cod");
		String ctitle = multi.getParameter("ctitle");
		String content = multi.getParameter("content");
		String startDate = multi.getParameter("startDate");
		String endDate = multi.getParameter("endDate");
		String price = multi.getParameter("price");
		String status = multi.getParameter("status");
		String fileName = multi.getFilesystemName("cfile");
		
		String filePath = savePath + "/" + fileName;
		
		ClassVO classVo = new ClassVO();
		
		classVo.setClass_name(ctitle);
		classVo.setCb_content(content);
		classVo.setC_startDate(startDate);
		classVo.setC_endDate(endDate);
		classVo.setClass_price(price);
		classVo.setC_status(status);
		classVo.setFileName(fileName);
		classVo.setFile_path(filePath);
		classVo.setClass_cod(class_cod);
		
		
		ClassService service = ClassServiceImpl.getInstance();
		
		service.updateClass(classVo);
		
		//request.setAttribute("classVo", classVo);
		
		//return "/class/classView.jsp";
		return "/class/classView.do?class_cod=" + class_cod;
	}

}
