package com.greencloud.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.greencloud.util.StringUtil;

/**
 *将文件或是文件夹打包压缩成zip格式
 * @author pwt
 */
public class ZipUtils {
    private static final Logger log = LoggerFactory.getLogger(ZipUtils.class);
        
    private ZipUtils(){};
   /**
     * 创建ZIP文件
     * @param sourcePath 文件或文件夹路径
     * @param zipPath 生成的zip文件存在路径（包括文件名）
     */
    public static void createZip(String sourcePath, String zipPath) {
        FileOutputStream fos = null;
        ZipOutputStream zos = null;
        try {
            fos = new FileOutputStream(zipPath);
            zos = new ZipOutputStream(fos);
            writeZip(new File(sourcePath), "", zos);
        } catch (FileNotFoundException e) {
            log.error("创建ZIP文件失败",e);
        } finally {
            try {
                if (zos != null) {
                    zos.close();
                }
            } catch (IOException e) {
                log.error("创建ZIP文件失败",e);
            }
        }
    }
    private static void writeZip(File file, String parentPath, ZipOutputStream zos) {
        if(file.exists()){
            if(file.isDirectory()){//处理文件夹
            	parentPath+=file.getName()+File.separator;
                File [] files=file.listFiles();
                for(File f:files){
//                	if(f.isDirectory()){
//                		 parentPath+=f.getName()+"/";
//                         System.out.println(parentPath);
//                         writeZip(f, parentPath, zos);
//                	}
//                	else{
//                		writeZip(f, parentPath, zos);
//                	}
                	writeZip(f, parentPath, zos);
                }
            }else{
                FileInputStream fis=null;
                DataInputStream dis=null;
                try {
                    fis=new FileInputStream(file);
                    dis=new DataInputStream(new BufferedInputStream(fis));
                    
                    if(StringUtil.isEmpty(parentPath)){
                    	  ZipEntry ze = new ZipEntry(file.getName());
                    	  zos.putNextEntry(ze);
                    }else{
                          ZipEntry ze = new ZipEntry(parentPath + file.getName());
                          zos.putNextEntry(ze);
                    }
                    byte [] content=new byte[1024];
                    int len;
                    while((len=fis.read(content))!=-1){
                        zos.write(content,0,len);
                        zos.flush();
                    }
                } catch (FileNotFoundException e) {
                    log.error("创建ZIP文件失败",e);
                } catch (IOException e) {
                    log.error("创建ZIP文件失败",e);
                }finally{
                    try {
                        if(dis!=null){
                            dis.close();
                        }
                    }catch(IOException e){
                        log.error("创建ZIP文件失败",e);
                    }
                }
            }
        }
    } 
    /**
     * 压缩文件夹
     * @param sourceDIR 文件夹名称（包含路径）
     * @param targetZipFile 生成zip文件名
     * @author pwt
     */
    @SuppressWarnings("resource")
	public static void zipDIR(String sourceDIR, String targetZipFile) {
        try {
            FileOutputStream target = new FileOutputStream(targetZipFile);
            ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(target));
            int BUFFER_SIZE = 1024;
            byte buff[] = new byte[BUFFER_SIZE];
            File dir = new File(sourceDIR);
            if (!dir.isDirectory()) {
                throw new IllegalArgumentException(sourceDIR+" is not a directory!");
            }
            File files[] = dir.listFiles();
      
            for (int i = 0; i < files.length; i++) {
                FileInputStream fi = new FileInputStream(files[i]);
                BufferedInputStream origin = new BufferedInputStream(fi);
                ZipEntry entry = new ZipEntry(files[i].getName());
                out.putNextEntry(entry);
                int count;
                while ((count = origin.read(buff)) != -1) {
                    out.write(buff, 0, count);
                }
                origin.close();
            }
            out.close();
      
        } catch (IOException e) {
        	log.error("创建ZIP文件失败",e);
        }
    }
    public static void  FileTool(String rootDir,String fileSuffix){
    	
    	FileOutputStream fos = null;
    	ZipOutputStream  zos = null;
    	try {
    		//设置工作目录和文件后缀名
    		File f = new File(rootDir);
    		File[] files = f.listFiles();
    	    fos = new FileOutputStream(fileSuffix) ;
		    zos = new ZipOutputStream(fos);
		    //如果存在 先删除
			new File(fileSuffix).delete();
				//开始压缩
	    		for (File subFile : files) {
	    			//如果是文件夹
	    			if (subFile.isDirectory()){
	    			    File[] jpgs=subFile.listFiles();
							for(File jpg:jpgs){
								if(jpg.getName().indexOf(".zip")<0){
			    					zos.putNextEntry(new ZipEntry("assets/"+subFile.getName()+"/"+jpg.getName()));
			    					InputStream is=new FileInputStream(jpg);
			    					byte content[]=new byte[1024];
			    					while(is.read(content)!=-1){
			    						zos.write(content);
			    					}
			    					is.close();
		    					}
		    				}
	    			}else{
	    				if(subFile.getName().indexOf(".zip")<0){
							zos.putNextEntry(new ZipEntry("assets/"+subFile.getName()));
							InputStream is=new FileInputStream(subFile);
							byte content[]=new byte[1024];
							while(is.read(content)!=-1){
								zos.write(content);
							}
							is.close();
	    				}
	    			}
	    		}
    		}catch (IOException e) {
                log.error("创建ZIP文件失败",e);
            } finally {
                try {
                    if (zos != null) {
                        zos.close();
                    }
                } catch (IOException e) {
                    log.error("创建ZIP文件失败",e);
                }
            }
    }

//    public static void main(String [] args){
//    	FileTool("E:\\AA绿云\\gcServerSpace\\pos\\WebRoot\\WEB-INF\\assets", "E:\\AA绿云\\gcServerSpace\\pos\\WebRoot\\WEB-INF\\assets4.zip");
//    }
}
