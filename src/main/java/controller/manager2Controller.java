package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.BuyListDTO;
import dto.NoticeDTO;
import dto.PageDTO;
import dto.QnaDTO;
import dto.RefundDTO;
import service.manager2Service;

@Controller
public class manager2Controller {
	private manager2Service man2Service;
	private int currentPage;
	private PageDTO pdto;
	
	public manager2Controller() {
	// TODO Auto-generated constructor stub
	}
	
	public void setMan2Service(manager2Service man2Service) {
		this.man2Service = man2Service;
	}
	
//[1]공지사항
	@RequestMapping(value="/noticeGo.do")
	public ModelAndView  listMethod2(ModelAndView mav, PageDTO pv, HttpServletRequest request) {
		
		
		int totalRecord=man2Service.countProcess2(pv);
		if(totalRecord>=1) {
			if(pv.getCurrentPage()==0) {
				currentPage=1;
			}else {
				currentPage=pv.getCurrentPage();
			}
			pdto=new PageDTO(currentPage, totalRecord,pv.getSearchKey(),pv.getSearchWord());
			mav.addObject("aList",man2Service.listProcess2(pdto));// ����¡ ó��. 1~10 , 11~20 ó���Ҳ���
			mav.addObject("pv",pdto);
		}
		
		if((String)request.getSession().getAttribute("admin_name")==null || (String)request.getSession().getAttribute("admin_name")=="") {
			mav.setViewName("notice");
		}else {
			mav.setViewName("admin_notice");
		}
		 
		return mav;
	}
	
	@RequestMapping(value="/write2.do",method=RequestMethod.GET)
	public ModelAndView writeMethod2(ModelAndView mav, @ModelAttribute("dto") NoticeDTO dto,@ModelAttribute("pv") PageDTO pv) {
		mav.setViewName("write2");
		return mav;
	}////
	
	@RequestMapping(value="/write2.do",method=RequestMethod.POST)
	public String writeProMethod2(NoticeDTO dto, HttpServletRequest request) {
		MultipartFile file=dto.getFilename();
		if(!file.isEmpty()) {
			UUID random=saveCopyFile2(file,request);//UUID�� ���� ���� �ĺ���(universally unique identifier)�ν�,
			dto.setN_file(random+"_"+file.getOriginalFilename());
		}//end if
		
		//dto.setIp(request.getRemoteAddr());
		//�亯���̸� !
		man2Service.insertProcess2(dto);
		
		return "redirect:/noticeGo.do";
	}/////
	
	@RequestMapping("/view2.do")
	public ModelAndView viewMethod2(PageDTO pv,int n_num, ModelAndView mav, HttpServletRequest request) {
		mav.addObject("dto",man2Service.contentProcess2(n_num));
		mav.addObject("currentPage",currentPage);
		mav.addObject("searchKey",pv.getSearchKey());
		mav.addObject("searchWord",pv.getSearchWord());
		
		if((String)request.getSession().getAttribute("admin_name")==null || (String)request.getSession().getAttribute("admin_name")=="") {
			mav.setViewName("notice_user_view");
		}else {
			mav.setViewName("view2");
		}
		
		return mav;
	}//
	
	@RequestMapping("/delete2.do")//1/16
	public ModelAndView deleteMethod2(int n_num,HttpServletRequest request,ModelAndView mav,@ModelAttribute("pv") PageDTO pv) {
		
					String n_file=man2Service.fileSelectProcess2(n_num);
					if(n_file!=null) {
						String root=request.getSession().getServletContext().getRealPath("/");
						String saveDirectory=root+"temp"+File.separator;
						
						File fe=new File(saveDirectory,n_file);
						fe.delete();
					}
			//1.16		
			man2Service.deleteProcess2(n_num);
			PageDTO pdto=new PageDTO(pv.getCurrentPage(),man2Service.countProcess2(pv),pv.getSearchKey(),pv.getSearchWord());//���� �𸣰����� ���۾� �ʿ� ����¡������Ʈ		
			if(pdto.getTotalPage()<pv.getCurrentPage()) {
				mav.addObject("currentPage",pdto.getTotalPage());
				
			}else {
				mav.addObject("currentPage",pv.getCurrentPage());
			}
				mav.addObject("searchKey",pv.getSearchKey());
				mav.addObject("searchWord",pv.getSearchWord());
				
				mav.addObject("currentPage",currentPage);// ���� �������� �ѱ� 
				mav.setViewName("redirect:/noticeGo.do");
			
				return mav;
	}
	
	@RequestMapping(value="/update2.do",method=RequestMethod.GET)
	public ModelAndView updateMethod2(int n_num,@ModelAttribute("pv")PageDTO pv,ModelAndView mav) {	
	mav.addObject("dto",man2Service.updateSelectProcess2(n_num));
		mav.addObject("currentPage",currentPage);
		//�ۼ��մϴ�.
		mav.addObject("searchKey", pv.getSearchKey());
		mav.addObject("searchWord",pv.getSearchWord());
		
		//�ۼ���
		
		mav.setViewName("update2");
		return mav;
	}
	
