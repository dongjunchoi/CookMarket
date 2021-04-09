package middle.market.service;

import java.sql.SQLException;
import java.util.List;

import middle.market.vo.OrderVO;
import middle.market.vo.UserVO;

public interface OrderService {

	//order조회
	public List<OrderVO> sOrder(String id);
	
	//주문
	public int insertOrder(OrderVO vo);
}
