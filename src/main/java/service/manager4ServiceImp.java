package service;

import java.util.Date;
import java.util.List;

import dao.manager4DAO;
import dto.BagDTO;
import dto.BuyListDTO;
import dto.HouseDTO;
import dto.HousePicsDTO;
import dto.RefundDTO;
import dto.ReviewDTO;
import dto.RoomDTO;
import dto.TimetableDTO;
import dto.UsersDTO;

public class manager4ServiceImp implements manager4Service{
	private manager4DAO dao;
	
	public void setDao(manager4DAO dao) {
		this.dao = dao;
	}

	@Override
	public HouseDTO houseDetailMethod(int h_num) {
		return dao.houseDetailProcess(h_num);
	}

	@Override
	public List<RoomDTO> roomListMethod(int h_num) {
		dao.addHouseCnt(h_num);
		List<RoomDTO> roomList = dao.roomListProcess(h_num);
		
		//각각의 집DTO에 집사진경로String배열로 적재함
		int cntRoomPics;
		for(int i=0; i<roomList.size(); i++) {
			RoomDTO room = roomList.get(i);
			cntRoomPics = dao.cntRoomPic(room.getR_num());
			String[] dirs = new String[cntRoomPics];
			for(int j=0; j<cntRoomPics; j++) {
				dirs[j] = dao.callRoomDir(room.getR_num(), j+1);// 셋팅중
			}
			room.setRoomPicDirs(dirs);
		}
		
		return roomList;
	}

	@Override
	public RoomDTO roomDetailMethod(int r_num) {
		return dao.roomDetailProcess(r_num);
	}

	@Override
	public List<TimetableDTO> timeDetailMethod(int r_num) {
		return dao.timeDetailProcess(r_num);
	}

	@Override
	public int maxMonthMethod(int r_num) {
		return dao.maxMonthProcess(r_num);
	}
	
	@Override
	public UsersDTO userInfoMethod(String u_id) {
		return dao.userInfoProcess(u_id);
	}
	
	@Override
	public HouseDTO selectBagMethod(int b_hnum) {
		return dao.selectBagProcess(b_hnum);
	}
	
	@Override
	public RoomDTO BagRnameRpriceMethod(int b_rnum) {
		return dao.selectBagRnameProcess(b_rnum);
	}

	@Override
	public void bagInsert(BagDTO bag) {
			dao.bagInsertProcess(bag);
	}
	
	 @Override
	public List<BagDTO> selectBagListMethod(String b_uid) {
		return dao.selectBagListProcess(b_uid);
	}
	 
	 @Override
	public String selectBhnameMethod(int b_hnum) {
		return dao.selectBhnameProcess(b_hnum);
	}
	 
	//장바구니 삭제하기
	@Override
	public void bagListDelete(int b_num) {
		dao.bagListDeleteProcess(b_num);
	}
	//장바구니 번호로 장바구니 조회
	@Override
	public BagDTO selectBagInfoMethod(int b_num) {
		return dao.selectBagInfoProcess(b_num);
	}
		
	//////////////0310
	//세션아이디, 방번호, 시작일로 bag 테이블에 저장되어 있는지 조회
	@Override
	public BagDTO bagInfoCheckMethod(BagDTO bag) {
		return dao.bagInfoCheckProcess(bag);
	}
		
	//////////////0311
	//buyList에 insert 하기
	@Override
	public void buyListInsert(BuyListDTO buy) {
		dao.insertBuyListProcess(buy);
	}
	//id, rnum, startdate buylist에서 조회
	@Override
	public BuyListDTO buyListDetailMethod(BuyListDTO buy) {
		return dao.buyListDetailProcess(buy);
	}
	//b_uid, b_rnum, b_startdate로 bag 테이블 조회해서 있으면 지우는 트랜잭션
	@Override
	public void checkBagDelete(BagDTO bag) {
		dao.checkBagDeleteProcess(bag);
	}
	//id로 users 테이블의 u_point update
	@Override
	public void usersPointUpdate(UsersDTO user) {
		dao.usersPointUpdateProcess(user);
	}
	//timetable로 insert
	@Override
	public void timeTableInsert(TimetableDTO timetable) {
		dao.timeTableInsertProcess(timetable);
	}
		
////////////0312
	//by_uid로 buylist 조회하기
	@Override
	public List<BuyListDTO> selectBuyListMethod(String by_uid) {
		return dao.selectBuyListProcess(by_uid);
	}
	
