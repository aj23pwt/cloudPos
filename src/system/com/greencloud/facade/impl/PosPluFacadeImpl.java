package com.greencloud.facade.impl;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;

import net.coobird.thumbnailator.Thumbnails;

import com.greencloud.dto.POSInterfaceScanDto;
import com.greencloud.dto.PosBillDto;
import com.greencloud.entity.PosHotelTransfer;
import com.greencloud.entity.PosMaster;
import com.greencloud.entity.PosOrder;
import com.greencloud.entity.PosPluAll;
import com.greencloud.entity.PosSortAll;
import com.greencloud.facade.IPosPluFacade;
import com.greencloud.service.IPosOrderService;
import com.greencloud.service.IPosPluAllService;
import com.greencloud.util.UserManager;
import com.greencloud.utils.PropertiesUtil4Sync;
import com.greencloud.utils.ZipUtils;

public class PosPluFacadeImpl implements IPosPluFacade {

	private IPosPluAllService posPluAllService;
	private IPosOrderService posOrderService;
	public void setPosOrderService(IPosOrderService posOrderService) {
		this.posOrderService = posOrderService;
	}

	public void setPosPluAllService(IPosPluAllService posPluAllService) {
		this.posPluAllService = posPluAllService;
	}

	@Override
	public String getTpPluAllTreeDto() {
		return posPluAllService.getTpPluAllTreeDto(
				UserManager.getHotelGroupId(), UserManager.getHotelId());
	}

	@Override
	public void updateParamGroup(Object object) {
		posPluAllService.updateParamGroup(object,
				UserManager.getHotelGroupId(), UserManager.getHotelId());
	}

