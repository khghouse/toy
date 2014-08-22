package spring.service.gallery.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import spring.service.gallery.GalleryDao;

@Repository("galleryDaoImpl")
public class GalleryDaoImpl implements GalleryDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	@Override
	public List<String> getImgList() throws Exception {
		// TODO Auto-generated method stub
		
		
		return sqlSession.selectList("GalleryMapper.getImgList");
	}

}
