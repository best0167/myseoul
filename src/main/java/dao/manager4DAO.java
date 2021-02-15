package dao;

import java.util.Date;
import java.util.List;

import dto.BagDTO;
import dto.BuyListDTO;
import dto.HouseDTO;
import dto.HousePicsDTO;
import dto.RefundDTO;
import dto.ReviewDTO;
import dto.RoomDTO;
import dto.TimetableDTO;
import dto.UsersDTO;

public interface manager4DAO {
	//public RoomDTO detailRoomProcess(int r_num);
	//public String[] checkDayProcess(int r_num);
	
	//집번호로 집 상세 정보 조회
	public HouseDTO houseDetailProcess(int h_num);
	//집번호에 해당하는 집 조회수 1 증가
	public void addHouseCnt(int h_num);
	//집번호에 해당하는 집 사진들 호출
	public List<HousePicsDTO> housePics(int h_num);
	//집번호로 방 조회 -> 집에 방이 여러개 일 수 있음
	public List<RoomDTO> roomListProcess(int h_num);
	//방번호로 방 조회
	public RoomDTO roomDetailProcess(int r_num);
	//방번호로 타임테이블에 있는 방들 조회
	public List<TimetableDTO> timeDetailProcess(int r_num);
	//방번호로 타임테이블에 있는 최대 월 조회 -> 월 반환
	public int maxMonthProcess(int r_num);
	
	//u_id로 users테이블의 회원정보 조회하기
	public UsersDTO userInfoProcess(String u_id);

	//b_hnum으로 집테이블에서 집이름, 도로명 주소, 상세주소 select
	public HouseDTO selectBagProcess(int b_hnum);
	
	//b_rnum으로 room테이블에서 방이름, 방가격 가져와
	public RoomDTO selectBagRnameProcess(int b_rnum);
	
	public void bagInsertProcess(BagDTO bag);
	
	public List<BagDTO> selectBagListProcess(String b_uid);
	
//test
	public String selectBhnameProcess(int b_hnum);
//test	
	
	//장바구니 삭제하기
	public void bagListDeleteProcess(int b_num);
	//장바구니 번호로 장바구니 조회
	public BagDTO selectBagInfoProcess(int b_num);
	
	//////////////// 0310
	// 세션아이디, 방번호, 시작일로 bag 테이블에 저장되어 있는지 조회
	public BagDTO bagInfoCheckProcess(BagDTO bag);
	
	////////////// 0311
	// buyList에 insert 하기
	public void insertBuyListProcess(BuyListDTO buy);
	// id, rnum, startdate buylist에서 조회
	public BuyListDTO buyListDetailProcess(BuyListDTO buy);
	// b_uid, b_rnum, b_startdate로 bag 테이블 조회해서 있으면 지우는 트랜잭션
	public void checkBagDeleteProcess(BagDTO bag);
	// id로 users 테이블의 u_point update
	public void usersPointUpdateProcess(UsersDTO user);
	// timetable로 insert
	public void timeTableInsertProcess(TimetableDTO timetable);

	///////////// 0312
	// by_uid로 buylist 조회하기
	public List<BuyListDTO> selectBuyListProcess(String by_uid);
	
	public int cntRoomPic(int hp_rnum);
	public String callRoomDir(int rnum, int call);
	//room테이블의 r_tstate를 y로 update
	public void tstateYesUpdateProcess(int r_num);
	//room테이블의 r_tstate를 n로 update
	public void tstateNoUpdateProcess(int r_num);
	//모든 방들의 r_tstate를 y로 update
	public void tstateAllUpdateProcess();
	
	/////////0316
	//결제번호로 구매내역조회
	public BuyListDTO selectBuyNumProcess(int by_num);
	//결제한 방번호로 방이름 조회
	public String selectRnameProcess(int by_rnum);
	//리뷰테이블에 insert
	public void reviewInsertProcess(ReviewDTO review);
	//hnum으로 리뷰테이블 조회
	public List<ReviewDTO> selectReviewProcess(int h_num);

	//별점별 개수
	public int selectStarCntProcess(HouseDTO house);
	
	//리뷰중복검사
	public int checkReviewProcess(ReviewDTO review);
	//리뷰 작성 후 포인트 업데이트
	public void reviewPointUpdateProcess(UsersDTO users);
	//refundDTO로 refund 테이블 insert
	public void refundInsertProcess(RefundDTO refund);
	//판매자 아이디로 환불테이블 조회
	public List<RefundDTO> selectRefundProcess(String rf_pid);
	
	//refund의 rf_bynum으로 buylist의 by_refund 'i' 로 업데이트
	public void byrefund1UpdateProcess(int rf_bynum);
	//refund의 rf_prog 'y' 로 업데이트
	public void rfProg1UpdateProcess(int rf_num);

	//refund의 rf_bynum으로 buylist의 by_refund 'y' 로 업데이트
	public void byrefund2UpdateProcess(int rf_bynum);
	//rf_num으로 refund 테이블 조회
	public RefundDTO selectRefundNumProcess(int rf_num);
	//r_num으로 timetable 삭제
	public void timetableDeleteProcess(int r_num);
	//u_id로 u_point 조회
	public int selectUPointProcess(String u_id);
	//rf_point 환원
	public void rfPointUpdataeProcess(UsersDTO users);
	//rf_cdate 가져오기
	public Date selectRfCdateProcess(int by_num);
	
	//0320
	//bynum으로 환불 완료 처리된 결제내역 삭제
	public void refundNumDeleteProcess(int by_num);
	//u_id로 환불완료 처리된 환불내역 조회
	public List<RefundDTO> selectUidRefundListProcess(String rf_uid);
	
	//환불거부
	public void refundRejectUpdateProcess(int rf_num);
	
	//buylist by_refund 'n'으로 update
	public void byrefund3UpdateProcess(int rf_bynum);
	
	//0323
	//환불내역의 구매번호로 작성된 리뷰가 있는지 조회
	public int checkRefundReviewProcess(int rf_bynum);
	//환불내역의 구매번호로 리뷰테이블 삭제
	public void refundReviewDeleteProcess(int rf_bynum);
}
