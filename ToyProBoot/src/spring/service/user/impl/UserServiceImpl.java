package spring.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import spring.domain.Search;
import spring.domain.User;
import spring.service.user.UserDao;
import spring.service.user.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	
	public UserServiceImpl() {
		super();
		System.out.println(getClass()+" Default Constructor Call");
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public int addUser(User user) throws Exception {
		return userDao.addUser(user);
	}

	@Override
	public User getUser(String userId) throws Exception {
		return userDao.getUser(userId);
	}

	@Override
	public Map<String, Object> getUserList(Search search) throws Exception {
		List<User> list = userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount",new Integer(totalCount));
		return map;
	}

	@Override
	public int updateUser(User user) throws Exception {
		return userDao.updateUser(user);
	}

	@Override
	public User loginUser(User user) throws Exception {
		 User dbUser = (User)userDao.getUser(user.getUserId());
		 if(!dbUser.getUserPw().equals(user.getUserPw()))
			 throw new Exception("비밀번호가 일치하지 않습니다.");
		 return dbUser;
	}

	@Override
	public boolean checkDuplication(String userId) throws Exception {
		Boolean result = true;
		User user = userDao.getUser(userId);
		if(user != null){
			result = false;
		}
		return result;
	}

	@Override
	public int deleteUser(String userId) throws Exception {
		return userDao.deleteUser(userId);
	}

}
