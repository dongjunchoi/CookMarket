package middle.market.service;

import java.sql.SQLException;
import java.util.List;

import middle.market.dao.UserDao;
import middle.market.dao.UserDaoImpl;
import middle.market.vo.ChargeVO;
import middle.market.vo.UserVO;

public class UserServiceImpl implements UserService{
	private UserDao dao;
	
	public static UserServiceImpl service;
	
	private UserServiceImpl() {
		dao = UserDaoImpl.getInstance();
	}
	
	public static UserServiceImpl getInstance() {
		if(service == null) service = new UserServiceImpl();
		return service;
	}
	
	@Override
	public List<UserVO> AllUser() {
		
		List<UserVO> list = null;
		
		try {
			list = dao.AllUser();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public UserVO UserView(String id) {
		UserVO vo = null;
		
		try {
			vo = dao.UserView(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		return vo;
	}

	@Override
	public int DeleteUser(String id) {
		int res = 0;
		
		try {
			res = dao.DeleteUser(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int loginCheckSelect(UserVO vo) {
		int res = 0;
		
		try {
			res = dao.loginCheckSelect(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public String selectId(String id) {
		String user_id = null;
		
		try {
			user_id = dao.selectId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user_id;
	}

	@Override
	public String insertMember(UserVO vo) {
		String res = "";
		
		try {
			res = dao.insertMember(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int lastLogin(String id) {
		int res = 0;
		
		try {
			res = dao.lastLogin(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	@Override
	public String insertMember2(UserVO vo) {
		String id =null;
		
		try {
			id = dao.insertMember2(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}

	//id찾기
	@Override
	public String searchid(UserVO vo) {
		String id = null;
		try {
			id=dao.searchid(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public String searchPass(UserVO vo) {
		String pass = null;
		
		try {
			pass = dao.searchPass(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pass;
	}

	@Override
	public int savePoing(UserVO vo) {
		int res = 0;
		
		try {
			res = dao.savePoing(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int savePointtext(ChargeVO vo) {
		int res = 0;
		
		try {
			res = dao.savePointtext(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int addrUpdate(UserVO vo) {
		int res = 0;
		try {
			res = dao.addrUpdate(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

}
