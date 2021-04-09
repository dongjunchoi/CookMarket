package middle.market.service;


import java.util.List;

import middle.market.dao.NoticeDao;
import middle.market.dao.NoticeDaoImpl;
import middle.market.vo.NoticeVO;

public class NoticeServiceImpl implements NoticeService{
	private NoticeDao dao;
	private static NoticeServiceImpl service;
	
	private NoticeServiceImpl() {
		// TODO Auto-generated constructor stub
		dao = NoticeDaoImpl.getInstance();
	}
	
	public static NoticeServiceImpl getInstance() {
		if(service==null) service = new NoticeServiceImpl();
		return service;
	}
	
	@Override
	public List<NoticeVO> getAllNoticeList() {
		return dao.getAllNoticeList();
	}

	@Override
	public int insertNotice(NoticeVO noticeVo) {
		return dao.insertNotice(noticeVo);
	}

	@Override
	public NoticeVO getNotice(String n_title) {
		return dao.getNotice(n_title);
	}

	@Override
	public int deleteNotice(String n_title) {
		return dao.deleteNotice(n_title);
	}

	@Override
	public int updateNotice(NoticeVO noticeVo) {
		return dao.updateNotice(noticeVo);
	}

}
