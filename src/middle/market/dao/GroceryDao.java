package middle.market.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import middle.market.vo.GroceryVO;

public interface GroceryDao {

	public int insertGrocery(GroceryVO groceryVo);		
	

	public int deleteGrocery(String grocery_cod);
	

	public int updateGrocery(GroceryVO groceryVo);
	

	public List<GroceryVO> getAllGroceryList() throws SQLException;
	

	public int getGroceryCount(String grocery_cod);
	

	public int updateGrocery2(Map<String, String> paramMap);

	public GroceryVO getGrocery(String grocery_cod);
}