	@RequestMapping(value="/update2.do",method=RequestMethod.POST)
	public ModelAndView updateProMethod2(NoticeDTO dto, @ModelAttribute("pv") PageDTO pv,ModelAndView mav, HttpServletRequest request) {
		//����÷������
		String filename=man2Service.fileSelectProcess2(dto.getN_num());
		String root=request.getSession().getServletContext().getRealPath("/");
		String saveDirectory=root+"temp"+File.separator;
		
		//������ ÷������1.15
		MultipartFile file=dto.getFilename();
		
		//������ ÷�������� ������...
		if(!file.isEmpty()) {
			
			
			if(filename!=null) {//���� ÷�������� ������...
				//����÷�����ϻ���
				File fe=new File(saveDirectory, filename); 
					fe.delete();
				
			}
		//1.15	
			UUID random=saveCopyFile2(file,request);
			dto.setN_file(random+"_"+file.getOriginalFilename());
		}else {//������ ÷�� ������ ������ 
			if(filename!=null) {//���� ÷�������� ������
				dto.setN_file(filename);
			}
		}
		
		//dto.setIp(request.getRemoteAddr());
		man2Service.updateProcess2(dto);
		mav.addObject("currentPage",currentPage);
		mav.addObject("searchKey",pv.getSearchKey());
		mav.addObject("searchWord",pv.getSearchWord());
		mav.setViewName("redirect:/noticeGo.do");
		return mav;
		
	}
	
	@RequestMapping("/contentdownload2.do")
	public ModelAndView downMethod2(int n_num, ModelAndView mav) {
			
		mav.addObject("n_num",n_num);
		mav.setViewName("download2");
		
		return mav;
	}
	
	public UUID saveCopyFile2(MultipartFile file,HttpServletRequest request) {
		String fileName=file.getOriginalFilename();
		//�ߺ����ϸ��� ó���ϱ� ���� ���� �߻�
		UUID random=UUID.randomUUID();
		
		String root=request.getSession().getServletContext().getRealPath("/");
		String saveDirectory=root+"temp"+File.separator;
		
		File fe=new File(saveDirectory);
				if(!fe.exists()) {
					fe.mkdir();
				}
		File ff=new File(saveDirectory,random+"_"+ fileName);
		try {
			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));//���Ͽ� ���õ� ������ ������.
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		return random;//i got 
		}/////////�ǰ� �볪�� ~~~~~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!`
	
