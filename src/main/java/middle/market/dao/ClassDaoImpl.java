package middle.market.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import middle.market.vo.ClassReviewVO;
import middle.market.vo.ClassVO;
import middle.market.vo.NoticeVO;
import middle.market.vo.RecipeReviewVO;
import middle.util.BuildedSqlMapClient;

public class ClassDaoImpl implements ClassDao{
	
	private SqlMapClient smc;
	private static ClassDaoImpl dao;
	
	public ClassDaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static ClassDaoImpl getInstance() {
		if(dao == null) dao = new ClassDaoImpl();
		return dao;
	}
	
	@Override
	public List<ClassVO> getAllClassList() {
		List<ClassVO> classList = null;
		
		try {
			
			classList = smc.queryForList("class.getAllClass");
			
		} catch (SQLException e) {
			
			classList = null;
			e.printStackTrace();
		}
		return classList;
	}

	@Override
	public ClassVO getClass(String class_cod) {
		ClassVO classVo = null;
		
		try {
			classVo = (ClassVO) smc.queryForObject("class.getClass", class_cod);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return classVo;
	}

	@Override
	public int insertClass(ClassVO classVo) {
		int cnt = 0;
		
		Object obj;
		try {
			obj = smc.insert("class.insertClass", classVo);
			if(obj==null) cnt=1;
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		
		
		return cnt;
	}

	@Override
	public int deleteClass(String class_cod) {
		int cnt = 0;
		
		try {
			
			cnt = smc.delete("class.deleteClass", class_cod);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateClass(ClassVO classVo) {
		int cnt = 0;
		
		try {
			cnt = smc.update("class.updateClass", classVo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public List<ClassReviewVO> getAllClassReviewList(String class_cod) {
		List<ClassReviewVO> reviewList = null; 
		
		try {	
			//상세페이지에있는 1개의 글에 대한 댓글 목록 전체 
			reviewList = smc.queryForList("class.getAllClassReview", class_cod);
		} catch (SQLException e) {
			reviewList = null; 
			e.printStackTrace();
		}
		return reviewList;
	}

	@Override
	public int insertClassReview(ClassReviewVO classReviewVo) {
		int res = 0 ; 
		
		try {
			Object obj = smc.insert("class.insertClassReview" , classReviewVo);
			if(obj == null ) res = 1; 
		} catch (SQLException e) {
			res = 0 ; 
			e.printStackTrace();
		} 
		
		return res;
	}

	@Override
	public int deleteClassReview(String cr_cod) {
		int res = 0; 
		try {
			res = smc.delete("class.deleteClassReview" , cr_cod);
		} catch (SQLException e) {
			res = 0 ; 
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updateClassReview(ClassReviewVO classReviewVo) {
		int res;
		try {
			res = smc.update("class.updateClassReview", classReviewVo);
		} catch (SQLException e) {
			res = 0 ; 
			e.printStackTrace();
		} 
		
		return res;
	}

	@Override
	public int deleteAllReview(String class_cod) {
		int res = 0 ; 
		
		try {
			res = smc.delete("class.deleteAllReview" , class_cod);
		} catch (SQLException e) {
			res = 0 ; 
			e.printStackTrace();
		}
		
		return res;
	}
	
}
