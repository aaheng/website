package cn.website.common.pojo;

/**
 * 这是一个用来当做响应结果的类
 */
public class SResponse {
    private int code;

	private String msg;

	private Object result;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getResult() {
		return result;
	}

	public void setResult(Object result) {
		this.result = result;
	}


}
