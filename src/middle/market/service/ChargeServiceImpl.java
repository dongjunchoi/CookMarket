package middle.market.service;

import java.sql.SQLException;
import java.util.List;

import middle.market.dao.ChargeDao;
import middle.market.dao.ChargeDaoImpl;
import middle.market.vo.ChargeVO;
import middle.market.vo.UserVO;

public class ChargeServiceImpl implements ChargeService {
	
	private ChargeDao dao = ChargeDaoImpl.getInstance();
	private static ChargeServiceImpl service;
	public static ChargeServiceImpl getInstance() {
		if ( service == null)
			service = new ChargeServiceImpl();
		return service; 
	}

	@Override
	public int chargePoint(ChargeVO vo) {
		return dao.chargePoint(vo);
	}

	@Override
	public int updateMemberCharge(ChargeVO vo) {
		return dao.updateMemberCharge(vo);
	}

	//charge출려
	@Override
	public List<ChargeVO> sCharge(String id) {
		List<ChargeVO> list = null;
		
		try {
			list = dao.sCharge(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
