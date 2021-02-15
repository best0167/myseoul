package service;

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

public interface manager4Service {
	//bagDTO로 bag테이블에 insert
	public void bagInsert(BagDTO bag);
	
	//집번호로 집 상세 정보 조회
	public HouseDTO houseDetailMethod(int h_num);
	//집번호로 집 상세 정보의 사진들 호출
	public List<HousePicsDTO> housePicsProcess(int h_num);
	//집번호로 방 조회 -> 집에 방이 여러개 일 수 있음
	public List<RoomDTO> roomListMethod(int h_num);
	//방번호로 방 조회
	public RoomDTO roomDetailMethod(int r_num);
	//방번호로 타임테이블에 있는 방들 조회
	public List<TimetableDTO> timeDetailMethod(int r_num);
	//방번호로 타임테이블에 있는 최대 월 조회 -> 월 반환
	public int maxMonthMethod(int r_num);
	//u_id로 user 테이블의 회원정보 조회
	public UsersDTO userInfoMethod(String u_id);
	
	//b_hnum으로 house테이블에서 집이름, 도로명주소, 상세주소 select
	public HouseDTO selectBagMethod(int b_hnum);
	//b_rnum으로 room테이블에서 방이름, 방가격 select
	public RoomDTO BagRnameRpriceMethod(int b_rnum);
	//b_uid로 bag테이블의 리스트 조회
	public List<BagDTO> selectBagListMethod(String b_uid);
	//b_hnum으로 house테이블의 집이름 조회
	public String selectBhnameMethod(int b_hnum);
	
	//장바구니 삭제
	public void bagListDelete(int b_num);
	//장바구니 번호로 장바구니 조회
	public BagDTO selectBagInfoMethod(int b_num);
		
	///////0310
	//세션아이디, 방번호, 시작일로 bag에 저장되어 있는지 조회한다.
	public BagDTO bagInfoCheckMethod(BagDTO bag);
		
	////////0311
	//buyList에 insert 하기
	public void buyListInsert(BuyListDTO buy);
	//id, rnum, startdate buylist에서 조회
	public BuyListDTO buyListDetailMethod(BuyListDTO buy);
	//b_uid, b_rnum, b_startdate로 bag 테이블 조회해서 있으면 지우는 트랜잭션
	public void checkBagDelete(BagDTO bag);
	//id로 users 테이블의 u_point update
	public void usersPointUpdate(UsersDTO user);
	//timetable로 insert
	public void timeTableInsert(TimetableDTO timetable); 
		
	///////////0312
	//by_uid로 buylist 조회하기
	public List<BuyListDTO> selectBuyListMethod(String by_uid);
	//room테이블의 r_tstate를 y로 update
	public void tstateYesUpdate(int r_num);
	//room테이블의 r_tstate를 n로 update
	public void tstateNoUpdate(int r_num);
	//모든 방들의 r_tstate를 y로 update
	public void tstateAllUpdate();
	
	//////////0316
	//by_num으로 buylist조회
	public BuyListDTO selectBuyNumMethod(int by_num);
	//결제한 방번호로 방이름 조회
	public String selectRnameMethod(int by_rnum);
	//리뷰테이블에 insert
	public void reviewInsert(ReviewDTO review);	
	//hnum으로 리뷰테이블 조회
	public List<ReviewDTO> selectReviewMethod(int h_num);
	//평점별 개수를 map으로 받아오기
	//public List<StarCountDTO> selectStarCntMethod(int h_num);
	
	//별점 별 개수 받아오기
	public int selectStarCntMethod(HouseDTO house);
	
	//0318
	//작성된 리뷰가 있는지 중복검사
	public int checkReviewMethod(ReviewDTO review);
	//리뷰작성하면 포인트 업데이트
	public void reviewPointUpdate(UsersDTO users);
	//refundDTO로 refund 테이블 insert
	public void refundInsert(RefundDTO refund);
	//판매자 아이디로 환불테이블 조회
	public List<RefundDTO> selectRefundMethod(String rf_pid);
	
	//refund의 rf_bynum으로 buylist의 by_refund 'i' 로 업데이트
	public void byrefund1Update(int rf_bynum);
	//refund의 rf_bynum으로 buylist의 by_refund 'y' 로 업데이트
	public void byrefund2Update(int rf_bynum);
	//refund의 rf_prog 'y' 로 업데이트
	public void rfProg1Update(int rf_num);
	//rf_num으로 refund 테이블 조회
	public RefundDTO selectRefundNumMethod(int rf_num);
	//r_num으로 timetable 삭제
	public void timetableDelete(int r_num);
	//u_id로 u_point 조회
	public int selectUPointMethod(String u_id);
	//rf_point 환원
	public void rfPointUpdate(UsersDTO users);
	//rf_cdate 가져오기
	public Date selectRfCdateMethod(int by_num);
	
	//0320
	//bynum으로 환불 완료 처리된 결제내역 삭제
	public void refundNumDelete(int by_num);
	//u_id로 환불완료 처리된 환불내역 조회
	public List<RefundDTO> selectUidRefundListMethod(String rf_uid);
	
	//환불거부
	public void refundRejectUpdate(int rf_num);
	
	//buylist by_refund 'n'으로 update
	public void byrefund3Update(int rf_bynum);
	
	//0323
	//환불승인한 구매번호로 리뷰가 있는지 확인
	public int checkRefundReviewMethod(int rf_bynum);	
	//환불내역의 구매번호로 리뷰테이블 삭제
	public void refundReviewDelete(int rf_bynum);
	
	
}
