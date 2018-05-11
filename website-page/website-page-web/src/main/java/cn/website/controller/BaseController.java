package cn.website.controller;

import java.util.Iterator;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.website.common.plugins.PageData;
import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author xzs
 * 2016-11-14  下午2:51:36
 * 控制器基类
 */
public class BaseController {
	
	private final Logger log = Logger.getLogger(BaseController.class);
	
	/**
	 * 得到PageData
	 */
	public PageData getPageData(){
		PageData pd = new PageData(this.getRequest());
		return pd;
	}
	
	/**
	 * 获取排序的请求参数
	 * @return
	 */
	public SortedMap<Object,Object> getSortedParams(){
		
		HttpServletRequest request = getRequest();
		
		SortedMap<Object,Object> returnMap = new TreeMap<Object,Object>();
		
		Map properties = request.getParameterMap();
		Iterator entries = properties.entrySet().iterator(); 
		Map.Entry entry; 
		String name = "";  
		String value = "";  
		while (entries.hasNext()) {
			entry = (Map.Entry) entries.next(); 
			name = (String) entry.getKey(); 
			
			Object valueObj = entry.getValue(); 
			if(null == valueObj){ 
				value = ""; 
			}else if(valueObj instanceof String[]){ 
				String[] values = (String[])valueObj;
				for(int i=0;i<values.length;i++){ 
					 value = values[i] + ",";
				}
				value = value.substring(0, value.length()-1); 
			}else{
				value = valueObj.toString(); 
			}
			
			//log.warn(name + " : " + value);
			
			returnMap.put(name, value); 
		}
		
		return returnMap;
	}
	
	/**
	 * 得到ModelAndView
	 */
	public ModelAndView newModelAndView(){
		return new ModelAndView();
	}
	
	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		return request;
	}
	
	/**
	 * 获取session值
	 * @param key
	 * @return
	 */
	public <T> T getSessionAttr(String key){
		HttpSession session = getRequest().getSession();
		return (T) session.getAttribute(key);
	}
	
	/**
	 * 保存session
	 * @param key
	 * @param value
	 */
	public void setSessionAttr(String key,Object value){
		HttpSession session = getRequest().getSession();
		session.setAttribute(key, value);
	}
	
	/**
	 * 移除session
	 * @param key
	 */
	public void removeSessionAttr(String key){
		HttpSession session = getRequest().getSession();
		session.removeAttribute(key);
	}

	/**
	 * 获取登录用户的IP
	 * @throws Exception 
	 */
	public void getRemortIP(String USERNAME) throws Exception {  
		PageData pd = new PageData();
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		pd.put("USERNAME", USERNAME);
		pd.put("IP", ip);
		//userService.saveIP(pd);
	} 
	
}
