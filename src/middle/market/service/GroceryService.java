package middle.market.service;

import java.util.List;
import java.util.Map;

import middle.market.vo.GroceryVO;


	public interface GroceryService {

		public int insertGrocery(GroceryVO groceryVo);		
		
		
		
		public int deleteGrocery(String grocery_cod);
		
		

		public int updateGrocery(GroceryVO groceryVo);
		

		public List<GroceryVO> getAllGroceryList();
		

		public int getGroceryCount(String grocery_cod);
		


		public int updateGrocery2(Map<String, String> paramMap);


		public GroceryVO getGrocery(String grocery_cod);
	}

