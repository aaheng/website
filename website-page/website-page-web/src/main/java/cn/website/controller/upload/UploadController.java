package cn.website.controller.upload;

import cn.website.common.pojo.Code;
import cn.website.common.pojo.Constants;
import cn.website.common.pojo.SResponse;
import com.alibaba.fastjson.JSONObject;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.InputStream;
import java.util.UUID;

@Controller
@RequestMapping("/upload")
public class UploadController {

    @RequestMapping("/uploadImage")
	@ResponseBody
	public SResponse uploadImage(MultipartFile file, HttpServletRequest request) throws Exception {

		SResponse response = new SResponse();
		if (file == null) {
			response.setCode(Code.PARAM_ERROR_CODE);
			response.setMsg(Code.PARAM_ERROR_MSG);
			return response;
		}
		// 判断文件大小,不能大于500k
		long fileSize = file.getSize();// 获取文件的字节大小，单位byte
		if (fileSize > Constants.MAX_IMG_SIZE) {
			response.setCode(Code.IMAGE_SIZE_LIMIT_CODE);
			response.setMsg(Code.IMAGE_SIZE_LIMIT_MSG);
			return response;
		}

		String filename = file.getOriginalFilename(); // 获取文件原名称
		if (filename == null) {
			response.setCode(Code.PARAM_ERROR_CODE);
			response.setMsg(Code.PARAM_ERROR_MSG);
			return response;
		}
		// 获取上传文件的类型
		String type = filename.indexOf(".") != -1 ? filename.substring(filename.lastIndexOf(".") + 1, filename.length())
				: null;
		// 判断文件类型是否为空,且图片类型应该为GIF,JPG和PNG三种格式
		if (type == null || (!"GIF".equals(type.toUpperCase()) && !"JPG".equals(type.toUpperCase())
				&& !"PNG".equals(type.toUpperCase()))) {
			response.setCode(Code.IMAGE_TYPE_ERROR_CODE);
			response.setMsg(Code.IMAGE_TYPE_ERROR_MSG);
			return response;
		}
		// 获取文件的流
		InputStream is = file.getInputStream();

		// 存放图片的目录
		String realPathDir = request.getSession().getServletContext().getRealPath(Constants.UPLOAD_PATH);
		File dir = new File(realPathDir);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}

		Thumbnails.Builder<? extends InputStream> builder = Thumbnails.of(is).outputFormat(type);

		// 获取图片的名称
		String imgName = UUID.randomUUID().toString().replace("-", "");
		String picName = imgName + "." + type;
		// 地址
		File picFile = new File(realPathDir + "/" + picName);
		// 保存
		builder.scale(1.0).toFile(picFile);

		// 保存缩略图
		String realPaththumbnailDir = request.getSession().getServletContext().getRealPath(Constants.THUMBNAIL_PATH);
		File thumbnailDir = new File(realPaththumbnailDir);// 存放缩略图的目录
		if (!thumbnailDir.isDirectory()) {
			thumbnailDir.mkdirs();
		}

		Thumbnails.Builder<File> thumbnailBuilder = Thumbnails.of(picFile).outputFormat(type);
		String thumbnailPicName = imgName + "_thumbnail." + type; // 缩略图名称
		float fs = 100f; // 缩略图图片大小100kb
		float quality = (fs * 1024) / fileSize;
		if (quality < 1) { // 大于100k
			if (quality < 0.3) {
				quality = 0.3f;
			}
			thumbnailBuilder.scale(0.6).outputQuality(quality);
		} else {
			thumbnailBuilder.scale(1.0);
		}

		thumbnailBuilder.toFile(new File(realPaththumbnailDir + "/" + thumbnailPicName));

		response.setCode(Code.SUCCESS_CODE);
		response.setMsg(Code.SUCCESS_MSG);
		// 将原图片的缩略图的访问地址返回
		JSONObject result = new JSONObject();
		result.put("imgPath", Constants.img_preview_url + Constants.img_preview_dir + "/" + picName);
		result.put("thumbnailImgPath", Constants.img_preview_url + Constants.img_preview_dir + "/"
				+ Constants.img_thumbnail_dir + "/" + thumbnailPicName);
		response.setResult(result);
		return response;
	}

}
