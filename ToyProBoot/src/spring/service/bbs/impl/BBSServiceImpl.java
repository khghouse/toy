package spring.service.bbs.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import spring.domain.BBS;
import spring.domain.Search;
import spring.service.bbs.BBSDao;
import spring.service.bbs.BBSService;

@Service("bBSServiceImpl")
public class BBSServiceImpl implements BBSService{
	@Autowired
	@Qualifier("bBSDaoImpl")
	private BBSDao bbsDao;
	
	public BBSServiceImpl()
	{
		System.out.println("BBSServiceImpl 기본생성자 호출!!");
	}
	
	@Override
	public Map<String, Object> getBBSList(Search search) throws Exception{
		// TODO Auto-generated method stub
		Map<String , Object> map = new HashMap<String, Object>();
		
		map.put("totalCount", bbsDao.getTotalCount(search));
		map.put("list", bbsDao.getBBSList(search));
		
		return map;
	}

	@Override
	public BBS getBBSContent(int code) throws Exception{
		// TODO Auto-generated method stub
		bbsDao.updateCount(code);
		return bbsDao.getBBSContent(code);
	}
	
	@Override
	public int updateSeq(BBS bbs) throws Exception {
		// TODO Auto-generated method stub
		return bbsDao.updateSeq(bbs);
	}
	
	@Override
	public int insertBBSReContent(BBS bbs) throws Exception{
		// TODO Auto-generated method stub
		return bbsDao.insertBBSReContent(bbs);
	}
	
	@Override
	public int updateDepth(BBS bbs) throws Exception{
		// TODO Auto-generated method stub
		return bbsDao.updateDepth(bbs);
	}

	@Override
	public int getMaxCode() throws Exception {
		// TODO Auto-generated method stub
		return bbsDao.getMaxCode();
	}

	@Override
	public int insertBBSContent(BBS bbs) throws Exception {
		// TODO Auto-generated method stub
		return bbsDao.insertBBSContent(bbs);
	}

	@Override
	public BBS getReviewContent(int code) throws Exception {
		// TODO Auto-generated method stub
		return bbsDao.getReviewContent(code);
	}

	@Override
	public int deleteBBSContent(int code) throws Exception {
		// TODO Auto-generated method stub
		return bbsDao.deleteBBSContent(code);
	}

	@Override
	public int updateSubject(int code) throws Exception {
		// TODO Auto-generated method stub
		return bbsDao.updateSubject(code);
	}

	@Override
	public int updateBBSContent(BBS bbs) throws Exception {
		// TODO Auto-generated method stub
		return bbsDao.updateBBSContent(bbs);
	}


}
