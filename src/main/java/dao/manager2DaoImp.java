package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.BuyListDTO;
import dto.NoticeDTO;
import dto.PageDTO;
import dto.QnaDTO;
import dto.RefundDTO;

public class manager2DaoImp implements manager2DAO{
	private SqlSession sqlSession;
	
	public manager2DaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public int count(PageDTO pv) {
		
		return sqlSession.selectOne("m2.count",pv);
	}

	@Override
	public List<QnaDTO> list(PageDTO pv) {
		
		return sqlSession.selectList("m2.list",pv);
	}

	@Override
	public void readCount(int q_num) {
		// TODO Auto-generated method stub
		sqlSession.update("m2.readCount",q_num);
	}

	@Override
	public QnaDTO content(int q_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("m2.content",q_num);
	}

	@Override
	public void reStepCount(QnaDTO dto) {
		// 
		sqlSession.update("m2.reStepCount",dto);
	}

	@Override
	public void save(QnaDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("m2.save",dto);
	}

	@Override
	public QnaDTO updateNum(int q_num) {
		// 
		return sqlSession.selectOne("m2.content",q_num);
	}

	@Override
	public void update(QnaDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("m2.update",dto);
	}

	@Override
	public void delete(QnaDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.delete("m2.delete",dto);
	}

	@Override
	public String getFile(int q_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("m2.uploadFile",q_num);
	}

	
////////////////////////////////////////////Q&A end!
	
	
	
	@Override
	public int count2(PageDTO pv) {
		// TODO Auto-generated method stub
		return  sqlSession.selectOne("m2.count2",pv);
	}

	@Override
	public List<NoticeDTO> list2(PageDTO pv) {
		// TODO Auto-generated method stub
		return  sqlSession.selectList("m2.list2",pv);
	}

	@Override
	public void readCount2(int n_num) {
		// TODO Auto-generated method stub
		sqlSession.update("m2.readCount2",n_num);
	}

	@Override
	public NoticeDTO content2(int n_num) {
		// TODO Auto-generated method stub
		return  sqlSession.selectOne("m2.content2",n_num);
	}

	@Override
	public void save2(NoticeDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("m2.save2",dto);
	}

	@Override
	public NoticeDTO updateNum2(int n_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("m2.content2",n_num);
	}

	@Override
	public void update2(NoticeDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("m2.update2",dto);
	}

	@Override
	public void delete2(int n_num) {
		// TODO Auto-generated method stub
		sqlSession.delete("m2.delete2",n_num);
	}

	@Override
	public String getFile2(int n_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("m2.uploadFile2",n_num);
	}
	
	/////////////////////////////
	
}
