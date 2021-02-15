package dto;

import java.util.Date;

public class SellListPageDTO {
	private int currentPage; // 현재페이지
	private int totalCount; // 총 레코드수
	private int blockCount = 5; // 한 페이지에 보여줄 레코드수
	private int blockPage = 3; // 한 블록에 보여줄 페이지수
	private int totalPage; // 총 페이지수
	private int startRow; // 시작 레코드 번호
	private int endRow; // 끝 레코드번호
	private int startPage; // 한 블록의 시작 페이지 번호
	private int endPage; // 한 블록의 끝페이지 번호
	private int number;
	
	private String searchKey;
	private String searchWord;
	
	private int searchKey3;
	private String date;
	
	private Date by_regdate;


	public SellListPageDTO() {

	}

	// 현재 페이지, 총 레코드 
	public SellListPageDTO(int currentPage, int totalCount) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;

		// 시작레코드
		startRow = (currentPage - 1) * blockCount + 1;

		// 끝레코드
		endRow = startRow + blockCount - 1;

		// 총페이지수
		totalPage = totalCount / blockCount + (totalCount % blockCount == 0 ? 0 : 1);

		// 시작페이지
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;

		// 끝페이지
		endPage = startPage + blockPage - 1;
		if (totalPage < endPage)
			endPage = totalPage;

		// 리스트페이지에 출력번호
		number = totalCount - (currentPage - 1) * blockCount;
	}

	public SellListPageDTO(int currentPage, int totalCount, String searchKey, String searchWord) {
		this(currentPage, totalCount);
		this.searchKey = searchKey;
		this.searchWord = searchWord;
	}
	
	public SellListPageDTO(int currentPage, int totalCount, String searchKey, int searchKey3, String searchWord, String date) {
		this(currentPage, totalCount);
		this.searchKey = searchKey;
		this.searchKey3 = searchKey3;
		this.date = date;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getSearchKey3() {
		return searchKey3;
	}

	public void setSearchKey3(int searchKey3) {
		this.searchKey3 = searchKey3;
	}

	public Date getBy_regdate() {
		return by_regdate;
	}

	public void setBy_regdate(Date by_regdate) {
		this.by_regdate = by_regdate;
	}

	

	
}
