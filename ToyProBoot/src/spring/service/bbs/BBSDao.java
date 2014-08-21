package spring.service.bbs;

import java.util.List;

import spring.domain.BBS;
import spring.domain.Search;

public interface BBSDao
{
	public List<BBS> getBBSList(Search search) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public int insertBBSContent(BBS bbs) throws Exception;
	
	public BBS getBBSContent(int code) throws Exception;
	
	public int updateCount(int code) throws Exception;
	
	public int updateSeq(BBS bbs) throws Exception;

	public int insertBBSReContent(BBS bbs) throws Exception;

	public int updateDepth(BBS bbs) throws Exception;
	
	public int getMaxCode() throws Exception;
	
	public BBS getReviewContent(int code) throws Exception;
	
	public int deleteBBSContent(int code) throws Exception;
	
	public int updateSubject(int code) throws Exception;
	
	public int updateBBSContent(BBS bbs) throws Exception;
	
}
