package service;

import java.util.List;

import dto.BuyListDTO;
import dto.NoticeDTO;
import dto.PageDTO;
import dto.QnaDTO;
import dto.RefundDTO;

public interface manager2Service {
	//공지사항 게시판
	public int countProcess2(PageDTO pv); 
	public List<NoticeDTO> listProcess2(PageDTO pv);
	public void insertProcess2(NoticeDTO dto);
	public NoticeDTO contentProcess2(int n_num);
	public NoticeDTO updateSelectProcess2(int n_num);
	public void updateProcess2(NoticeDTO dto);
	public void deleteProcess2(int n_num);
	public String fileSelectProcess2(int n_num);
	
	//QNA게시판
	public int countProcess(PageDTO pv); 
	public List<QnaDTO> listProcess(PageDTO pv);
	public void insertProcess(QnaDTO dto);
	public QnaDTO contentProcess(int q_num);
	public void reStepProcess(QnaDTO dto);
	public QnaDTO updateSelectProcess(int q_num);
	public void updateProcess(QnaDTO dto);
	public void deleteProcess(QnaDTO dto);
	public String fileSelectProcess(int q_num);
	

}
