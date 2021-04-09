package middle.market.dao;

import java.util.List;

import middle.market.vo.NoticeVO;

public interface NoticeDao {
	
	// 전체 공지사항 리스트
	public List<NoticeVO> getAllNoticeList();
	
	// 선택한 공지사항 하나의 리스트
	public NoticeVO getNotice(String n_title);
	
	// 새로운 공지사항 등록
	public int insertNotice(NoticeVO noticeVo);
	
	// 공지사항 삭제
	public int deleteNotice(String n_title);
	
	// 공지사항 수정
	public int updateNotice(NoticeVO noticeVo);
}
