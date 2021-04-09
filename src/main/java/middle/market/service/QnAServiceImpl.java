package middle.market.service;

import java.util.List;

import middle.market.dao.QnADao;
import middle.market.dao.QnADaoImpl;
import middle.market.vo.QnAVO;

public class QnAServiceImpl implements QnAService{
	private QnADao dao;
	private static QnAServiceImpl service;
	
	private QnAServiceImpl() {
		// TODO Auto-generated constructor stub
		dao = QnADaoImpl.getInstance();
	}
	
	public static QnAServiceImpl getInstance() {
		if(service==null) service = new QnAServiceImpl();
		return service;
	}
	
	@Override
	public List<QnAVO> getAllQnAList() {
		return dao.getAllQnAList();
	}

	@Override
	public QnAVO getQnA(String q_cod) {
		return dao.getQnA(q_cod);
	}

	@Override
	public int insertQnA(QnAVO qnaVo) {
		return dao.insertQnA(qnaVo);
	}

	@Override
	public int deleteQnA(String q_cod) {
		return dao.deleteQnA(q_cod);
	}

	@Override
	public int updateQnA(QnAVO qnaVo) {
		return dao.updateQnA(qnaVo);
	}

}
