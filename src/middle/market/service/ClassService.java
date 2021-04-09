package middle.market.service;

import java.util.List;

import middle.market.vo.ClassReviewVO;
import middle.market.vo.ClassVO;

public interface ClassService {
	// 전체 클래스게시판 리스트
	public List<ClassVO> getAllClassList();
			
	// 선택한 클래스게시판 하나의 리스트
	public ClassVO getClass(String class_cod);
			
	// 새로운 클래스 등록
	public int insertClass(ClassVO classVo);
			
	// 클래스 삭제
	public int deleteClass(String class_cod);
			
	// 클래스 수정
	public int updateClass(ClassVO classVo);
	
	// 클래스 댓글 전체조회
	public List<ClassReviewVO> getAllClassReviewList(String class_cod);
		
	// 클래스 댓글 등록
	public int insertClassReview(ClassReviewVO classReviewVo);
		
	// 클래스 댓글 삭제
	public int deleteClassReview(String class_cod);
		
	// 클래스 댓글 수정
	public int updateClassReview(ClassReviewVO classReviewVo);
	
	//1개의 클래스에 대한 모든 댓글 삭제 
	public int deleteAllReview(String class_cod); 
}
