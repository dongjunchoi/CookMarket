package middle.market.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import middle.market.vo.ChargeVO;
import middle.market.vo.UserVO;
import middle.util.BuildedSqlMapClient;

public class UserDaoImpl implements UserDao{
	
	private SqlMapClient smc;
	
	private static UserDaoImpl dao;
	
	private UserDaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static UserDaoImpl getInstance() {
		if(dao == null) dao = new UserDaoImpl();
		return dao;
	}
	

	@Override
	public List<UserVO> AllUser() throws SQLException {
		return smc.queryForList("user.allMem");
	}

	@Override
	public UserVO UserView(String id) throws SQLException {
		return(UserVO) smc.queryForObject("user.viewOneMemSelect", id);
	}

	@Override
	public int DeleteUser(String id) throws SQLException {
		return (Integer)smc.delete("user.deleteuser", id);
	}
	
	@Override
	public int loginCheckSelect(UserVO vo) throws SQLException {
		return (Integer) smc.queryForObject("user.loginCheckSelect", vo);
	}

	@Override
	public String selectId(String id) throws SQLException {
		return (String) smc.queryForObject("user.selectId", id);
	}

	@Override
	public String insertMember(UserVO vo) throws SQLException {
		return (String) smc.insert("user.insertMember", vo);
	}

	@Override
	public int lastLogin(String id) throws SQLException {
		return smc.update("user.loginDateUpdate",id);
	}

	@Override
	public String insertMember2(UserVO vo) throws SQLException {
		return (String) smc.insert("user.insertMember2", vo);
	}

	@Override
	public String searchid(UserVO vo) throws SQLException {
		return (String) smc.queryForObject("user.searchid", vo);
	}

	@Override
	public String searchPass(UserVO vo) throws SQLException {
		return (String) smc.queryForObject("user.searchPass", vo);
	}

	@Override
	public int emilUpdate(String email) throws SQLException {
		return (Integer)smc.queryForObject("user.updateEmail", email);
	}

	@Override
	public int savePoing(UserVO vo) throws SQLException {
		return (Integer)smc.update("user.updatepoint", vo);
	}

	@Override
	public int savePointtext(ChargeVO vo) throws SQLException {
		return (Integer)smc.insert("user.chargePoint", vo);
	}

	@Override
	public int addrUpdate(UserVO vo) throws SQLException {
		return (Integer)smc.update("user.updateAddr", vo);
	}

}
