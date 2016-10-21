package com.greencloud.utils;

/**
 *  缩略图实现，将图片(jpg、bmp、png、gif等等)真实的变成想要的大小
 */
import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.commons.lang.StringUtils;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/*******************************************************************************
 * 缩略图类（通用） 本java类能将jpg、bmp、png、gif图片文件，进行等比或非等比的大小转换。 具体使用方法
 * compressPic(大图片路径,生成小图片路径,大图片文件名,生成小图片文名,生成小图片宽度,生成小图片高度,是否等比缩放(默认为true))
 */
@SuppressWarnings("restriction")
public class CompressPicUtil {
	private File file = null; // 文件对象
	private String inputDir; // 输入图路径
	private String outputDir; // 输出图路径
	private String inputFileName; // 输入图文件名
	private String outputFileName; // 输出图文件名
	private int outputWidth = 100; // 默认输出图片宽
	private int outputHeight = 100; // 默认输出图片高
	private boolean proportion = true; // 是否等比缩放标记(默认为等比缩放)

	public CompressPicUtil() { // 初始化变量
		inputDir = "";
		outputDir = "";
		inputFileName = "";
		outputFileName = "";
		outputWidth = 100;
		outputHeight = 100;
	}

	public void setInputDir(String inputDir) {
		this.inputDir = inputDir;
	}

	public void setOutputDir(String outputDir) {
		this.outputDir = outputDir;
	}

	public void setInputFileName(String inputFileName) {
		this.inputFileName = inputFileName;
	}

	public void setOutputFileName(String outputFileName) {
		this.outputFileName = outputFileName;
	}

	public void setOutputWidth(int outputWidth) {
		this.outputWidth = outputWidth;
	}

	public void setOutputHeight(int outputHeight) {
		this.outputHeight = outputHeight;
	}

	public void setWidthAndHeight(int width, int height) {
		this.outputWidth = width;
		this.outputHeight = height;
	}

	/*
	 * 获得图片大小 传入参数 String path ：图片路径
	 */
	public long getPicSize(String path) {
		file = new File(path);
		return file.length();
	}

	/**
	 * 获取图片宽度
	 * 
	 * @param path
	 * @return
	 */
	public int getPicWidth(String path) {
		try {
			file = new File(path);
			Image img = ImageIO.read(file);
			return img.getWidth(null);
		} catch (Exception e) {
			return 0;
		}
	}

	/**
	 * 获取图片高度
	 * 
	 * @param path
	 * @return
	 */
	public int getPicHeight(String path) {
		try {
			file = new File(path);
			Image img = ImageIO.read(file);
			return img.getHeight(null);
		} catch (Exception e) {
			return 0;
		}
	}