//[2]QNA게시판
	@RequestMapping("/qnaGo.do")
	public ModelAndView listMethod(ModelAndView mav, PageDTO pv,HttpServletRequest request) {
		
		
			int totalRecord=man2Service.countProcess(pv);
			if(totalRecord>=1) {
				if(pv.getCurrentPage()==0) {
					currentPage=1;
				}else {
					currentPage=pv.getCurrentPage();
				}
				pdto=new PageDTO(currentPage, totalRecord,pv.getSearchKey(),pv.getSearchWord());
				mav.addObject("aList",man2Service.listProcess(pdto));// ����¡ ó��. 1~10 , 11~20 ó���Ҳ���
				mav.addObject("pv",pdto);
			}
		
			if((String)request.getSession().getAttribute("admin_name")==null || (String)request.getSession().getAttribute("admin_name")=="") {
				mav.setViewName("qna");
			}else {
				mav.setViewName("admin_qna");
			}
			return mav;
			
	}////////////////////
	
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public ModelAndView writeMethod(ModelAndView mav, @ModelAttribute("dto") QnaDTO dto,@ModelAttribute("pv") PageDTO pv,HttpServletRequest request) {
		if((String)request.getSession().getAttribute("admin_name")==null || (String)request.getSession().getAttribute("admin_name")=="") {
			mav.setViewName("write");
		}else {
			mav.setViewName("admin_qna_write");
		}
		return mav;
	}////
	
	@RequestMapping(value="/write.do",method=RequestMethod.POST)
	public String writeProMethod(QnaDTO dto, HttpServletRequest request) {
		MultipartFile file=dto.getFilename();
		if(!file.isEmpty()) {
			UUID random=saveCopyFile(file,request);//UUID�� ���� ���� �ĺ���(universally unique identifier)�ν�,
			dto.setQ_image(random+"_"+file.getOriginalFilename());
		}//end if
		
		//dto.setIp(request.getRemoteAddr());
		//�亯���̸� !
		if(dto.getQ_ref()!=0) {
				man2Service.reStepProcess(dto);
		}else {//������̸�
		man2Service.insertProcess(dto);
		}
		
		String viewName="";
		viewName = "redirect:/qnaGo.do";
		
		return viewName;
	}/////
	
	@RequestMapping("/view.do")
	public ModelAndView viewMethod(PageDTO pv,int q_num, ModelAndView mav,HttpServletRequest request) {
		mav.addObject("dto",man2Service.contentProcess(q_num));
		mav.addObject("currentPage",currentPage);
		mav.addObject("searchKey",pv.getSearchKey());
		mav.addObject("searchWord",pv.getSearchWord());
		
		if((String)request.getSession().getAttribute("admin_name")==null || (String)request.getSession().getAttribute("admin_name")=="") {
			mav.setViewName("view");
		}else {
			mav.setViewName("admin_qna_view");
		}
		return mav;
	}//
	
	@RequestMapping("/delete.do")//1/16
	public ModelAndView deleteMethod(QnaDTO dto,HttpServletRequest request,ModelAndView mav,@ModelAttribute("pv") PageDTO pv) {
		
					String q_image=man2Service.fileSelectProcess(dto.getQ_num());
					if(q_image!=null) {
						String root=request.getSession().getServletContext().getRealPath("/");
						String saveDirectory=root+"temp"+File.separator;
						
						File fe=new File(saveDirectory,q_image);
						fe.delete();
					}
			//1.16		
			man2Service.deleteProcess(dto);
			PageDTO pdto=new PageDTO(pv.getCurrentPage(),man2Service.countProcess(pv),pv.getSearchKey(),pv.getSearchWord());//���� �𸣰����� ���۾� �ʿ� ����¡������Ʈ		
			if(pdto.getTotalPage()<pv.getCurrentPage()) {
				mav.addObject("currentPage",pdto.getTotalPage());
				
			}else {
				mav.addObject("currentPage",pv.getCurrentPage());
			}
				mav.addObject("searchKey",pv.getSearchKey());
				mav.addObject("searchWord",pv.getSearchWord());
				
				mav.addObject("currentPage",currentPage);// ���� �������� �ѱ� 
				mav.setViewName("redirect:/qnaGo.do");
				
				return mav;
	}
	
	@RequestMapping(value="/update.do",method=RequestMethod.GET)
	// ������public ModelAndView updateMethod(int q_num,int currentPage,ModelAndView mav) {
	public ModelAndView updateMethod(int q_num,@ModelAttribute("pv")PageDTO pv,ModelAndView mav,HttpServletRequest request) {	
	mav.addObject("dto",man2Service.updateSelectProcess(q_num));
		mav.addObject("currentPage",currentPage);
		//�ۼ��մϴ�.
		mav.addObject("searchKey", pv.getSearchKey());
		mav.addObject("searchWord",pv.getSearchWord());
		
		//�ۼ���
		
		if((String)request.getSession().getAttribute("admin_name")==null || (String)request.getSession().getAttribute("admin_name")=="") {
			mav.setViewName("update");
		}else {
			mav.setViewName("admin_qna_update");
		}
		return mav;
	}
	
	@RequestMapping(value="/update.do",method=RequestMethod.POST)
	public ModelAndView updateProMethod(QnaDTO dto, @ModelAttribute("pv") PageDTO pv,ModelAndView mav, HttpServletRequest request) {
		//����÷������
		String filename=man2Service.fileSelectProcess(dto.getQ_num());
		String root=request.getSession().getServletContext().getRealPath("/");
		String saveDirectory=root+"temp"+File.separator;
		
		//������ ÷������1.15
		MultipartFile file=dto.getFilename();
		
		//������ ÷�������� ������...
		if(!file.isEmpty()) {
			
			
			if(filename!=null) {//���� ÷�������� ������...
				//����÷�����ϻ���
				File fe=new File(saveDirectory, filename); 
					fe.delete();
				
			}
		//1.15	
			UUID random=saveCopyFile(file,request);
			dto.setQ_image(random+"_"+file.getOriginalFilename());
		}else {//������ ÷�� ������ ������ 
			if(filename!=null) {//���� ÷�������� ������
				dto.setQ_image(filename);
			}
		}
		
		//dto.setIp(request.getRemoteAddr());
		man2Service.updateProcess(dto);
		mav.addObject("currentPage",currentPage);
		mav.addObject("searchKey",pv.getSearchKey());
		mav.addObject("searchWord",pv.getSearchWord());
		
		mav.setViewName("redirect:/qnaGo.do");
		
		return mav;
		
	}//////�ʻ�˹� ~!~!~!~!~!~!~
	
	@RequestMapping("/contentdownload.do")
	public ModelAndView downMethod(int  q_num, ModelAndView mav) {
			
		mav.addObject("q_num",q_num);
		mav.setViewName("download");
		
		return mav;
	}

	public UUID saveCopyFile(MultipartFile file,HttpServletRequest request) {
		String fileName=file.getOriginalFilename();
		//�ߺ����ϸ��� ó���ϱ� ���� ���� �߻�
		UUID random=UUID.randomUUID();
		
		String root=request.getSession().getServletContext().getRealPath("/");
		String saveDirectory=root+"temp"+File.separator;
		
		File fe=new File(saveDirectory);
		if(!fe.exists()) {fe.mkdir();}
		File ff=new File(saveDirectory,random+"_"+ fileName);
		try {
			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));//���Ͽ� ���õ� ������ ������.
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("파일업로드실패");
		}
		return random;//i got 
	}/////////�ǰ� �볪�� ~~~~~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!`
	
	
	
	//판매자 로그인시 환불리스트 보여주기
	

}
