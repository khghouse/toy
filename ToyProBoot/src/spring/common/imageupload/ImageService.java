package spring.common.imageupload;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ImageService {
	private Map<String, ImageFile> imageFilesMap;
	
	public ImageService() {
		init();
	}
	
	
	private void init() {
		imageFilesMap = new HashMap<String, ImageFile>();
	}
	
	
	public ImageFile get(String id) {
		return imageFilesMap.get(id);
	}
	
	
	public ImageFile save(MultipartFile multipartFile) {
	
		String genId = UUID.randomUUID().toString();
		ImageFile imageFile = null;
		
		try {
			String savedFileName = saveToFile(multipartFile, genId);
			
			imageFile = new ImageFile(genId, 
					multipartFile.getContentType(),
					(int)multipartFile.getSize(),
					savedFileName);
			
			imageFilesMap.put(genId, imageFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return imageFile;
	}
	
	
	private String saveToFile(MultipartFile src, String id) throws IOException {
		String fileName = src.getOriginalFilename();
		byte[] bytes = src.getBytes();
		String saveFileName = id + "." + getExtension(fileName);
		String savePath = ImageFile.IMAGE_DIR + saveFileName;

		
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(savePath));
		bos.write(bytes);
		bos.flush();
		bos.close();
		
		return saveFileName;
	}
	
	
	private String getExtension(String fileName) {
		int dotPosition = fileName.lastIndexOf('.');
		
		if (-1 != dotPosition && fileName.length() - 1 > dotPosition) {
			return fileName.substring(dotPosition + 1);
		} else {
			return "";
		}
	}
}
