package spring.service.user;

import java.util.Map;

import spring.domain.Search;
import spring.domain.User;

public interface UserService {
	
	public int addUser(User user) throws Exception; // insertUser
	
	public User getUser(String userId) throws Exception; // findUser
	
	public Map<String, Object> getUserList(Search search) throws Exception; // getUserList
	
	public int updateUser(User user) throws Exception; // updateUser
	
	public User loginUser(User user) throws Exception;

	public boolean checkDuplication(String userId) throws Exception;
	
	public int deleteUser(String userId) throws Exception;
}