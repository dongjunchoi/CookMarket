package middle.market.dao;

import java.sql.SQLException;
import java.util.List;

import middle.market.vo.ChargeVO;
import middle.market.vo.UserVO;

public interface UserDao {
	
	//전체 회원 조회
	public List<UserVO> AllUser() throws SQLException;
	
	//선택된 회원 조회
	public UserVO UserView(String id) throws SQLException;
	
	//회원 삭제
	public int DeleteUser(String id) throws SQLException;
	
	//로그인
	public int loginCheckSelect(UserVO vo) throws SQLException;
	//id중복확인
	public String selectId(String id) throws SQLException;
	//가입(일반)
	public String insertMember(UserVO vo) throws SQLException;
	//가입(요리사)
	public String insertMember2(UserVO vo) throws SQLException;
	//id찾기
	public String searchid(UserVO vo) throws SQLException;
	//pass찾기
	public String searchPass(UserVO vo) throws SQLException;
	//이메일 업데이트
	public int emilUpdate(String email) throws SQLException;
	//주소 업데이트
	public int addrUpdate(UserVO vo) throws SQLException;
	//마지막 로그인 시간 업데이트
	public int lastLogin(String id) throws SQLException;
	//포인트충전
	public int savePoing(UserVO vo) throws SQLException;
	//포인트내역 저장
	public int savePointtext(ChargeVO vo) throws SQLException; 
	
	
}
