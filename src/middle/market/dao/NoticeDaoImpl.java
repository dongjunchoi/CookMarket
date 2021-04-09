package middle.market.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import middle.market.vo.NoticeVO;
import middle.util.BuildedSqlMapClient;

public class NoticeDaoImpl implements NoticeDao{
	private SqlMapClient smc;
	private static NoticeDaoImpl dao;
	
	private NoticeDaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static NoticeDaoImpl getInstance() {
		if(dao == null) dao = new NoticeDaoImpl();
		return dao;
	}
	
	@Override
	public List<NoticeVO> getAllNoticeList() {
		
		List<NoticeVO> noticeList = null;
		
		try {
			
			noticeList = smc.queryForList("notice.getAllNotice");
			
		} catch (SQLException e) {
			noticeList = null;
			e.printStackTrace();
		}
		
		return noticeList;
	}

	@Override
	public int insertNotice(NoticeVO noticeVo) {
		
		int cnt = 0;
		
		Object obj;
		try {
			obj = smc.insert("notice.noticeInsert", noticeVo);
			if(obj==null) cnt=1;
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		
		
		return cnt;
	}

	@Override
	public NoticeVO getNotice(String n_title) {
		NoticeVO noticeVo = null;
		
		try {
			noticeVo = (NoticeVO) smc.queryForObject("notice.getNotice", n_title);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return noticeVo;
	}

	@Override
	public int deleteNotice(String n_title) {
		
		int cnt = 0;
		
		try {
			
			cnt = smc.delete("notice.deleteNotice", n_title);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateNotice(NoticeVO noticeVo) {
		int cnt = 0;
		
		try {
			cnt = smc.update("notice.updateNotice", noticeVo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

}


















