package spring.service.gallery.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import spring.service.gallery.GalleryDao;
import spring.service.gallery.GalleryService;
import spring.service.toyproduct.ToyProductDao;
@Service("galleryServiceImpl")
public class GalleryServiceImpl implements GalleryService {

	@Autowired
	@Qualifier("galleryDaoImpl")
	private GalleryDao galleryDao;
	@Override
	public List<String> getImgList() throws Exception {
		// 
		return galleryDao.getImgList();
	}

}
