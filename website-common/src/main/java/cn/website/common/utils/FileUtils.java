package cn.website.common.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;


/**
 * @author xzs
 * 2016-3-15  下午4:43:00
 * 文件工具类
 */
public class FileUtils {

	/**
	 * 获取资源路径
	 * @return
	 */
	public static String getResourcePath(String fileP){
		String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""));	//项目路径
		filePath = filePath.replaceAll("file:/", "");
		filePath = filePath.replaceAll("%20", " ");
		filePath = filePath.trim() + fileP.trim();
		if(filePath.indexOf(":") != 1){
			filePath = File.separator + filePath;
		}

		return filePath;
	}

	/**
	 * 获取邀请数据的项目路径
	 * @return
	 */
	public static String getDataPath(String fileP){
		String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../";	//项目路径
		filePath = filePath.replaceAll("file:/", "");
		filePath = filePath.replaceAll("%20", " ");
		filePath = filePath.trim() + fileP.trim();
		if(filePath.indexOf(":") != 1){
			filePath = File.separator + filePath;
		}

		return filePath;
	}

	/**
	 * 获取tomcat目录
	 * @return
	 */
	public static String getTomcatPath(){
		return System.getProperty("catalina.home");
	}

	/*
	 * 获取WEB-INF目录
	 */
	public static String getWebInfPath(){
		String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../").replaceAll("file:/", "").replaceAll("%20", " ").trim();
		if(path.indexOf(":") != 1){
			path = File.separator + path;
		}
		return path;
	}

	/**
	 * 文件末尾拼接数据
	 * 以拼接的形式写入
	 * @param filePath
	 * @param content	内容
	 * @param separator	分隔符
	 * @throws IOException
	 */
	/*public static void appendFile(String filePath,String content,String separator) {

		FileWriter writer = null;

		try {

			createFile(filePath);

            // 打开一个写文件器，构造函数中的第二个参数true表示以追加形式写文件
            writer = new FileWriter(filePath, true);
            if(TextUtils.isEmpty(separator)){
            	writer.write(content);
            }
            else{
            	writer.write(content+separator);
            }
        }
		catch (IOException e) {
            e.printStackTrace();
        }
		finally {
            try {
                if(writer != null){
                    writer.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
	}*/

	/**
	 * 清空文件
	 * 以覆盖的形式写入
	 * @param filePath
	 */
	public static void writeFile(String filePath,String content){
		FileWriter writer = null;

		try {
			createFile(filePath);
            writer = new FileWriter(filePath);
            writer.write(content);
        }
		catch (IOException e) {
            e.printStackTrace();
        }
		finally {
            try {
                if(writer != null){
                    writer.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
	}

	/**
	 * 读取文件
	 * @param filePath
	 * @param charset	(GBK)
	 * @return
	 * @throws IOException
	 */
	public static String readFile(String filePath,String charset) throws IOException{

		File f = new File(filePath);
		if (!f.exists()) {
			return null;
		}

		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
		try{
			fis = new FileInputStream(f);
			isr=new InputStreamReader(fis, charset);
			br = new BufferedReader(isr);

			String line="";
			String lineStr="";
	        while ((line=br.readLine()) != null) {
	        	lineStr += line;
	        }

	        return lineStr;
		}
		catch(IOException e){
			throw e;
		}
		finally{

			if(br != null){
				br.close();
			}
			if(isr != null){
				isr.close();
			}
			if(fis != null){
				fis.close();
			}
		}
	}

	/**
     * 删除空目录
     * @param dir 将要删除的目录路径
     */
    private static void doDeleteEmptyDir(String dir) {
        boolean success = (new File(dir)).delete();
        if (success) {
            System.out.println("Successfully deleted empty directory: " + dir);
        } else {
            System.out.println("Failed to delete empty directory: " + dir);
        }
    }

    /**
     * 递归删除目录下的所有文件及子目录下所有文件
     * @param dir 将要删除的文件目录
     * @return boolean Returns "true" if all deletions were successful.
     *                 If a deletion fails, the method stops attempting to
     *                 delete and returns "false".
     */
    public static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            //递归删除目录中的子目录下
            for (int i=0; i<children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        // 目录此时为空，可以删除
        return dir.delete();
    }

    /**
	 * 创建文件
	 * @param filePath
	 */
	public static void createFile(String filePath){
		try{
			File file = new File(filePath);

			if(!file.getParentFile().exists()){
				file.getParentFile().mkdirs();
            }

			if (!file.exists()) {
				file.createNewFile();
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * 删除本地临时图片
	 * @param local_path
	 * @return
	 */
	public static boolean deleteLocalDir(String local_path){

		//获取本地存储目录
    	File file = new File(local_path);

		if(file.exists()){
			if(deleteDir(file)){
				return true;
			}
		}

		return false;
	}

	public static void main(String[] args) throws Exception {

		/*try {
			readFile("E:/test.csv");
		} catch (IOException e) {
			e.printStackTrace();
		}*/

		 /*String str = URLEncoder.encode("中文字符","utf-8");
		 System.out.println(str);*/

		//appendFile("e://text.txt", "123","#");

	}
}
