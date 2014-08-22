package spring.common.imageupload;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;


@Component("imageView")
public class ImageView extends AbstractView{
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
		ImageFile imageFile = (ImageFile)model.get("imageFile");
		
		res.setContentLength(imageFile.getContentLength());
		res.setContentType(imageFile.getContentType());
		
		byte[] bytes = readFile(imageFile.getFileName());
		write(res, bytes);
	}

	
	private byte[] readFile(String fileName) throws IOException {
		String path = ImageFile.IMAGE_DIR + fileName;
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(path));
		int length = bis.available();
		byte[] bytes = new byte[length];
		bis.read(bytes);
		bis.close();
		
		return bytes;
	}

	
	private void write(HttpServletResponse res, byte[] bytes) throws IOException {
		OutputStream output = res.getOutputStream();
		output.write(bytes);
		output.flush();
	}
}
