package com.greencloud.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import com.greencloud.util.StringUtil;

public class XmlUtil4SpringQuartz {

	@SuppressWarnings({ "rawtypes", "deprecation" })
	public String updateSpringQuartz(String tasks) throws UnsupportedEncodingException, FileNotFoundException {

		String msg = "sucess";
		SAXReader reader = new SAXReader();
		URL filePath = this.getClass().getClassLoader().getResource("spring/spring-quartz.xml");
		
		Document document = null;
		try {
			// 通过read方法读取一个文件 转换成Document对象
			document = reader.read(new File(filePath.toURI()));
			// 获取根节点元素对象
			Element root = document.getRootElement();
			// 遍历所有的元素节点
			@SuppressWarnings("unchecked")
			Iterator<Element> it = root.elementIterator();
			// 遍历
			while (it.hasNext()) {
				// 获取某个子节点对象
				Element e = it.next();
				// System.out.print("::::"+e.attributeValue("id"));
				if ("startQuertz".equalsIgnoreCase(e.attributeValue("id"))) {
					// 对子节点进行遍历
					@SuppressWarnings("unchecked")
					List<Element> elements = e.elements();
					for (Element element : elements) {
						if ("property".equalsIgnoreCase(element.getName())) {
							@SuppressWarnings("unchecked")
							List<Element> lists = element.elements();
							for (Element taskList : lists) {
								
								if ("list".equalsIgnoreCase(taskList.getName())) {
									// 获取当前节点下的所有子节点，判断其值，以进行修改
									List childelements = taskList.elements("ref");
									
									for (Iterator childs = childelements.iterator(); childs
											.hasNext();) {
										Element everyone = (Element) childs.next();
										taskList.remove(everyone);
									}
                                    if(tasks!=null && tasks!=""){
                                    	String [] taskArr=  tasks.split(",");
                                    	for(int i=0;i<taskArr.length;i++){
                                    		if(StringUtil.isNotEmpty(taskArr[i])){
	                                    		Element resource = taskList.addElement("ref");
	        									resource.setAttributeValue("bean", taskArr[i]);
	                                    	    //   System.out.println(taskArr[i]);
        									}
                                    	   }
                                    }
									break;
								}
							}
							break;
						}
					}
				}
			}
		} catch (DocumentException | URISyntaxException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			msg = "error";
		}
		try {
			OutputFormat format = OutputFormat.createPrettyPrint();
			// 设置编码
			format.setEncoding("UTF-8");
			// 创建XMLWriter对象,指定了写出文件及编码格式
			XMLWriter writer;
			writer = new XMLWriter(new OutputStreamWriter(
					 new FileOutputStream(new File(filePath.toURI())), "UTF-8"),format);
			writer.write(document);
			// 立即写入
			writer.flush();
			// 关闭操作
			writer.close();
		} catch (URISyntaxException | IOException e) {
			e.printStackTrace();
			msg = "error";
		}
		return msg;
	}

}
