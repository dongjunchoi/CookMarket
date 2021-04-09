package middle.market.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import middle.market.vo.RecipeReviewVO;
import middle.market.vo.RecipeVO;
import middle.util.BuildedSqlMapClient;

public class RecipeDaoImpl implements RecipeDao{

	private SqlMapClient smc; 
	
	private static RecipeDaoImpl dao;
	
	private RecipeDaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	
	public static RecipeDaoImpl getInstance() {
		
		if(dao==null) dao = new RecipeDaoImpl();
		return dao;		
		
	}
	
	
	
	@Override
	public List<RecipeVO> viewAllRecipe() {
		List<RecipeVO> Recipelist = null ; 
		
		try {
			Recipelist = smc.queryForList("recipe.viewAllRecipe");
		} catch (SQLException e) {
			Recipelist = null ;
			e.printStackTrace();
		} 
		
		return Recipelist;
	}

	
	//insert 는 object 로 받아와서 null 이면 성공한것 	
	@Override
	public int recipeInsert(RecipeVO vo) {
		int res = 0 ;  // 작업이 성공하면 1 , 실패하면 0 으로 설정해줄것이다. 
		
		try {
			Object obj = smc.insert("recipe.recipeInsert" , vo);
			if(obj == null ) res = 1; 
		} catch (SQLException e) {
			res = 0 ; 
			e.printStackTrace();
		} 
		
		return res;
	}

	@Override
	public int recipeDelete(String code) {
		int res = 0; 
		try {
			res = smc.delete("recipe.recipeDelete", code);
		} catch (SQLException e) {
			 res = 0; 
			e.printStackTrace();
		} 
		
		
		return res;
	}


	@Override
	public RecipeVO viewOneRecipe(String rbcod) {
		
		RecipeVO vo = null; 
		try {
			vo = (RecipeVO) smc.queryForObject("recipe.viewOneRecipe", rbcod);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return vo;
	}


	@Override
	public List<RecipeReviewVO> viewRecipeReply(String rb_cod) {
		
		List<RecipeReviewVO> replyList = null; 
		
		try {	
			//상세페이지에있는 1개의 글에 대한 댓글 목록 전체 
			replyList = smc.queryForList("recipe.viewRecipeReply", rb_cod );
		} catch (SQLException e) {
			replyList = null; 
			e.printStackTrace();
		}
		return replyList;
	}


	@Override
	public int recipeReplyinsert(RecipeReviewVO vo) {
		int res = 0 ; 
		
		try {
			Object obj = smc.insert( "recipe.recipeReplyinsert" , vo);
			if(obj == null ) res = 1; 
		} catch (SQLException e) {
			res = 0 ; 
			e.printStackTrace();
		} 
		
		return res;
	}


	@Override
	public int alertRecipe(String rb_cod) {
		int res = 0 ; 
		
		try {
			res = smc.update("recipe.alertRecipe" , rb_cod);
		} catch (SQLException e) {
			res = 0 ; 
			e.printStackTrace();
		} 
		
		
		
		return res;
	}


	@Override
	public int deleteReply(String ba_cod) {
		int res = 0; 
		try {
			res = smc.delete("recipe.deleteReply" , ba_cod);
		} catch (SQLException e) {
			res = 0 ; 
			e.printStackTrace();
		}
		return res;
	}


	@Override
	public int updateReply(RecipeReviewVO vo) {

		int res;
		try {
			res = smc.update("recipe.updateReply", vo);
		} catch (SQLException e) {
			res = 0 ; 
			e.printStackTrace();
		} 
		
		return res;
	}


	@Override
	public int deleteAllReply(String rb_cod) {
		int res ;
		
		try {
			res = smc.delete("recipe.deleteAllReply", rb_cod);
		} catch (SQLException e) {
				res= 0;
				e.printStackTrace();
		}
		return res;
	}


	@Override
	public int RecipeUpdate(RecipeVO vo) {
		int res ; 
		
		try {
			res = smc.update("recipe.RecipeUpdate", vo);
		} catch (SQLException e) {
			res = 0 ; 
			e.printStackTrace();
		}
		
		return res;
	}






}
