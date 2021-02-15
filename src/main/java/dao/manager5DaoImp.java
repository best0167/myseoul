package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.HouseDTO;
import dto.HousePicsDTO;
import dto.PageDTO;

public class manager5DaoImp implements manager5DAO{
	private SqlSession sqlSession;
	
	public manager5DaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//집 상세보기
	@Override
	public HouseDTO houseView(int h_num) {
		return sqlSession.selectOne("m5.view",h_num);
	}
	//집 리스트 불러오기
	@Override
	public List<HouseDTO> houseList(PageDTO pv) {
		return sqlSession.selectList("m5.list",pv);
	}
	//집 상세보기에서 사진 가져오기
	@Override
	public List<HousePicsDTO> housePics(int h_num) {
		return sqlSession.selectList("m5.pics",h_num);
	}
	//조회수 증가
	@Override
	public void readCount(int h_num) {
		sqlSession.update("m5.readCount", h_num);
		
	}

	@Override
	public String houseMainPic(int h_num) {
		return sqlSession.selectOne("m5.mainpic", h_num);
	}

	@Override
	public int count(PageDTO pv) {
		return sqlSession.selectOne("m5.count",pv);
	}
	
}
