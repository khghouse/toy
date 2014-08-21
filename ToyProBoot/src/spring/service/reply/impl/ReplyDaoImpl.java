package spring.service.reply.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import spring.domain.Reply;
import spring.service.reply.ReplyDao;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public ReplyDaoImpl(){
		System.out.println("ReplyDaoImpl 기본 생성자 호출!!");
	}
	
	@Override
	public List<Reply> getReply(int code) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ReplyMapper.getReply", code);
	}

	@Override
	public int insertReply(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("ReplyMapper.addReply", reply);
	}

	@Override
	public int deleteReply(int replyCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("ReplyMapper.deleteReply", replyCode);
	}

	@Override
	public int updateReply(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("ReplyMapper.updateReply", reply);
	}

}
