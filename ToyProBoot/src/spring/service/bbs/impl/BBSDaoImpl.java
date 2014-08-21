package spring.service.bbs.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import spring.domain.BBS;
import spring.domain.Search;
import spring.service.bbs.BBSDao;

@Repository("bBSDaoImpl")
public class BBSDaoImpl implements BBSDao{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public BBSDaoImpl()
	{
		System.out.println("BBSDaoImpl 기본생성자 호출!!");
	}

	@Override
	public List<BBS> getBBSList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("BBSMapper.getBBSList", search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BBSMapper.getTotalCount", search);
	}

	@Override
	public BBS getBBSContent(int code) throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BBSMapper.getBBSContent", code);
	}
	
	@Override
	public int updateCount(int code) throws Exception{
		return sqlSession.update("BBSMapper.updateCount", code);
	}
	
	@Override
	public int updateSeq(BBS bbs) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("BBSMapper.updateSeq", bbs);
	}
	
	@Override
	public int insertBBSReContent(BBS bbs) throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.insert("BBSMapper.addBBSReContent", bbs);
	}
	
	@Override
	public int updateDepth(BBS bbs) throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.update("BBSMapper.updateDepth", bbs.getRoot());
	}

	@Override
	public int getMaxCode() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BBSMapper.getMaxCode");
	}

	@Override
	public int insertBBSContent(BBS bbs) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("BBSMapper.addBBSContent", bbs);
	}

	@Override
	public BBS getReviewContent(int code) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BBSMapper.getBBSContent", code);
	}

	@Override
	public int deleteBBSContent(int code) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("BBSMapper.deleteBBSContent", code);
	}

	@Override
	public int updateSubject(int code) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("BBSMapper.updateSubject",	code);
	}

	@Override
	public int updateBBSContent(BBS bbs) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("BBSMapper.updateBBSContent", bbs);
	}

}
