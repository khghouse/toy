package spring.service.reply.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import spring.domain.Reply;
import spring.service.reply.ReplyDao;
import spring.service.reply.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	@Qualifier("replyDaoImpl")
	public ReplyDao replyDao;
	
	public ReplyServiceImpl(){
		System.out.println("ReplyServiceImpl 기본생성자 호출!!");
	}

	@Override
	public List<Reply> getReply(int code) throws Exception {
		// TODO Auto-generated method stub
		return replyDao.getReply(code);
	}

	@Override
	public int insertReply(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		return replyDao.insertReply(reply);
	}

	@Override
	public int deleteReply(int replyCode) throws Exception {
		// TODO Auto-generated method stub
		return replyDao.deleteReply(replyCode);
	}

	@Override
	public int updateReply(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		return replyDao.updateReply(reply);
	}

	@Override
	public int deleteBBSReply(int code) throws Exception {
		// TODO Auto-generated method stub
		return replyDao.deleteBBSReply(code);
	}
	

}
