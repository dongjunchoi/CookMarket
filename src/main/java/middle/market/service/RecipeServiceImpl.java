package middle.market.service;

import java.util.List;

import middle.market.dao.RecipeDao;
import middle.market.dao.RecipeDaoImpl;
import middle.market.vo.RecipeReviewVO;
import middle.market.vo.RecipeVO;

public class RecipeServiceImpl implements RecipeService{

	//DAO 객체가 저장될 변수 선언 
	private RecipeDao dao ;
	private static RecipeServiceImpl service;
	
	private RecipeServiceImpl() {
		dao = RecipeDaoImpl.getInstance(); 
	}
	
	public static RecipeServiceImpl getInstance() {
		if(service == null) service = new RecipeServiceImpl();
		return service;
	}
	
	
		
	//전체 레시피 목록 조회 
	@Override
	public List<RecipeVO> viewAllRecipe() {
		return dao.viewAllRecipe();
	}
	
	
	// 레시피 하나 추가 
	@Override
	public int recipeInsert(RecipeVO vo) {
		return dao.recipeInsert(vo);
	}

	
	//레시피 삭제 
	@Override
	public int recipeDelete(String code) {
		return dao.recipeDelete(code);
	}

	//클릭한 레시피 1개의 정보 가져오기 
	@Override
	public RecipeVO viewOneRecipe(String rbcod) {
		return dao.viewOneRecipe(rbcod);
	}

	@Override
	public List<RecipeReviewVO> viewRecipeReply(String rb_cod) {
		return dao.viewRecipeReply(rb_cod);
	}

	@Override
	public int recipeReplyinsert(RecipeReviewVO vo) {
		// TODO Auto-generated method stub
		return dao.recipeReplyinsert(vo);
	}

	@Override
	public int alertRecipe(String rb_cod) {
		return dao.alertRecipe(rb_cod);
	}

	@Override
	public int deleteReply(String ba_cod) {
		return dao.deleteReply(ba_cod);
	}

	@Override
	public int updateReply(RecipeReviewVO vo) {
		return dao.updateReply(vo);
	}

	@Override
	public int deleteAllReply(String rb_cod) {
		return dao.deleteAllReply(rb_cod);
	}

	@Override
	public int RecipeUpdate(RecipeVO vo) {
		// TODO Auto-generated method stub
		return dao.RecipeUpdate(vo);
	}



}
