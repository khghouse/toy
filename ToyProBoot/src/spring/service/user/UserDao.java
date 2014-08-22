package spring.service.user;

import java.util.List;

import spring.domain.Search;
import spring.domain.User;

public interface UserDao {

	public int addUser(User user) throws Exception;

	public User getUser(String userId) throws Exception;

	public List<User> getUserList(Search search) throws Exception;

	public int updateUser(User user) throws Exception;

	public int getTotalCount(Search search) throws Exception;
	
	public int deleteUser(String userId) throws Exception;
}