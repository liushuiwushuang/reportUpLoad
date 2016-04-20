package com.mvc.controller;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Iterator;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.Vo.ReportVo;
import com.mvc.entity.NewTech;
import com.mvc.entity.Paper;
import com.mvc.entity.Report;
import com.mvc.service.NewTechService;
import com.mvc.service.PaperService;
import com.mvc.service.ReportService;
import com.mvc.util.PropertiesReader;
import com.mvc.util.ReportUtil;

@Controller
@RequestMapping("/reportRequest.do")
public class ReportController {
	protected final transient Log log = LogFactory
	.getLog(ReportController.class);
	@Autowired
	private ReportService reportService;
	@Autowired
	private PaperService paperService;
	@Autowired
	private NewTechService newTechService;
	
	public ReportController(){
		
	}
	
	@RequestMapping
	public String load(ModelMap modelMap){
		List<Object> list = reportService.getReportList();
		modelMap.put("list", list);
		return "report_list";
	}
	
	@RequestMapping(params = "method=upload")
	public String upload(HttpServletRequest request, HttpServletResponse response ,ModelMap modelMap) throws Exception{
		

		HttpSession session = request.getSession();
		String userName = session.getAttribute("userName").toString();
		String uploadPath=PropertiesReader.getSaveFilePath()+userName;
		
		File folder = new File(uploadPath);
		if(!folder.exists())
			folder.mkdirs();
		String fileName="";
		String message=null;
		String content=null;
		String dtme=null;
		if(ServletFileUpload.isMultipartContent(request)){  //判断是否获取的是文件
			DiskFileItemFactory disk=new DiskFileItemFactory();
			disk.setSizeThreshold(20*1024);                 //设置内存可存字节数
			disk.setRepository(disk.getRepository());       //设置临时文件目录
			ServletFileUpload up=new ServletFileUpload(disk);
			int maxsize=100*1024*1024;
			List list=null;
			try{
				list=up.parseRequest(request);              //获取上传列表
			}
			catch(Exception e){
				e.printStackTrace();
			}
			Iterator i=list.iterator(); 
			while(i.hasNext()){
				FileItem fm=(FileItem)i.next();             //遍历列表
				
				if(!fm.isFormField()){
					String filePath = fm.getName();	//获取文件全路径名
					int startIndex = filePath.lastIndexOf("\\");
					if(startIndex!=-1){						//对文件名进行截取
						fileName = filePath.substring(startIndex+1);
					}else{
						fileName=filePath;
					}
					if(fm.getSize()>maxsize){
						message="文件太大了，不要超过100MB";
						break;
					}
					String fileSize=new Long(fm.getSize()).toString();
					if((fileName==null)||(fileName.equals(""))&&(fileSize.equals("0"))){
						message="文件名不能为空，文件大小也不能为零！";
						break;
					}
					File saveFile=new File(uploadPath,fileName);
					saveFile.setReadable(true, false);
					saveFile.setWritable(true, false);
					try{
						fm.write(saveFile);                //向文件中写入数据
						message="文件上传成功！";
					}
					catch(Exception e1){
						e1.printStackTrace();
					}
				}
				else{
					String foename=fm.getFieldName();     //获取表单元素名
					String con=fm.getString("utf-8");       //获取表单内容，注意编码方式
					//表单元素
					if(foename.equals("upDe")){
						 content = con;
					}
					else if(foename.equals("uptime")){
						 dtme = con;
					}
				}
			}
		}
		modelMap.put("result",message);
		modelMap.put("fileName", fileName);
		modelMap.put("upDe",content);
		modelMap.put("dtme",dtme);
		return "new_report";
	}
	
	@RequestMapping(params = "method=add")
	public String add(ReportVo reportVo,HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		Report report = new Report();
		report.setReTitle(request.getParameter("reTitle"));
		report.setReAbstract(request.getParameter("reAbstract"));
		
		report.setReMan(request.getParameter("reMan"));
		report.setReTime(request.getParameter("reTime"));
		report.setRelatedMaterials(request.getParameter("relatedMaterials"));
		report.setReType(request.getParameter("reType"));
		
		String materialName = request.getParameter("materialName");
		String materialAddress = request.getParameter("materialAddress");
		
		HttpSession session = request.getSession();
		String userName = session.getAttribute("userName").toString();
		String uploadPath=PropertiesReader.getSaveFilePath2()+userName;
		materialAddress= uploadPath;
		String materialUptime = request.getParameter("materialUptime"); 
		
		reportService.save(report);
		Report re= (Report)reportService.getReIdByReTitle(report.getReTitle());
		if("1".equals(re.getReType())){
			Paper paper = new Paper();
			paper.setPaYear(request.getParameter("paYear"));
			paper.setPaAuther(request.getParameter("paAuther"));
			paper.setPaOrigin(request.getParameter("paOrigin"));
			paper.setReId(re.getReId());
			paper.setMaterialName(materialName);
			paper.setMaterialAddress(materialAddress);
			paper.setMaterialUptime(materialUptime);
			paperService.save(paper);
		}else{
			NewTech newTech = new NewTech();
			newTech.setNeReference(request.getParameter("neReference"));
			newTech.setReId(re.getReId());
			newTech.setMaterialName(materialName);
			newTech.setMaterialAddress(materialAddress);
			newTech.setMaterialUptime(materialUptime);
			newTechService.save(newTech);
		}
		
		return "report_mid";
	}
	
