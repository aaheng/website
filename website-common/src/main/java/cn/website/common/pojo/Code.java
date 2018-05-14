package cn.website.common.pojo;

import java.io.Serializable;

public class Code implements Serializable {
    public static final int SUCCESS_CODE = 200;
	public static final String SUCCESS_MSG = "成功！";

	public static final int FAIL_CODE = -200;
	public static final String FAIL_MSG = "失败！";

	public static final int EXCEPTION_CODE = 4000;
	public static final String EXCEPTION_MSG = "接口出现异常，请稍后再试！";

	public static final int PARAMS_ERROR_CODE = 4002;
	public static final String PARAMS_ERROR_MSG = "参数错误";

	public static final int USER_EXIST_CODE = 4003;
	public static final String USER_EXIST_MSG = "用户名已存在";

	public static final int PHONE_EXIST_CODE = 4004;
	public static final String PHONE_EXIST_MSG = "该手机号码已被注册";

	public static final int USER_NOEXIST_CODE = 4005;
	public static final String USER_NOEXIST_MSG = "用户名不存在";

	public static final int PASSWORD_ERROR_CODE = 4006;
	public static final String PASSWORD_ERROR_MSG = "密码错误";

    public static final int USER_UN_LOGIN_CODE = 999;
    public static final String USER_UN_LOGIN_MSG = "用户未登录";

	public static final int USER_LOGIN_CODE = 888;
	public static final String USER_LOGIN_MSG = "用户已登录";

    public static final int MESSAGE_RECEIVER_NONE_CODE = 4008;
    public static final String MESSAGE_RECEIVER_NONE_MSG = "接收消息的用户不能为空";

    public static final int UPLOAD_SUCCESS_CODE = 4009;
	public static final String UPLOAD_SUCCESS_MSG = "上传成功";

	public static final int UPLOAD_FAIL_CODE = 4010;
	public static final String UPLOAD_FAIL_MSG = "上传失败";

	public static final int QUESTION_NOT_EXIST_CODE = 4011;
	public static final String QUESTION_NOT_EXIST_MSG = "问题不存在";


	public static final int PARAM_ERROR_CODE = 4012;
	public static final String PARAM_ERROR_MSG = "参数错误";

	public static final int IMAGE_SIZE_LIMIT_CODE = 4013;
	public static final String IMAGE_SIZE_LIMIT_MSG = "图片大小超过限制";

	public static final int IMAGE_TYPE_ERROR_CODE = 4014;
	public static final String IMAGE_TYPE_ERROR_MSG = "文件类型错误";
}
