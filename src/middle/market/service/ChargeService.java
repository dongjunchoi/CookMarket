package middle.market.service;

import java.sql.SQLException;
import java.util.List;

import middle.market.vo.ChargeVO;
import middle.market.vo.UserVO;

public interface ChargeService {
	
	//포인트 충전
	int chargePoint(ChargeVO vo);
	
	//동시에 member3 테이블에 point update
	
	int updateMemberCharge (ChargeVO vo);
	
	//charge검색
	public List<ChargeVO> sCharge(String id);

}
