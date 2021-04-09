package middle.market.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import middle.market.vo.ChargeVO;
import middle.market.vo.UserVO;
import middle.util.BuildedSqlMapClient;

public class ChargeDaoImpl implements ChargeDao {
	
	private SqlMapClient smc = BuildedSqlMapClient.getSqlMapClient();

	private static middle.market.dao.ChargeDaoImpl dao;
	
	public static middle.market.dao.ChargeDaoImpl getInstance(){
		if ( dao == null)
			dao = new middle.market.dao.ChargeDaoImpl();
		return dao;
	}

	@Override
	public int chargePoint(ChargeVO vo) {
		int res = 0 ; 
		try {
			res = smc.update("user.chargePoint" , vo);
		} catch (SQLException e) {
			res = 0 ;
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int updateMemberCharge(ChargeVO vo) {
		int res = 0 ; 
		
		try {
			res = smc.update("user.updateMemberCharge", vo);
		} catch (SQLException e) {
			res = 0 ; 
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<ChargeVO> sCharge(String id) throws SQLException {
		return smc.queryForList("user.selectChar", id);
	}

}
