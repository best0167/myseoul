package service;

import java.util.List;

import dao.manager2DAO;
import dto.BuyListDTO;
import dto.NoticeDTO;
import dto.PageDTO;
import dto.QnaDTO;
import dto.RefundDTO;

public class manager2ServiceImp implements manager2Service{
	private manager2DAO man2Dao;
	
	public manager2ServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setMan2Dao(manager2DAO man2Dao) {
		this.man2Dao = man2Dao;
	}
	
//공지사항	
	@Override
	public int countProcess2(PageDTO pv) {
		// TODO Auto-generated method stub
		return man2Dao.count2(pv);
	}


	@Override
	public List<NoticeDTO> listProcess2(PageDTO pv) {
		// TODO Auto-generated method stub
		return man2Dao.list2(pv);
	}


	@Override
	public void insertProcess2(NoticeDTO dto) {
		// TODO Auto-generated method stub
		man2Dao.save2(dto);
	}


	@Override
	public NoticeDTO contentProcess2(int n_num) {
		// TODO Auto-generated method stub
		man2Dao.readCount2(n_num);
		return man2Dao.content2(n_num);
	}


	@Override
	public NoticeDTO updateSelectProcess2(int n_num) {
		return man2Dao.updateNum2(n_num);
	}


	@Override
	public void updateProcess2(NoticeDTO dto) {
		// TODO Auto-generated method stub
		man2Dao.update2(dto);
	}


	@Override
	public void deleteProcess2(int n_num) {
		// TODO Auto-generated method stub
		man2Dao.delete2(n_num);
	}


	@Override
	public String fileSelectProcess2(int n_num) {
		// TODO Auto-generated method stub
		return man2Dao.getFile2(n_num);
	}
//////////////////////////////////////////////////////
	
	
//QNA게시판
	@Override
	public int countProcess(PageDTO pv) {
		return man2Dao.count(pv);
	}

	// list
	@Override
	public List<QnaDTO> listProcess(PageDTO pv) {
		// TODO Auto-generated method stub
		return man2Dao.list(pv);
	}//�� ��� ó�� 

	@Override
	public void insertProcess(QnaDTO dto) {
		
		man2Dao.save(dto);
		
	}

	@Override
	public QnaDTO contentProcess(int q_num) {
		// TODO Auto-generated method stub
		man2Dao.readCount(q_num);
		return man2Dao.content(q_num);
	}

	@Override
	public void reStepProcess(QnaDTO dto) {
		
		man2Dao.reStepCount(dto);
		dto.setQ_restep(dto.getQ_restep()+1);// �亯�� ������Ʈ 
		dto.setQ_relevel(dto.getQ_relevel()+1);//�亯�� �鿩����
		man2Dao.save(dto);
	}

	@Override
	public QnaDTO updateSelectProcess(int q_num) {
		// TODO Auto-generated method stub
	
			return man2Dao.updateNum(q_num);
	}

	@Override
	public void updateProcess(QnaDTO dto) {
		// TODO Auto-generated method stub
			man2Dao.update(dto);
	}

	@Override
	public void deleteProcess(QnaDTO dto) {
		// TODO Auto-generated method stub
		man2Dao.delete(dto);
	}

	@Override
	public String fileSelectProcess(int q_num) {
		// TODO Auto-generated method stub
		return man2Dao.getFile(q_num);
	}
/////////////////////////////////////////////////////
	
	
}
