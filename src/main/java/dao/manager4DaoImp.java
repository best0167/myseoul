package dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BagDTO;
import dto.BuyListDTO;
import dto.HouseDTO;
import dto.HousePicsDTO;
import dto.RefundDTO;
import dto.ReviewDTO;
import dto.RoomDTO;
import dto.TimetableDTO;
import dto.UsersDTO;

public class manager4DaoImp implements manager4DAO{
	private SqlSessionTemplate sqlSession;
	
	//생성자
	public manager4DaoImp() {

	}
	
	//setter
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
//	@Override
//	public RoomDTO detailRoomProcess(int r_num) {
//		return sqlSession.selectOne("m4.room", r_num);
//	}
	
//	@Override
//	public String[] checkDayProcess(int r_num) {
//		return null;
//	}
	
	@Override
	public void addHouseCnt(int h_num) {
		sqlSession.update("m4.addHouseCnt",h_num);		
	}
	
	
	//메인페이지에서 집 사진 클릭시 h_num에 해당하는 집의 메인 페이지임.
	@Override
	public HouseDTO houseDetailProcess(int h_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("m4.houseDetail", h_num);
	}
	
	@Override
	public List<RoomDTO> roomListProcess(int h_num) {
		return sqlSession.selectList("m4.roomList", h_num);
	}
	
	//방번호로 방 조회
	@Override
	public RoomDTO roomDetailProcess(int r_num) {
		return sqlSession.selectOne("m4.roomDetail", r_num);
	}
	
	//방번호로 타임테이블의 방 조회
	@Override
	public List<TimetableDTO> timeDetailProcess(int r_num) {
		return sqlSession.selectList("m4.timetable", r_num);
	}
	
	//방번호로 타임테이블의 최대 월 조회
	@Override
	public int maxMonthProcess(int r_num) {
		if(timeDetailProcess(r_num).isEmpty()) {
			return 0;
		} else {
			return sqlSession.selectOne("m4.maxMonth", r_num);
		}
	}
	
	@Override
	public UsersDTO userInfoProcess(String u_id) {
		return sqlSession.selectOne("m4.userInfo", u_id);
	}
	
	@Override
	public HouseDTO selectBagProcess(int b_hnum) {
		return sqlSession.selectOne("m4.bagSelect", b_hnum);
	}
	
	@Override
	public RoomDTO selectBagRnameProcess(int b_rnum) {
		return sqlSession.selectOne("m4.bagRnameSelect", b_rnum);
	}
	
	@Override
	public void bagInsertProcess(BagDTO bag) {
		sqlSession.insert("m4.insertBag", bag);
	}
	
	@Override
	public List<BagDTO> selectBagListProcess(String b_uid) {
		return sqlSession.selectList("m4.bagList", b_uid);
	}

	//test
	@Override
	public String selectBhnameProcess(int b_hnum) {
		return sqlSession.selectOne("m4.selBhname", b_hnum);
	}
//test
	
	//장바구니 삭제
	@Override
	public void bagListDeleteProcess(int b_num) {
		sqlSession.delete("m4.deleteBag", b_num);
	}

	// 장바구니 번호로 장바구니 조회
	@Override
	public BagDTO selectBagInfoProcess(int b_num) {
		return sqlSession.selectOne("m4.selectBagInfo", b_num);
	}

	//////////////////////////////////////////////// 0310
	// 세션아이디, 방번호, 시작일로 bag 테이블에 저장되어 있는지 조회
	@Override
	public BagDTO bagInfoCheckProcess(BagDTO bag) {
		return sqlSession.selectOne("m4.checkBag", bag);
	}

	////////////// 0311
	// buyList에 insert 하기
	@Override
	public void insertBuyListProcess(BuyListDTO buy) {
		sqlSession.insert("m4.insertBuyList", buy);
	}
	// id, rnum, startdate buylist에서 조회
	@Override
	public BuyListDTO buyListDetailProcess(BuyListDTO buy) {
		return sqlSession.selectOne("m4.selectBuyList", buy);
	}
	// b_uid, b_rnum, b_startdate로 bag 테이블 조회해서 있으면 지우는 트랜잭션
	@Override
	public void checkBagDeleteProcess(BagDTO bag) {
		sqlSession.delete("m4.deleteCheckBag", bag);
	}
	// id로 users 테이블의 u_point update
	@Override
	public void usersPointUpdateProcess(UsersDTO user) {
		sqlSession.update("m4.pointUpdate", user);
	}
	// timetable로 insert
	@Override
	public void timeTableInsertProcess(TimetableDTO timetable) {
		sqlSession.insert("m4.timeInsert", timetable);
	}

	///////////// 0312
	// by_uid로 buylist 조회하기
	@Override
	public List<BuyListDTO> selectBuyListProcess(String by_uid) {
		return sqlSession.selectList("m4.BuyList", by_uid);
	}
	
	//집 상세보기에서 사진 가져오기
	@Override
	public List<HousePicsDTO> housePics(int h_num) {
		return sqlSession.selectList("m5.pics",h_num);
	}

	//방사진이 몇개니?
	@Override
	public int cntRoomPic(int hp_rnum) {
		return sqlSession.selectOne("m4.cntRoomPic",hp_rnum);
	}
	
