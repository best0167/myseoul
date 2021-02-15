package service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	private String PREFIX_URL;
	
	public FileUploadService() {
		// TODO Auto-generated constructor stub
	}
	
	public void setPREFIX_URL(String pREFIX_URL) {
		PREFIX_URL = pREFIX_URL;
	}
	
//[1] 집사진등록	
	public String restore(MultipartFile file,String path,int h_num) {
		setPREFIX_URL(path+"housePictures"+File.separator);
		UUID random = saveCopyFile(file,h_num);
		String dir = File.separator+"housePictures"+File.separator+h_num+File.separator+random+"_"+file.getOriginalFilename();
		return dir;
	}
	
//[2] 방사진등록
	public String restore(MultipartFile file,String path,int h_num,int r_num) {
		setPREFIX_URL(path+"housePictures"+File.separator+h_num+File.separator);
		UUID random = saveCopyFile(file,r_num);
		String dir = File.separator+"housePictures"+File.separator+h_num+File.separator+r_num+File.separator+random+"_"+file.getOriginalFilename();
		return dir;
	}
	
	//[*]첨부파일 난수처리메소드
	public UUID saveCopyFile(MultipartFile file, int num) {
			String fileName=file.getOriginalFilename();
			
			//중복파일명을 처리하기 위해 난수 발생
			UUID random=UUID.randomUUID();
			
			//저장할디렉토리설정
			String saveDirectory = PREFIX_URL+num+File.separator;
			
			File fe = new File(saveDirectory);
			if(!fe.exists()) fe.mkdir();
			////////////////////{1}폴더설정 완료
			
			File ff=new File(saveDirectory,random+"_"+fileName);
			try {
				FileCopyUtils.copy(file.getInputStream(), 
						//                 ↑읽어와서...↓써줘라
						                  new FileOutputStream(ff));
			} catch (IOException e) {
				System.out.println("파일업로드실패!");
				e.printStackTrace();
			}
	       ////////////////////{2}파일 작성(저장)완료
			
			return random;
	}////////////////////////////////////////
}