	//집 상세보기의 집 사진들 호출
	@Override
	public List<HousePicsDTO> housePicsProcess(int h_num) {
		return dao.housePics(h_num);
	}
	//room테이블의 r_tstate를 y로 update
	@Override
	public void tstateYesUpdate(int r_num) {
		dao.tstateYesUpdateProcess(r_num);
	}
	//room테이블의 r_tstate를 n로 update
	@Override
	public void tstateNoUpdate(int r_num) {
		dao.tstateNoUpdateProcess(r_num);
	}
	//모든 방들의 r_tstate를 y로 update
	@Override
	public void tstateAllUpdate() {
		dao.tstateAllUpdateProcess();
	}
	
	/////////////0316
	@Override
	public BuyListDTO selectBuyNumMethod(int by_num) {
		return dao.selectBuyNumProcess(by_num);
	}
	//결제한 방번호로 방이름 조회
	@Override
	public String selectRnameMethod(int by_rnum) {
		return dao.selectRnameProcess(by_rnum);
	}
	//리뷰테이블에 insert
	@Override
	public void reviewInsert(ReviewDTO review) {
		dao.reviewInsertProcess(review);
	}
	//hnum으로 리뷰테이블 조회
	@Override
	public List<ReviewDTO> selectReviewMethod(int h_num) {
		return dao.selectReviewProcess(h_num);
	}
	//별점별 개수
	@Override
	public int selectStarCntMethod(HouseDTO house) {
		return dao.selectStarCntProcess(house);
	}
	
	//리뷰중복검사
	@Override
	public int checkReviewMethod(ReviewDTO review) {
		return dao.checkReviewProcess(review);
	}
	//리뷰작성 후 포인트 업데이트
	@Override
	public void reviewPointUpdate(UsersDTO users) {
		dao.reviewPointUpdateProcess(users);
	}
	//refundDTO로 refund 테이블 insert
	@Override
	public void refundInsert(RefundDTO refund) {
			dao.refundInsertProcess(refund);
	}
	//판매자 아이디로 환불테이블 조회
	@Override
	public List<RefundDTO> selectRefundMethod(String rf_pid) {
		return dao.selectRefundProcess(rf_pid);
	}
	
	//refund의 rf_bynum으로 buylist의 by_refund 'i' 로 업데이트
	@Override
	public void byrefund1Update(int rf_bynum) {
		dao.byrefund1UpdateProcess(rf_bynum);
	}
	//refund의 rf_prog 'y' 로 업데이트
	@Override
	public void rfProg1Update(int rf_num) {
		dao.rfProg1UpdateProcess(rf_num);
	}
	//refund의 rf_bynum으로 buylist의 by_refund 'y' 로 업데이트
	@Override
	public void byrefund2Update(int rf_bynum) {
		dao.byrefund2UpdateProcess(rf_bynum);
	}
	//rf_num으로 refund 테이블 조회
	@Override
	public RefundDTO selectRefundNumMethod(int rf_num) {
		return dao.selectRefundNumProcess(rf_num);
	}
	//r_num으로 timetable 삭제
	@Override
	public void timetableDelete(int r_num) {
		dao.timetableDeleteProcess(r_num);
	}
	//u_id로 u_point 조회
	@Override
	public int selectUPointMethod(String u_id) {
		return dao.selectUPointProcess(u_id);
	}
	//rf_point 환원
	@Override
	public void rfPointUpdate(UsersDTO users) {
		dao.rfPointUpdataeProcess(users);
	}
	//rf_cdate 가져오기
	@Override
	public Date selectRfCdateMethod(int by_num) {
		return dao.selectRfCdateProcess(by_num);
	}
	
	//0320
	//bynum으로 환불 완료 처리된 결제내역 삭제
	@Override
	public void refundNumDelete(int by_num) {
		dao.refundNumDeleteProcess(by_num);
	}
	//u_id로 환불완료 처리된 환불내역 조회
	@Override
	public List<RefundDTO> selectUidRefundListMethod(String rf_uid) {
		return dao.selectUidRefundListProcess(rf_uid);
	}
	
	//환불거부
	@Override
	public void refundRejectUpdate(int rf_num) {
		dao.refundRejectUpdateProcess(rf_num);
	}
	//buylist by_refund 'n'으로 update
	@Override
	public void byrefund3Update(int rf_bynum) {
		dao.byrefund3UpdateProcess(rf_bynum);
	}
	
	//0323
	//환불승인한 구매번호로 리뷰가 있는지 확인
	@Override
	public int checkRefundReviewMethod(int rf_bynum) {
		return dao.checkRefundReviewProcess(rf_bynum);
	}
	//환불내역의 구매번호로 리뷰테이블 삭제
	@Override
	public void refundReviewDelete(int rf_bynum) {
		dao.refundReviewDeleteProcess(rf_bynum);
	}
}
