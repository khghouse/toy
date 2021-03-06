package spring.web.bbs;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import spring.domain.BBS;
import spring.domain.Page;
import spring.domain.Reply;
import spring.domain.Search;
import spring.domain.User;
import spring.service.bbs.BBSService;
import spring.service.reply.ReplyService;

@Controller
@RequestMapping("/bbs/*")
public class BBSController{
	@Autowired
	@Qualifier("bBSServiceImpl")
	private BBSService bbsService;
	
	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService replyService;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	public BBSController(){
		System.out.println("BBSController 기본생성자 호출!!");
	}
	
	//@ResponseBody : ajax의 리턴 값을 넘겨줌
	@RequestMapping(value="/bbsList")
	public @ResponseBody String getBBSList(@ModelAttribute Search search) throws Exception{
		return getList(search, "", "", 0);
	}
	
	//@ResponseBody : ajax의 리턴 값을 넘겨줌
	@RequestMapping(value="/bbsList/{bbsCondition}/{searchKeyword}/{currentPage}")
	public @ResponseBody String getBBSListPage(@ModelAttribute Search search, @PathVariable String bbsCondition, @PathVariable String searchKeyword, @PathVariable Integer currentPage) throws Exception{
		return getList(search, bbsCondition, searchKeyword, currentPage);
	}
	
	
	public String getList(Search search, String bbsCondition, String searchKeyword, Integer currentPage) throws Exception{
		if(currentPage == 0){
			search.setCurrentPage(1);
		}else{
			search.setCurrentPage(currentPage);
		}
		
		search.setPageSize(pageSize);
		search.setBbsCondition(bbsCondition);
		
		if(searchKeyword == null){
			search.setSearchKeyword("");
		}
		search.setSearchKeyword(searchKeyword);
		
		Map<String, Object> map = bbsService.getBBSList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		Map<String, Object> bbsMap = new HashMap<String, Object>();
		bbsMap.put("list", map.get("list"));
		bbsMap.put("search", search);
		bbsMap.put("resultPage", resultPage);
		
		//json으로 바꿔주는 객체
		ObjectMapper objMapper = new ObjectMapper();
		String jsonList = objMapper.writeValueAsString(bbsMap);
		return jsonList;
	}
	@RequestMapping(value="/addBBSContentForm")
	public String addBBSContentForm(HttpSession session) throws Exception{
		((User) session.getAttribute("user")).getUserId();
		return "/community/addBBSContentForm.jsp";
	}
	
	@RequestMapping(value="/getBBSContent/{code}")
	public String getBBSContent(@PathVariable int code, Model model) throws Exception{
		model.addAttribute("bbs", bbsService.getBBSContent(code));
		model.addAttribute("reply", replyService.getReply(code));
		return "/community/bbsContent.jsp";
	}
	
	
	@RequestMapping(value="/addBBSReContentForm/{code}")
	public String addBBSReContentForm(@PathVariable int code, HttpSession session, Model model) throws Exception{
		((User) session.getAttribute("user")).getUserId();
		model.addAttribute("bbs", bbsService.getBBSContent(code));
		return "/community/addBBSReContentForm.jsp";
	}
	
	
	@RequestMapping(value="/addBBSReContent/{jsonValue}")
	public @ResponseBody String addBBSReContent(@PathVariable String jsonValue, HttpSession session) throws Exception{
		ObjectMapper objMapper = new ObjectMapper();
		
		BBS bbs  = objMapper.readValue(jsonValue, BBS.class);
		User user = (User)session.getAttribute("user");
		bbs.setUserId(user);
		System.out.println(bbs);
		bbsService.insertBBSReContent(bbs);
		bbsService.updateDepth(bbs);
		
		bbs.setCode(bbsService.getMaxCode());
		bbsService.updateSeq(bbs);
//		BBS content= bbsService.getReviewContent(bbs.getCode());
		
//		return "/community/bbs.jsp";
		return null;
	}
	
	@RequestMapping(value="/addBBSContent/{subject}/{content}/{attachment}")
	public @ResponseBody String addBBSContent(@PathVariable String subject, @PathVariable String content, @PathVariable String attachment, HttpSession session) throws Exception{
		if(attachment.equals("empty")){
			attachment="";
		}
		/*String userId = ((User) session.getAttribute("user")).getUserId();*/
		User user = (User)session.getAttribute("user");
		BBS bbs = new BBS(subject, user, content, attachment);
		bbsService.insertBBSContent(bbs);
//		int code = bbsService.getMaxCode();
//		BBS content=bbsService.getReviewContent(code);
		return null;
	}
	
	@RequestMapping(value="/deleteBBSContent/{code}/{depth}")
	public String deleteBBSContent(@PathVariable int code, @PathVariable int depth, Model model) throws Exception{
		System.out.println("컨트롤은 탔니?");
		if(depth==0){
			replyService.deleteBBSReply(code);
			model.addAttribute("bbs", bbsService.deleteBBSContent(code));
		}else if(depth!=0){
			replyService.deleteBBSReply(code);
			model.addAttribute("bbs", bbsService.updateSubject(code));
		}
		
		return "/community/bbs.jsp";
	}
	
	@RequestMapping(value="/updateBBSContentForm/{code}")
	public String updateBBSContentForm(@PathVariable int code, Model model) throws Exception{
		BBS bbs = new BBS();
		bbs.setCode(code);
		model.addAttribute("bbs", bbsService.getReviewContent(code));
		
		return "/community/updateBBSContent.jsp?code="+bbs.getCode();
	}
	
	/*@RequestMapping(value="/updateBBSContent/{jsonValue}")
	public @ResponseBody String updateBBSContent(@PathVariable String jsonValue) throws Exception{
		System.out.println("update이다");
		System.out.println(jsonValue);*/
	@RequestMapping(value="/updateBBSContent/{code}/{subject}/{content}/{attachment}")
	public @ResponseBody String updateBBSContent(@PathVariable int code, @PathVariable String subject, @PathVariable String content, @PathVariable String attachment) throws Exception{
		
		BBS bbs = new BBS();
		bbs.setCode(code);
		bbs.setSubject(subject);
		/*User user = (User)session.getAttribute("user");
		bbs.setUserId(user);*/
		bbs.setContent(content);
		bbs.setAttachment(attachment);
		
		if(bbs.getAttachment().equals("empty")){
			bbs.setAttachment("");
		}
		
		bbsService.updateBBSContent(bbs);
		
		return null;
	}
	
	@RequestMapping(value="/getBBSContentReply/{code}")
	public String getBBSContentReply(@PathVariable int code, Model model) throws Exception{

		model.addAttribute("bbs", bbsService.getReviewContent(code));
		model.addAttribute("reply", replyService.getReply(code));
		return "/community/bbsContent.jsp";
	}
	
	
}
