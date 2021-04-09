package middle.market.service;

import java.util.List;

import middle.market.vo.QnAVO;

public interface QnAService {
	
	// 전체 문의게시판 리스트
		public List<QnAVO> getAllQnAList();
		
		// 선택한 문의게시판 하나의 리스트
		public QnAVO getQnA(String q_cod);
		
		// 새로운 문의글 등록
		public int insertQnA(QnAVO qnaVo);
		
		// 문의글 삭제
		public int deleteQnA(String q_cod);
		
		// 문의글 수정
		public int updateQnA(QnAVO qnaVo);
}