	@Override
	public List<PosOrder> savePosOrder(PosMaster posMaster, String tableNo,
			PosPluAll posPluAll) {
		return posOrderService.savePosOrder(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), posMaster, tableNo, posPluAll);
	}
	
	@Override
	public List<PosOrder> savePosOrderNew(PosMaster posMaster, String tableNo,
			PosPluAll posPluAll,String dishNum) {
		
		return posOrderService.savePosOrderNew(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), posMaster, tableNo, posPluAll,new BigDecimal(dishNum));
	}

	@Override
	public void deletePosOrder(PosMaster posMaster, String tableNo) {
		posOrderService.deletePosOrder(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), posMaster, tableNo);
	}

	@Override
	public void updateOrderToDetail(PosMaster posMaster, String tableNo,String info) {
		String newIds=posOrderService.updateOrderToDetail(UserManager.getHotelGroupId(),UserManager.getHotelId(), posMaster, tableNo,info);
		
		if(newIds != null  && !newIds.equals("")){
			String [] arr= newIds.split(",");
			if(arr != null && newIds.length()>0){
				for(int i=0;i<arr.length;i++){
					String did=arr[i];
					posOrderService.updateKitchenInputDishcard(UserManager.getHotelGroupId().toString(), UserManager.getHotelId().toString(),posMaster.getAccnt().toString(), did, "1", UserManager.getWorkStationId().toString());
				}
			}
		}
	}	
	
	@Override
	public void updateKitchenInputDishcard(String accnt,String id,String type){
		posOrderService.updateKitchenInputDishcard(UserManager.getHotelGroupId().toString(), UserManager.getHotelId().toString(), accnt, id, type, UserManager.getWorkStationId().toString());
	}
	
	@Override
	public void updateDealNum(PosMaster posMaster, String tableNo, String type,
			long id, String dealType) {
		posOrderService.updateDealNum(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), posMaster, tableNo, type, id,
				dealType);
	}

	@Override
	public String updateCanclePlu(PosMaster posMaster, String tableNo,String type, long id, String info, BigDecimal number) {
		String ids=posOrderService.updateCanclePlu(UserManager.getHotelGroupId(),UserManager.getHotelId(), posMaster, tableNo, type, id, info,number);
		 
		if(type.equals("0")){
			if(ids != null  && !ids.equals("")){
				String [] arr= ids.split(",");
				if(arr != null && ids.length()>0){
					for(int i=0;i<arr.length;i++){
						String did=arr[i];
						posOrderService.updateKitchenInputDishcard(UserManager.getHotelGroupId().toString(), UserManager.getHotelId().toString(),posMaster.getAccnt().toString(), did, "1", UserManager.getWorkStationId().toString());
					}
				}
			}
		}
		
		return "";
	}

	@Override
	public void updateCahngeNum(PosMaster posMaster, String tableNo,
			String type, long id, String num) {
		posOrderService.updateCahngeNum(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), posMaster, tableNo, type, id, num);
	}

	@Override
	public void updateCahngePrice(PosMaster posMaster, String tableNo,
			String type, long id, String price) {
		posOrderService.updateCahngePrice(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), posMaster, tableNo, type, id, price);
	}

	@Override
	public void updateCahngeDescript(PosMaster posMaster, String tableNo,
			String type, long id, String descript) {
		posOrderService.updateCahngeDescript(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), posMaster, tableNo, type, id,
				descript);
	}

	@Override
	public void updateCahngeDescriptOr(PosMaster posMaster, String tableNo,String type, long id, String descript, String num, String price,String unit) {
		posOrderService.updateCahngeDescriptOr(UserManager.getHotelGroupId(),UserManager.getHotelId(), posMaster, tableNo, type, id,descript, num, price,unit);
	}
	
	@Override
	public void updateFreePlu(PosMaster posMaster, String tableNo, String type,
			long id, String info) {
		posOrderService.updateFreePlu(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), posMaster, tableNo, type, id, info);
	}

	@Override
	public void updateCancleFreePlu(PosMaster posMaster, String tableNo,
			String type, long id, String info) {
		posOrderService.updateCancleFreePlu(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), posMaster, tableNo, type, id, info);
	}

	@Override
	public void updateDecPlu(PosMaster posMaster, String tableNo, String type,
			long id, String reason, String amount5, String dsc) {
		posOrderService.updateDecPlu(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), posMaster, tableNo, type, id, reason,
				amount5, dsc);
	}

	@Override
	public void updatePluCook(PosMaster posMaster, String tableNo, String type,
			long id, String codes, String cook, String remark) {
		posOrderService.updatePluCook(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), posMaster, tableNo, type, id, codes,
				cook, remark);
	}

	@Override
	public String updateCheckOut(String coi, PosMaster posMaster,
			String tableNo, String accnts, String taCode, BigDecimal pay,
			String reason, String reasonDesc,String cardno, String remark,String balance) {
		return posOrderService.updateCheckOut(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), coi, posMaster, tableNo, accnts,
				taCode, pay, reason,reasonDesc, cardno, remark,balance);
	}

	@Override
	public List<PosOrder> saveCachePosOrder(String accnt, String tableNo,
			List<PosOrder> list) {
		return posOrderService.saveCachePosOrder(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), accnt, tableNo, list);
	}

	@Override
	public void updateCancleAccount(String id) {
		posOrderService.updateCancleAccount(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), id);
	}

	@Override
	public String getTpPluAllTreeDto(String pccode) {
		// TODO Auto-generated method stub
		return posPluAllService
				.getTpPluAllTreeDto(UserManager.getHotelGroupId(),
						UserManager.getHotelId(), pccode);
	}

	@Override
	public List<Object> getStdList(String accnt, String tableNo, String type,
			long id) {
		return posOrderService.getStdList(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), accnt, tableNo, type, id);
	}

	@Override
	public void updateIn(String accnt, String tableNo, String type, String ids,
			long mainId) {
		posOrderService.updateIn(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), accnt, tableNo, type, ids, mainId);
	}

	@Override
	public void updateOut(String accnt, String tableNo, String type,
			String ids, long mainId) {
		posOrderService.updateOut(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), accnt, tableNo, type, ids, mainId);
	}

	@Override
	public PosBillDto getPosBillDtoByAccnt(String accnt, String tableNo) {
		return posOrderService.getPosBillDtoByAccnt(
				UserManager.getHotelGroupId(), UserManager.getHotelId(), accnt,
				tableNo);
	}

	@Override
	public int getMaxPosPluId(String sortCode) {
		return posPluAllService.getMaxPosPluId(sortCode);
	}

	@Override
	public void updatePluAllPic() {
		posPluAllService.updatePluAllPic(UserManager.getHotelGroupId(),
				UserManager.getHotelId());
	}

	@Override
	public String getPluAllPhotoZip() {
		String flag = "success";
		String url = PropertiesUtil4Sync.getProperty("SycHttpUrl")
				+ "/posFileController/downloadFiles.do";
		url = url+"?hotelGroupId="+PropertiesUtil4Sync.getProperty("hotelGroupId")+"&hotelId="+PropertiesUtil4Sync.getProperty("hotelId");
		@SuppressWarnings("deprecation")
		String filePath = URLDecoder.decode(this.getClass().getResource("/").getPath());
		try {
			// 建立链接
			HttpURLConnection httpUrl = (HttpURLConnection) new URL(url)
					.openConnection();
			// 连接指定的资源
			httpUrl.connect();
			// 获取网络输入流
			BufferedInputStream bufferedInputStream = new BufferedInputStream(
					httpUrl.getInputStream());
			// 建立文件
			//FileOutputStream fileOutputStream = new FileOutputStream("d:/pluPhoto.zip");
			File assets = new File(filePath.substring(0, filePath.indexOf("classes"))+ "assets/");
			if (!assets.exists()) {
				assets.mkdirs();
			}
			String zipPath = filePath.substring(0, filePath.indexOf("classes"))
					+ "assets/assets.zip" ;
			FileOutputStream fileOutputStream = new FileOutputStream(zipPath);
			// 保存文件
			byte[] buf = new byte[1024];
			int size = 0;
			while ((size = bufferedInputStream.read(buf)) != -1) {
				fileOutputStream.write(buf, 0, size);
			}
			fileOutputStream.flush();
			bufferedInputStream.close();
			fileOutputStream.close();
			//解压zip文件 生成缩略图
			File distFile = new File(zipPath);
			Boolean isSuccess = this.unZipFiles(distFile,
					filePath.substring(0, filePath.indexOf("classes"))
							+ "assets/");
			if (!isSuccess) {
				flag = "error";
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			flag = "error";
		}
		return flag;
	}

	/**
	 * 解压文件到指定目录
	 * 
	 * @param zipFile
	 * @param descDir
	 * @author pwt
	 */
	@SuppressWarnings("rawtypes")
	public Boolean unZipFiles(File zipFile, String descDir) {
		Boolean flag = true;
		try {
			File pathFile = new File(descDir);
			if (!pathFile.exists()) {
				pathFile.mkdirs();
			}
			ZipFile zip = new ZipFile(zipFile);
			for (Enumeration entries = zip.entries(); entries.hasMoreElements();) {
				ZipEntry entry = (ZipEntry) entries.nextElement();
				String zipEntryName = entry.getName();
				InputStream in = zip.getInputStream(entry);
				String outPath = (descDir + zipEntryName)
						.replaceAll("\\*", "/");
				;
				// 判断路径是否存在,不存在则创建文件路径
				File file = new File(outPath.substring(0,
						outPath.lastIndexOf('/')));
				if (!file.exists()) {
					file.mkdirs();
				}
				// 判断文件全路径是否为文件夹,如果是上面已经上传,不需要解压
				if (new File(outPath).isDirectory()) {
					continue;
				}
				// 输出文件路径信息
				OutputStream out = new FileOutputStream(outPath);
				byte[] buf1 = new byte[1024];
				int len;
				while ((len = in.read(buf1)) > 0) {
					out.write(buf1, 0, len);
				}
				out.flush();
				in.close();
				out.close();
			}
			//解压完成 生成缩略图 同时生成新的zip包
			readAndCreateFile(descDir);
		} catch (ZipException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			flag = false;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}
	/**
	 * 生成縮略圖和zip包
	 * 
	 * @param zipFile
	 */
	public  void readAndCreateFile(String filepath) {
	        File file = new File(filepath);
	        File middleDir = new File(filepath+"middlePic/");
			if (!middleDir.exists()) {
				middleDir.mkdirs();
			}
	        if (file.isDirectory()) {
	            File[] filelist = file.listFiles();
	            for (int i = 0; i < filelist.length; i++) {
	                String name = filelist[i].getName();
	                if(!filelist[i].isDirectory() && name.indexOf("zip")<0) {
	                	try {
							Thumbnails.of(filelist[i])   
							.scale(0.25f)  
							.toFile(filepath+"middlePic/"+name);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
	                }
	            }
	        }
	    	File oldFile = new File(filepath+"assets.zip");
			oldFile.delete();
	        @SuppressWarnings("deprecation")
			String filePath = URLDecoder.decode(this.getClass().getResource("/").getPath());
	        //ZipUtils.createZip(filePath.substring(0, filePath.indexOf("classes"))+ "assets", filePath.substring(0, filePath.indexOf("classes"))+"assets.zip");
	        ZipUtils.FileTool(filePath.substring(0, filePath.indexOf("classes"))+ "assets", filePath.substring(0, filePath.indexOf("classes"))+"assets.zip");
    }

	@Override
	public String getPosSortAllTreeDto() {
		return posPluAllService.getPosSortAllTreeDto(
				UserManager.getHotelGroupId(), UserManager.getHotelId());
	}

	@Override
	public String getPosPluAllTreeDto() {
		return posPluAllService.getPosPluAllTreeDto(
				UserManager.getHotelGroupId(),UserManager.getHotelId());
	}

	@Override
	public List<PosSortAll> getPosSortAllList() {
		return posPluAllService.getPosSortAllList(UserManager.getHotelGroupId(),UserManager.getHotelId());
	}

	@Override
	public void updatePosPluFlag(String selSort, String strFlag,String num) {
		posPluAllService.updatePosPluFlag(UserManager.getHotelGroupId(),UserManager.getHotelId(),UserManager.getUserCode(),selSort,strFlag,num);
	}

	@Override
	public List<PosPluAll> getPosPluByText(String ctext) {
		return posPluAllService.getPosPluByText(UserManager.getHotelGroupId(),UserManager.getHotelId(),ctext);
	}

	@Override
	public String getFlagByCode(String pcode,String num) {
		return posPluAllService.getFlagByCode(UserManager.getHotelGroupId(),UserManager.getHotelId(),pcode,num);
	}

	@Override
	public void updateZhuanSetail(PosMaster posMaster, String tableNo,String type, long id, String num, String zaccnt, String ztable) {
		posOrderService.updateZhuanSetail(UserManager.getHotelGroupId(),UserManager.getHotelId(),posMaster, tableNo, type, id, num, zaccnt, ztable);
	}

	@Override
	public void savePosOrderCopyPlu(PosMaster posMaster, String accnt,
			String tableno,String type)
	{
		posOrderService.savePosOrderCopyPlu(UserManager.getHotelGroupId(),UserManager.getHotelId(), posMaster, accnt, tableno, type);
		
	}

	@Override
	public String updateCheckOutHotelTransfer(
			PosHotelTransfer hotelTransferData, String coi,
			PosMaster posMaster, String tableNo, String accnts, String taCode,
			BigDecimal pay, String reason, String reasonDesc, String cardno,
			String remark, String balance)
	{
		return posOrderService.updateCheckOutHotelTransfer(hotelTransferData,UserManager.getHotelGroupId(),
				UserManager.getHotelId(), coi, posMaster, tableNo, accnts, taCode, pay, reason, reasonDesc, cardno, remark, balance);
	}

	@Override
	public String updateCheckOutMinRenTicket(String ticketsn,
			String coi, PosMaster posMaster, String tableNo, String accnts,
			String taCode, BigDecimal pay, String reason, String reasonDesc,
			String cardno, String remark, String balance)
	{
		return posOrderService.updateCheckOutMinRenTicket(ticketsn,UserManager.getHotelGroupId(),UserManager.getHotelId(), coi, posMaster, tableNo, accnts, taCode, pay, reason, reasonDesc, cardno, remark, balance);
	}

	@Override
	public void updateScanSat(POSInterfaceScanDto pOSInterfaceScanDto) {
		posOrderService.updateScanSat(UserManager.getHotelGroupId(),UserManager.getHotelId(), pOSInterfaceScanDto);
	}

	@Override
	public void updateRevokePlu(String accnt, long id, String info) {
		long lid = posOrderService.updateRevokePlu(UserManager.getHotelGroupId(), UserManager.getHotelId(), accnt, id, info);
		if(lid > 0){
			posOrderService.updateKitchenInputDishcard(UserManager.getHotelGroupId().toString(), UserManager.getHotelId().toString(), accnt, Long.toString(lid), "1", UserManager.getWorkStationId().toString());
		}		
	}
}
