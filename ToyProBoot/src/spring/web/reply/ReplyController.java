package spring.web.reply;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.domain.BBS;
import spring.domain.Reply;
import spring.service.reply.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController{
	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService replyService;
	
	public ReplyController(){
		System.out.println("ReplyController 기본생성자 호출!!");
	}
	
	
	@RequestMapping(value="/addReply/{bbsCode}/{replyContent}")
	public @ResponseBody String addReply(@PathVariable int bbsCode, @PathVariable String replyContent) throws Exception{
		System.out.println("댓글 컨트롤");
		
		Reply reply = new Reply();
		BBS bbs = new BBS();
		bbs.setCode(bbsCode);
		reply.setCode(bbs);
		reply.setReplyContent(replyContent);
		reply.setReplyWriter("호걸이");
		
		replyService.insertReply(reply);
		
		return null;
	}
	
	@RequestMapping(value="/updateReply/{replyCode}/{replyContent}")
	public @ResponseBody String updateReply(@PathVariable int replyCode, @PathVariable String replyContent) throws Exception{
		System.out.println("update컨트롤");
		Reply reply = new Reply();
		reply.setReplyCode(replyCode);
		reply.setReplyContent(replyContent);
		replyService.updateReply(reply);
		
		return null;
	}

	@RequestMapping(value="/deleteReply/{replyCode}")
	public String deleteReply(@PathVariable int replyCode) throws Exception{
		System.out.println("delete컨트롤");
		replyService.deleteReply(replyCode);
		
		return "/community/bbsContent.jsp";
	}
	

	
	
	
}
