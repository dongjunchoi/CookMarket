package middle.market.service;

import java.sql.SQLException;
import java.util.List;

import middle.market.vo.ChargeVO;
import middle.market.vo.UserVO;

public interface UserService {
	
	//전체 회원 조회
	public List<UserVO> AllUser(); 
	
	//선택된 회원 조회
	public UserVO UserView(String id);
	
	public int DeleteUser(String id);
	
	//로그인
	public int loginCheckSelect(UserVO vo);
	//Id중복체크
	public String selectId(String id);
	//가입(일반)
	public String insertMember(UserVO vo);
	//가입(요리사)
	public String insertMember2(UserVO vo);
	//마지막 로그인 시간 업데이트
	public int lastLogin(String id);
	//id찾기
	public String searchid(UserVO vo);
	//pass찾기
	public String searchPass(UserVO vo);
	//포인트저장
	public int savePoing(UserVO vo);
	//포인트내역 저장
	public int savePointtext(ChargeVO vo); 
	//주소 업데이트
	public int addrUpdate(UserVO vo);
	
}