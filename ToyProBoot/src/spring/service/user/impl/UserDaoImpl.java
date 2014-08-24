package spring.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import spring.domain.Search;
import spring.domain.User;
import spring.service.user.UserDao;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
	public UserDaoImpl() {
		super();
		System.out.println(getClass()+" Default Constructor Call");
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int addUser(User user) throws Exception {
		return sqlSession.insert("UserMapper.insertUser", user);//ok
	}

	@Override
	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userId);//ok
	}

	@Override
	public List<User> getUserList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getUserList", search);
	}

	@Override
	public int updateUser(User user) throws Exception {
		return sqlSession.update("UserMapper.updateUser", user);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}

	@Override
	public int deleteUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.deleteUser", userId);
	}

}
