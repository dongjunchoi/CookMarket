package middle.market.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import middle.market.vo.OrderVO;
import middle.market.vo.UserVO;
import middle.util.BuildedSqlMapClient;

public class OrderDaoIml implements OrderDao {

	private SqlMapClient smc;
	private static middle.market.dao.OrderDaoIml dao;
	
	private OrderDaoIml() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	public static OrderDaoIml getInstance() {
		if(dao == null) dao = new OrderDaoIml();
		return dao;
	}
	
	@Override
	public List<OrderVO> sOrder(String id) throws SQLException {
		return smc.queryForList("user.selectOrder", id);
	}
	@Override
	public int insertOrder(OrderVO vo) throws SQLException {
		int a = 0;
		
		if((Integer)smc.insert("grocery.insertOrder",vo)==null) {
			a = 1;
		}
		return a;
	}
}