	//방사진dir 콜
	@Override
	public String callRoomDir(int rnum, int call) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rnum", rnum);
		map.put("call", call);
		return sqlSession.selectOne("m4.callRoomDir",map);
	}
	//room테이블의 r_tstate를 y로 update
	@Override
	public void tstateYesUpdateProcess(int r_num) {
		sqlSession.update("m4.updateYesTstate", r_num);
	}
	//room테이블의 r_tstate를 n로 update
	@Override
	public void tstateNoUpdateProcess(int r_num) {
		sqlSession.update("m4.updateNoTstate", r_num);
	}
	//모든 방들의 r_tstate를 y로 update
	@Override
	public void tstateAllUpdateProcess() {
		sqlSession.update("m4.updateAllTstate");
	}
	
	/////////////0316
	@Override
	public BuyListDTO selectBuyNumProcess(int by_num) {
		return sqlSession.selectOne("m4.num_buylist", by_num);
	}
	//결제한 방번호로 방이름 조회
	@Override
	public String selectRnameProcess(int by_rnum) {
		return sqlSession.selectOne("m4.selectRname", by_rnum);
	}
	//리뷰테이블 insert
	@Override
	public void reviewInsertProcess(ReviewDTO review) {
		sqlSession.insert("m4.insertReview", review);
	}
	//hnum으로 리뷰테이블 조회
	@Override
	public List<ReviewDTO> selectReviewProcess(int h_num) {
		return sqlSession.selectList("m4.select_hnum_review", h_num);
	}
	//별점 별 개수
	@Override
	public int selectStarCntProcess(HouseDTO house) {
		return sqlSession.selectOne("m4.star_count", house);
	}
	
	//리뷰 중복검사
	@Override
	public int checkReviewProcess(ReviewDTO review) {
		return sqlSession.selectOne("m4.checkReview", review);
	}
	//리뷰 작성 후 포인트 업데이트
	@Override
	public void reviewPointUpdateProcess(UsersDTO users) {
		sqlSession.update("m4.rv_pointUpdate", users);
	}
	//refundDTO로 refund 테이블 insert
	@Override
	public void refundInsertProcess(RefundDTO refund) {
		sqlSession.insert("m4.insertRefund", refund);
	}
	//판매자 아이디로 환불테이블 조회
	@Override
	public List<RefundDTO> selectRefundProcess(String rf_pid) {
		return sqlSession.selectList("m4.selectRefundList", rf_pid);
	}
	
	//refund의 rf_bynum으로 buylist의 by_refund 'i' 로 업데이트
	@Override
	public void byrefund1UpdateProcess(int rf_bynum) {
		sqlSession.update("m4.updateByRefund1", rf_bynum);
	}
	//refund의 rf_prog 'y' 로 업데이트
	@Override
	public void rfProg1UpdateProcess(int rf_num) {
		sqlSession.update("m4.updateRfProg1", rf_num);
	}
	//refund의 rf_bynum으로 buylist의 by_refund 'y' 로 업데이트
	@Override
	public void byrefund2UpdateProcess(int rf_bynum) {
		sqlSession.update("m4.updateByRefund2", rf_bynum);
	}
	//rf_num으로 refund 테이블 조회
	@Override
	public RefundDTO selectRefundNumProcess(int rf_num) {
		return sqlSession.selectOne("m4.selectRefund", rf_num);
	}
	//r_num으로 timetable 삭제
	@Override
	public void timetableDeleteProcess(int r_num) {
		sqlSession.delete("m4.deleteTimetable", r_num);
	}
	//u_id로 u_point 조회
	@Override
	public int selectUPointProcess(String u_id) {
		return sqlSession.selectOne("m4.selectUPoint", u_id);
	}
	//rf_point 환원
	@Override
	public void rfPointUpdataeProcess(UsersDTO users) {
		sqlSession.update("m4.rfPointUpdate", users);
	}
	//rf_cdate 가져오기
	@Override
	public Date selectRfCdateProcess(int by_num) {
		return sqlSession.selectOne("m4.selectRfCdate", by_num);
	}
	
	//0320
	//bynum으로 환불 완료 처리된 결제내역 삭제
	@Override
	public void refundNumDeleteProcess(int by_num) {
		sqlSession.delete("m4.deleteBuylist", by_num);
	}
	//u_id로 환불완료 처리된 환불내역 조회
	@Override
	public List<RefundDTO> selectUidRefundListProcess(String rf_uid) {
		return sqlSession.selectList("m4.selectUidRefund", rf_uid);
	}
	//환불거부
	@Override
	public void refundRejectUpdateProcess(int rf_num) {
		sqlSession.update("m4.rejectRefund", rf_num);
	}
	//buylist by_refund 'n'으로 update
	@Override
	public void byrefund3UpdateProcess(int rf_bynum) {
		sqlSession.update("m4.updateByRefund3", rf_bynum);
	}

	//0323
	//환불승인한 구매번호로 리뷰가 있는지 확인
	@Override
	public int checkRefundReviewProcess(int rf_bynum) {
		return sqlSession.selectOne("m4.checkRefundReview", rf_bynum);
	}
	//환불내역의 구매번호로 리뷰테이블 삭제
	@Override
	public void refundReviewDeleteProcess(int rf_bynum) {
		sqlSession.delete("m4.refundDeleteReview", rf_bynum);
	}
}
