package middle.market.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import middle.market.vo.QnAVO;
import middle.util.BuildedSqlMapClient;

public class QnADaoImpl implements QnADao{
	private SqlMapClient smc;
	private static QnADaoImpl dao;
	
	public QnADaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static QnADaoImpl getInstance() {
		if(dao == null) dao = new QnADaoImpl();
		return dao;
	}
	
	@Override
	public List<QnAVO> getAllQnAList() {
		
		List<QnAVO> qnaList = null;
		
		try {
			
			qnaList = smc.queryForList("qna.getAllQnA");
			
		} catch (SQLException e) {
			
			qnaList = null;
			e.printStackTrace();
		}
		return qnaList;
	}

	@Override
	public QnAVO getQnA(String q_cod) {
		QnAVO qnaVo = null;
		
		try {
			qnaVo = (QnAVO) smc.queryForObject("qna.getQnA", q_cod);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qnaVo;
	}

	@Override
	public int insertQnA(QnAVO qnaVo) {
		int cnt = 0;
		
		Object obj;
		try {
			obj = smc.insert("qna.insertQnA", qnaVo);
			
			if(obj==null) cnt=1;
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		
		
		return cnt;
	}

	@Override
	public int deleteQnA(String q_cod) {
		int cnt = 0;
		
		try {
			
			cnt = smc.delete("qna.deleteQnA", q_cod);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateQnA(QnAVO qnaVo) {
		int cnt = 0;
		
		try {
			cnt = smc.update("qna.updateQnA", qnaVo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

}