	@RequestMapping(params = "method=lookDetail")
	public String lookDetail(HttpServletRequest request, ModelMap modelMap){
		Integer reId = Integer.valueOf(request.getParameter("reId"));
		Report report = (Report) reportService.getReport(reId);
		reportService.delete(report);
		
		List<Object> list = reportService.getReportList();
		modelMap.put("list", list);
		return "report_list";
	}
	
	/*
	@RequestMapping(params = "method=lookDetails")
	public String lookDetails(HttpServletRequest request, ModelMap modelMap){
		Integer reId = Integer.valueOf(request.getParameter("reId"));
		Report report = (Report) reportService.getReport(reId);
		ReportVo reportVo = ReportUtil.convertToVo(report);
		if("1".equals(reportVo.getReType())){
			Paper paper = (Paper) paperService.getPaper(reId);
			reportVo.setPaYear(paper.getPaYear());
			reportVo.setPaAuther(paper.getPaAuther());
			reportVo.setPaOrigin(paper.getPaOrigin());
			reportVo.setMaterialName(paper.getMaterialName());
			reportVo.setMaterialAddress(paper.getMaterialAddress());
			reportVo.setMaterialUptime(paper.getMaterialUptime());
		}else{
			NewTech newTech = (NewTech) newTechService.getNewTech(reId);
			reportVo.setNeReference(newTech.getNeReference());
			reportVo.setMaterialName(newTech.getMaterialName());
			reportVo.setMaterialAddress(newTech.getMaterialAddress());
			reportVo.setMaterialUptime(newTech.getMaterialUptime());
		}
		
		modelMap.put("reportVo", reportVo);
		return "report_detail";
	}
	*/
	
	@RequestMapping(params = "method=download")
	public void download(HttpServletRequest request, HttpServletResponse response ,ModelMap modelMap) throws Exception{
	
		Integer reId = Integer.valueOf(request.getParameter("reId"));
		Report report = (Report) reportService.getReport(reId);
		ReportVo reportVo = ReportUtil.convertToVo(report);
		if("1".equals(reportVo.getReType())){
			Paper paper = (Paper) paperService.getPaper(reId);
			reportVo.setPaYear(paper.getPaYear());
			reportVo.setPaAuther(paper.getPaAuther());
			reportVo.setPaOrigin(paper.getPaOrigin());
			reportVo.setMaterialName(paper.getMaterialName());
			reportVo.setMaterialAddress(paper.getMaterialAddress());
			reportVo.setMaterialUptime(paper.getMaterialUptime());
		}else{
			NewTech newTech = (NewTech) newTechService.getNewTech(reId);
			reportVo.setNeReference(newTech.getNeReference());
			reportVo.setMaterialName(newTech.getMaterialName());
			reportVo.setMaterialAddress(newTech.getMaterialAddress());
			reportVo.setMaterialUptime(newTech.getMaterialUptime());
		}
		
		String materialName = reportVo.getMaterialName();
		String materialAddress = reportVo.getMaterialAddress();
		String[] names = materialAddress.split("\\/");  
		String realPath = PropertiesReader.getSaveFilePath()+names[names.length-1];
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		File file = new File(realPath,materialName);
		long fileLength = file.length();
		response.setHeader("Content-disposition", "attachment; filename="
				+ new String(materialName.getBytes("utf-8"), "ISO-8859-1"));
		response.setHeader("Content-Length", String.valueOf(fileLength));
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/octet-stream");
		
		bis = new BufferedInputStream(new FileInputStream(file));
		bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buff = new byte[2048];
		int bytesRead;
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff, 0, bytesRead);
		}
		bis.close();
		bos.close();
		
	}
}