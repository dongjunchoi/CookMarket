package middle.market.service;

import java.sql.SQLException;
import java.util.List;

import middle.market.dao.OrderDao;
import middle.market.dao.OrderDaoIml;
import middle.market.vo.OrderVO;

public class OrderServiceImple implements OrderService{
	private OrderDao dao;
	
	private static OrderServiceImple service;
	
	private OrderServiceImple() {
		dao = OrderDaoIml.getInstance();
	}
	
	public static OrderServiceImple getInstance() {
		if(service ==null) service = new OrderServiceImple();
		return service;
	}
	
	
	@Override
	public List<OrderVO> sOrder(String id) {
		List<OrderVO> list = null;
		try {
			list = dao.sOrder(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int insertOrder(OrderVO vo) {
		int res = 0;
		
		try {
			res = dao.insertOrder(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

}
