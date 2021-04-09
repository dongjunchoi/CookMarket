package middle.market.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import middle.market.dao.GroceryDao;
import middle.market.dao.GroceryDaoImpl;
import middle.market.vo.GroceryVO;

public class GroceryServiceImpl implements GroceryService{

	private GroceryDao dao;		// DAO객체가 저장될 변수 선언
	
	
	// 1번
	private static GroceryServiceImpl service;
	
	
	private GroceryServiceImpl() {
		dao = GroceryDaoImpl.getInstance();
	}

	// 3번
	public static GroceryServiceImpl getInstance() {
		if(service == null) service = new GroceryServiceImpl();
		return service;
	}
	
	
	@Override
	public int insertGrocery(GroceryVO groceryVo) {
		return dao.insertGrocery(groceryVo);
	}

	@Override
	public int deleteGrocery(String grocery_cod) {
		return dao.deleteGrocery(grocery_cod);
	}

	@Override
	public int updateGrocery(GroceryVO groceryVo) {
		return dao.updateGrocery(groceryVo);
	}

	@Override
	public List<GroceryVO> getAllGroceryList() {
		List<GroceryVO> list = null;
		try {
			list = dao.getAllGroceryList();
		} catch (SQLException e) {
		}
		
		return list;
	}

	@Override
	public int getGroceryCount(String grocery_cod) {
		return dao.getGroceryCount(grocery_cod);
	}

	@Override
	public int updateGrocery2(Map<String, String> paramMap) {
		return dao.updateGrocery2(paramMap);
	}

	@Override
	public GroceryVO getGrocery(String grocery_cod) {
		return dao.getGrocery(grocery_cod);
	}


}