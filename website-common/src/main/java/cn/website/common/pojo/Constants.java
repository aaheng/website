package cn.website.common.pojo;

import cn.website.common.utils.FileUtils;

public class Constants {

	public static String img_preview_url = "http://localhost:8081/";	// 图片预览地址
	public static String img_preview_dir = "UploadPic";   //图片存放的目录
	public static String img_thumbnail_dir = "thumbnail"; //图片对应缩略图存放的目录



	public static final int MAX_IMG_SIZE = 500 * 1024; // 上传最大文件 500K

	//public static final String UPLOAD_PATH	= FileUtils.getTomcatPath() + "\\webapps\\ROOT\\"+img_preview_dir+"\\";//图片上传地址
	public static final String UPLOAD_PATH = img_preview_dir;
	public static final String THUMBNAIL_PATH = UPLOAD_PATH + "\\" + img_thumbnail_dir + "\\";//图片上传缩略图地址
}
