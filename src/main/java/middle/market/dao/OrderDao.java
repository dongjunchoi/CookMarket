package middle.market.dao;

import java.sql.SQLException;
import java.util.List;

import middle.market.vo.OrderVO;
import middle.market.vo.UserVO;

public interface OrderDao {
	
	//order조회
	public List<OrderVO> sOrder(String id) throws SQLException;
	
	//주문
	public int insertOrder(OrderVO vo) throws SQLException;
}
