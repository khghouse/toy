package spring.service.reply;

import java.util.List;

import spring.domain.Reply;

public interface ReplyDao {
	
	public List<Reply> getReply(int code) throws Exception;
	
	public int insertReply(Reply reply) throws Exception;
	
	public int deleteReply(int replyCode) throws Exception;
	
	public int updateReply(Reply reply) throws Exception;
	
	

}
