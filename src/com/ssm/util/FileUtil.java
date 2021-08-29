package com.ssm.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * 用来上传文件的
 */
public class FileUtil {
	private static List<String> exts = new ArrayList<String>();
	static {
		exts.add("image/jpeg");
	}

	/**
	 * 读取本地文件信息：将读取到的文件信息返回
	 * @param filepath 文件路劲
	 * @param encoding 编码格式
	 * @return
	 */
	public static String readFile(String filepath, String encoding) {
		String ret = "";

		//File file = new File(filepath);
		//BufferedReader类从字符输入流中读取文本并缓冲字符，以便有效地读取字符，数组和行
		BufferedReader reader = null;
		try {
			//FileInputStream流 用来读取本地文件  适合于读取二进制文件，而不太适合读取文本文件
			//程序读取文本文件时，可以以字符方式读取，也可以以字节方式读取
			//当程序读取二进制文件时，是以字节方式读取的，对读取数据的解释由读取程序决定
			//FileInputStream也提供了另外一种构造方法，该构造方法直接传入文件的存储路径
			//而无需实例化File对象。该构造方法把实例化File对象的语句放到了构造方法里面
			reader = new BufferedReader(new InputStreamReader(new FileInputStream(filepath), encoding));
			String tempString = null;
			//读取一整行
			while ((tempString = reader.readLine()) != null) {
				//将每一行读取的字节进行拼接，以形成原始文件
				ret += tempString;
			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}

		return ret;
	}

	public static boolean fileUploadAble(String ext) {
		// return exts.contains(ext);
		return true;
	}

	public static boolean isImage(String name) {
		return name.endsWith(".jpg") || name.endsWith(".jpeg") || name.endsWith(".png");
	}

	public static boolean isVideo(String name) {
		return name.endsWith(".mp4");
	}

	public static String getExt(String name) {
		int index = name.lastIndexOf('.');
		if (index > 0) {
			return name.substring(index);
		}
		return "";
	}

	/**
	 * springMVC上传文件，使用MultipartHttpServletRequest、MultipartFile进行文件上传
	 * 该方法用来上传文件操作
	 * @param request
	 * @param pname
	 * @return
	 */
	public static String uploadFile(HttpServletRequest request, String pname) {
		// 转换request，解析出request中的文件
		MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
		//获取上传的文件
		MultipartFile fileupload = mrequest.getFile(pname);
		String newFileName = null;
		try {
			if (fileupload != null && fileupload.getSize() > 0) {//存在文件上传

				String extName = "";
				//文件上传的路径  在Tomcat根目录下面的 /resource下面
				String savePath = request.getSession().getServletContext().getRealPath("/resource") + File.separator;
				//创建该文件
				File pathdir = new File(savePath);
				//该文件事先没有创建过则创建
				if (!pathdir.exists()) {
					pathdir.mkdirs();
				}
				Random r = new Random();

				int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000;
				//fileName = fileupload.getOriginalFilename();
				// 获取文件的后缀  
				extName = getExt(fileupload.getOriginalFilename());

				//生成文件名
				newFileName = new Date().getTime() + rannum + extName;
				//上传文件
				fileupload.transferTo(new File(savePath, newFileName));
				return newFileName;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String uploadFile(HttpServletRequest request, String pname, String savePath) {
		MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
		MultipartFile fileupload = mrequest.getFile(pname);
		String filePath = null;
		String newFileName = null;
		try {
			if (fileupload != null && fileupload.getSize() > 0) {//存在文件上传

				String extName = "";
				String nowTimeStr = "";
				SimpleDateFormat sDateFormat;

				File pathdir = new File(savePath);
				if (!pathdir.exists()) {
					pathdir.mkdirs();
				}
				Random r = new Random();

				int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000;
				sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
				nowTimeStr = sDateFormat.format(new Date());
				//fileName = fileupload.getOriginalFilename();
				// 获取文件的后缀  
				extName = getExt(fileupload.getOriginalFilename());

				newFileName = nowTimeStr + rannum + extName;
				filePath = savePath + newFileName;
				fileupload.transferTo(new File(filePath));
				return newFileName;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String uploadFile(MultipartFile fileupload, long sizeLimit, String serverPath) {
		String filePath = null;
		String newFileName = null;
		try {
			if (fileupload != null && fileupload.getSize() > 0) {//存在文件上传

				String extName = "";
				String nowTimeStr = "";
				SimpleDateFormat sDateFormat;

				String savePath = "resource";
				savePath = serverPath + File.separator + savePath + File.separator;
				File pathdir = new File(savePath);
				if (!pathdir.exists()) {
					pathdir.mkdirs();
				}
				Random r = new Random();

				int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000;
				sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
				nowTimeStr = sDateFormat.format(new Date());
				//fileName = fileupload.getOriginalFilename();
				// 获取文件的后缀  
				extName = getExt(fileupload.getOriginalFilename());

				newFileName = nowTimeStr + rannum + extName;
				filePath = savePath + newFileName;
				fileupload.transferTo(new File(filePath));
				return newFileName;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 下载文件
	 * 
	 * @param request
	 * @param response
	 * @param storeName
	 * @param contentType
	 * @param realName
	 * @throws Exception
	 */
	public static void download(HttpServletRequest request, HttpServletResponse response, String storeName, String contentType,
			String realName) throws Exception {
		request.setCharacterEncoding("UTF-8");
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			String downLoadPath = storeName;

			long fileLength = new File(downLoadPath).length();

			response.setContentType(contentType);
			response.setHeader("Content-disposition", "attachment; filename=" + new String(realName.getBytes("utf-8"), "ISO8859-1"));
			response.setHeader("Content-Length", String.valueOf(fileLength));

			bis = new BufferedInputStream(new FileInputStream(downLoadPath));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (bis != null)
				bis.close();
			if (bos != null)
				bos.close();
		}

	}
}
