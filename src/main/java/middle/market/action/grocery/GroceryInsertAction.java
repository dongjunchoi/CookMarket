package middle.market.action.grocery;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import middle.market.service.GroceryService;
import middle.market.service.GroceryServiceImpl;
import middle.market.vo.GroceryVO;
import middle.web.IAction;

public class GroceryInsertAction implements IAction {
	
	
	// 파일을 저장할 폴더명 
	private final String UPLOAD_DIR = "image"; 

	@Override
	public boolean isRedirect() {
		return true;    // process()의 반환값이 요청URI일 경우에는 true를 반환하도록한다.
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		//서버쪽 폴더 경로 설정 
		String path = "D:/A_TeachingMaterial/4.MiddleProject/workspace/CookMarket/WebContent";
		request.setCharacterEncoding("utf-8");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String uploadPath = path +    File.separator    +  UPLOAD_DIR;

		int sizeLimit = 1024*1024*15;
		
		MultipartRequest multi = new MultipartRequest(request,uploadPath , sizeLimit , "utf-8" ,  new DefaultFileRenamePolicy()); 
		
		
		String g_name = multi.getParameter("g_name");
		String g_price = multi.getParameter("g_price");
		String fileName = multi.getFilesystemName("gfile"); 
		
		
		
		GroceryVO groceryVo = new GroceryVO();

		
		groceryVo.setG_name(g_name);
		groceryVo.setG_price(g_price);
		groceryVo.setFilename(fileName);
		
		GroceryService service = GroceryServiceImpl.getInstance();
		
		service.insertGrocery(groceryVo);
		//든든하다
		return "/grocery/groceryList.do";
	}
}

