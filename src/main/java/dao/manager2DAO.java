package dao;

import java.util.List;

import dto.BuyListDTO;
import dto.NoticeDTO;
import dto.PageDTO;
import dto.QnaDTO;
import dto.RefundDTO;

public interface manager2DAO {
	public int count(PageDTO pv);//���Ƹ�
	public List<QnaDTO> list(PageDTO pv);//DTO ���� ����.
	public void readCount(int q_num);// ��ȸ
	public QnaDTO content(int q_num);// ������ ��ȣ
	public void reStepCount(QnaDTO dto);// 
	public void save(QnaDTO dto);// ����
	public QnaDTO updateNum(int q_num);// ������Ʈ ��ȣ
	public void update( QnaDTO dto);// ������Ʈ 
	public void delete(QnaDTO dto);// ���� 
	public String getFile(int q_num);// ���� ��ȣ 
	
//���⼭���� ��������. 
	public int count2(PageDTO pv);
	public List<NoticeDTO> list2(PageDTO pv);
	public void readCount2(int n_num);
	public NoticeDTO content2(int n_num);// ������ ��ȣ 
	public void save2(NoticeDTO dto);// ����
	public NoticeDTO updateNum2(int n_num);// ������Ʈ ��ȣ
	public void update2( NoticeDTO dto);// ������Ʈ 
	public void delete2(int n_num);// ���� 
	public String getFile2(int n_num);// ���� ��ȣ
	
	//////////////////////////////////
	
}
