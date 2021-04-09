package middle.market.action.lecture;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import middle.market.service.ClassService;
import middle.market.service.ClassServiceImpl;
import middle.market.vo.ClassVO;
import middle.web.IAction;

public class ClassInsertAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String savePath = "D:\\A_TeachingMaterial\\4.MiddleProject\\workspace\\CookMarket\\WebContent\\upload";
		int sizeLimit = 1024*1024*15;
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession(false);
		
		String title = multi.getParameter("ctitle");
		String id = "coral";
		String content = multi.getParameter("content");
		content = content.replace("\r\n", "<br>");
		String startDate = multi.getParameter("startDate");
		String endDate = multi.getParameter("endDate");
		String price = multi.getParameter("price");
		String status = multi.getParameter("status");
		String fileName = multi.getFilesystemName("cfile");
		
		String filePath = savePath + "/" + fileName;
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		Date date = new Date();
		
		String time = format1.format(date);
		
		ClassVO classVo = new ClassVO();
		
		classVo.setClass_cod(time);
		classVo.setClass_name(title);
		classVo.setId(id);
		classVo.setCb_content(content);
		classVo.setC_startDate(startDate);
		classVo.setC_endDate(endDate);
		classVo.setClass_price(price);
		classVo.setC_status(status);
		classVo.setFile_path(filePath);
		classVo.setFileName(fileName);
		
		
		ClassService service = ClassServiceImpl.getInstance();
		
		service.insertClass(classVo);
		
		System.out.println(filePath);
		
		request.setAttribute("filePath", filePath);
		
		
		return "/class/classList.do";
	}

}



























