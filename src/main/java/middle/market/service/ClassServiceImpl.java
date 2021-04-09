package middle.market.service;

import java.util.List;

import middle.market.dao.ClassDao;
import middle.market.dao.ClassDaoImpl;
import middle.market.vo.ClassReviewVO;
import middle.market.vo.ClassVO;

public class ClassServiceImpl implements ClassService{
	
	private ClassDao dao;
	private static ClassServiceImpl service;
	
	private ClassServiceImpl() {
		// TODO Auto-generated constructor stub
		dao = ClassDaoImpl.getInstance();
	}
	
	public static ClassServiceImpl getInstance() {
		if(service==null) service = new ClassServiceImpl();
		return service;
	}
	@Override
	public List<ClassVO> getAllClassList() {
		return dao.getAllClassList();
	}

	@Override
	public ClassVO getClass(String class_cod) {
		return dao.getClass(class_cod);
	}

	@Override
	public int insertClass(ClassVO classVo) {
		return dao.insertClass(classVo);
	}

	@Override
	public int deleteClass(String class_cod) {
		return dao.deleteClass(class_cod);
	}

	@Override
	public int updateClass(ClassVO classVo) {
		return dao.updateClass(classVo);
	}

	@Override
	public List<ClassReviewVO> getAllClassReviewList(String class_cod) {
		return dao.getAllClassReviewList(class_cod);
	}

	@Override
	public int insertClassReview(ClassReviewVO classReviewVo) {
		return dao.insertClassReview(classReviewVo);
	}

	@Override
	public int deleteClassReview(String class_cod) {
		return dao.deleteClassReview(class_cod);
	}

	@Override
	public int updateClassReview(ClassReviewVO classReviewVo) {
		return dao.updateClassReview(classReviewVo);
	}

	@Override
	public int deleteAllReview(String class_cod) {
		return dao.deleteAllReview(class_cod);
	}

}