	// 图片处理
	public String compressPic() {
		try {
			// 获得源文件
			file = new File(inputDir + inputFileName);
			if (!file.exists()) {
				return "";
			}
			Image img = ImageIO.read(file);
			// 判断图片格式是否正确
			if (img.getWidth(null) == -1) {
				System.out.println(" can't read,retry!" + "<BR>");
				return "no";
			} else {
				int newWidth;
				int newHeight;
				// 判断是否是等比缩放
				if (this.proportion == true) {
					// 为等比缩放计算输出的图片宽度及高度
					double rate1 = ((double) img.getWidth(null)) / (double) outputWidth + 0.1;
					double rate2 = ((double) img.getHeight(null)) / (double) outputHeight + 0.1;
					// 根据缩放比率大的进行缩放控制
					double rate = rate1 > rate2 ? rate1 : rate2;
					newWidth = (int) (((double) img.getWidth(null)) / rate);
					newHeight = (int) (((double) img.getHeight(null)) / rate);
				} else {
					newWidth = outputWidth; // 输出的图片宽度
					newHeight = outputHeight; // 输出的图片高度
				}
				BufferedImage tag = new BufferedImage((int) newWidth, (int) newHeight, BufferedImage.TYPE_INT_RGB);

				/*
				 * Image.SCALE_SMOOTH 的缩略算法 生成缩略图片的平滑度的 优先级比速度高 生成的图片质量比较好 但速度慢
				 */
				// tag.getGraphics().drawImage(
				// img.getScaledInstance(newWidth, newHeight,
				// Image.SCALE_SMOOTH), 0, 0, null);
				Graphics2D g2d = tag.createGraphics();
				g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 1.0f)); // 透明度设置开始
				g2d.drawImage(img.getScaledInstance(newWidth, newHeight, Image.SCALE_SMOOTH), 0, 0, null);
				g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER)); // 透明度设置
																						// 结束

				File saveDirFile = new File(outputDir);
				if (!saveDirFile.exists()) {
					saveDirFile.mkdirs();
				}

				FileOutputStream out = new FileOutputStream(outputDir + outputFileName);
				// JPEGImageEncoder可适用于其他图片类型的转换
				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
				encoder.encode(tag);
				out.close();

				System.out.println("输出的图片大小：" + getPicSize(outputDir + outputFileName) / 1024 + "KB");
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return "ok";
	}

	public String compressPic(String inputDir, String outputDir, String inputFileName, String outputFileName) {
		// 输入图路径
		this.inputDir = inputDir;
		// 输出图路径
		this.outputDir = outputDir;
		// 输入图文件名
		this.inputFileName = inputFileName;
		// 输出图文件名
		this.outputFileName = outputFileName;
		return compressPic();
	}

	public String compressPic(String inputDir, String outputDir, String inputFileName, String outputFileName, int width, int height, boolean gp) {
		System.out.println(inputDir+"开始压缩到..." + outputDir);
		// 输入图路径
		this.inputDir = inputDir;
		// 输出图路径
		this.outputDir = outputDir;
		// 输入图文件名
		this.inputFileName = inputFileName;
		// 输出图文件名
		this.outputFileName = outputFileName;
		// 设置图片长宽
		setWidthAndHeight(width, height);
		// 是否是等比缩放 标记
		this.proportion = gp;
		return compressPic();
	}

	// main测试
	// compressPic(大图片路径,生成小图片路径,大图片文件名,生成小图片文名,生成小图片宽度,生成小图片高度,是否等比缩放(默认为true))
	public static void main(String[] arg) throws Exception {
//		File root = new File("D:\\upload3");
//		showAllFiles(root);
	}

	private void compressImg(String oldSavePath, String firstCategory, String secondCategory, String newImgName) {
		String fileGeneratePath2 = "upload2";
		String savePath;
		// 房型图片和酒店图片放入指定的目录
		if (StringUtils.isNotEmpty(secondCategory)) {
			savePath = fileGeneratePath2 + "/" + secondCategory + "/";
		} else {// 普通内容管理目录
			savePath = fileGeneratePath2 ;//+ SysConstant.CONNECT_MANAGE_PATH + firstCategory + "/";
		}

		// 创建文件夹
		File saveDirFile = new File(savePath);
		if (!saveDirFile.exists()) {
			saveDirFile.mkdirs();
		}

		CompressPicUtil mypic = new CompressPicUtil();
		String inPicPath = oldSavePath + newImgName;
		System.out.println("输入的图片大小：" + mypic.getPicSize(inPicPath) / 1024 + "KB");
		int width = mypic.getPicWidth(inPicPath);
		int height = mypic.getPicHeight(inPicPath);
		mypic.compressPic(oldSavePath, savePath, newImgName, newImgName, width, height, true);
	}

	private void test() {
		CompressPicUtil mypic = new CompressPicUtil();
		String inPicPath = "D:\\temp\\1.jpg";
		System.out.println("输入的图片大小：" + mypic.getPicSize(inPicPath) / 1024 + "KB");
		int width = mypic.getPicWidth(inPicPath);
		int height = mypic.getPicHeight(inPicPath);
		for (int i = 0; i < 1; i++) {
			mypic.compressPic("C:\\Users\\Public\\Pictures\\Sample Pictures\\", "C:\\Users\\Public\\Pictures\\Sample Pictures\\test\\", "1.jpg", "r1" + i + ".jpg", width, height, true);
			System.out.println("输出的图片大小：" + mypic.getPicSize("C:\\Users\\Public\\Pictures\\Sample Pictures\\test\\r1" + i + ".jpg") / 1024 + "KB");
		}
	}

	public boolean copy(String start, String savePath, String fileName) {
		System.out.println("开始拷贝到..." + savePath + fileName);
		try {
			// 要拷贝的图片
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(new File(start)));
			File saveDirFile = new File(savePath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
			// 目标的地址
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(savePath + fileName)));
			try {
				int val = -1;
				while ((val = bis.read()) != -1) {

					bos.write(val);
				}
				bos.flush();
				bos.close();
				bis.close();
				return true;
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	private static void showAllFiles(File dir) throws Exception {
		File[] fs = dir.listFiles();
		for (int i = 0; i < fs.length; i++) {
			String inPicPath = fs[i].getAbsolutePath();
			if (inPicPath.contains(".png") || inPicPath.contains(".jpg")) {
				String parentPath = fs[i].getParentFile().getPath();
				String fileName = fs[i].getName();
				System.out.println(fs[i].getAbsolutePath());
				// 开始压缩图片
				CompressPicUtil mypic = new CompressPicUtil();
				System.out.println("输入的图片大小：" + mypic.getPicSize(inPicPath) / 1024 + "KB");
				int width = mypic.getPicWidth(inPicPath);
				int height = mypic.getPicHeight(inPicPath);
				System.out.println("width=" + width + ",height=" + height);
				if (width > 1000) {
					height = (1000 * height / width);
					width = 1000;
				}
				System.out.println("width2=" + width + ",height2=" + height);

				try {
					String ouputDir = parentPath.replace("upload", "upload2") + "\\";
					mypic.compressPic(parentPath + "\\", ouputDir, fileName, fileName, width, height, false);
				} catch (Exception e) {
				}
			}
			if (fs[i].isDirectory()) {
				try {
					showAllFiles(fs[i]);
				} catch (Exception e) {
				}
			}
		}
	}
}

