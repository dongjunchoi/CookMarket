package middle.market.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import middle.market.vo.GroceryVO;
import middle.util.BuildedSqlMapClient;

public class GroceryDaoImpl implements GroceryDao{
	private SqlMapClient smc;
	private static GroceryDaoImpl dao;
	
	
	private GroceryDaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static GroceryDaoImpl getInstance() {
		if (dao == null ) dao = new GroceryDaoImpl();
		return dao;
	}
	
	@Override
	public int insertGrocery(GroceryVO groceryVo) {

		int cnt = 0;	
		
		try {
			
			Object obj = smc.insert("grocery.insertGrocery", groceryVo);
			if(obj == null) cnt = 1;
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		} 
		
		return cnt;
	}

	@Override
	public int deleteGrocery(String grocery_cod) {
		
		int cnt = 0;	// 반환값이 저장될 변수 ( 작업성공 : 1 , 실패 : 0 )
		
		try {
			
			cnt = smc.delete("grocery.deleteGrocery", grocery_cod);
			
		} catch (SQLException e) {
			cnt = 0; 
			e.printStackTrace();
		} 
		
		return cnt;
	}

	@Override
	public int updateGrocery(GroceryVO groceryVo) {
		
		int cnt = 0;	
		
		try {
			
			cnt = smc.update("grocery.updateGrocery", groceryVo);	
			
		} catch (SQLException e) {
			cnt = 0; 
			e.printStackTrace();
		} 
		
		return cnt;
	}

	@Override
	public List<GroceryVO> getAllGroceryList() throws SQLException {
		return smc.queryForList("grocery.getAllGrocery");
	}

	@Override
	public int getGroceryCount(String grocery_cod) {
		
		int cnt = 0;			//회원 ID의 개수가 저장될 변수
		
		try {
			
			cnt = (int)smc.queryForObject("grocery.getcod", grocery_cod);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		} 
		return cnt;
	}

	@Override
	public int updateGrocery2(Map<String, String> paramMap) {
		
				int cnt = 0;
				try {
					
					cnt = smc.update("grocery.updateGrocery2", paramMap);
					
				} catch (SQLException e) {
					cnt = 0;
					e.printStackTrace();
				} 
				
				return cnt;
	}
	@Override
	public GroceryVO getGrocery(String grocery_cod) {
		GroceryVO groceryVo = null;
		
		try {
			groceryVo = (GroceryVO) smc.queryForObject("grocery.getGrocery", grocery_cod);
		} catch (SQLException e) {
			groceryVo = null;
			e.printStackTrace();
		}
		return groceryVo;
	}

	
	
}
