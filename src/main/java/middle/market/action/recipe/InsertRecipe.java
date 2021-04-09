package middle.market.action.recipe;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import middle.market.service.RecipeServiceImpl;
import middle.market.vo.RecipeVO;
//import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class InsertRecipe
 */
@WebServlet("/insertrecipe.po")
@MultipartConfig(fileSizeThreshold=1024*1024*10 , 
maxFileSize=1024*2024*30, maxRequestSize=1024*1024*50)


public class InsertRecipe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
//업로드된 파일이 저장될 폴더명 
	
	private final String UPLOAD_DIR = "image"; //업로드된 파일이 저장될 폴더명 
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자가 업로드한 파일이 저장될 서버쪽의 폴더 경로 설정 
		String applicationPath = "D:/A_TeachingMaterial/4.MiddleProject/workspace/CookMarket/WebContent";
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String uploadPath = applicationPath + "/" + UPLOAD_DIR ;
		
		 
		 
	      int sizeLimit = 1024*1024*15;
	      
	      MultipartRequest multi = new MultipartRequest(request, uploadPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	      
	      
	      
			String id = "coral"; 

			String cont = multi.getParameter("cont");
			System.out.println("검사컨트롤러 : " + cont);

			String rtitle = multi.getParameter("rtitle");  
			System.out.println("검사컨트롤러 타이틀 : " + rtitle);

			String fileName = multi.getFilesystemName("rfile");
			System.out.println( "검사 컨트롤러 : " + fileName);
			
			String filePath = uploadPath + "/" + fileName;
			System.out.println("검사 컨트롤러 패스  : " + uploadPath );

			
		
			
			
			
			RecipeVO vo = new RecipeVO();

			
			vo.setId(id);

			vo.setRb_content(cont);

			vo.setRb_title(rtitle);
			
			vo.setFile_path(filePath);
			vo.setFilename(fileName);

			//service 객체 받아오기 


			RecipeServiceImpl service = RecipeServiceImpl.getInstance();

			//vo 를 insert 해서 레시피 등록하기 

			int res = service.recipeInsert(vo);
			System.out.println("res : " + res);
			
			
			/*request.setAttribute("filePath", filePath);*/
			
			//request.getRequestDispatcher("/WEB-INF/view/recipe/recipemain.jsp").forward(request, response);
			
			response.sendRedirect(request.getContextPath() + "/recipe/recipemain.do");
		
			
	}

}
