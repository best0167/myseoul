package dto;

public class PageDTO {
	private int currentPage; // ����������
	private int totalCount; // �� ���ڵ��
	private int blockCount = 6; // �� �������� ������ ���ڵ��
	private int blockPage = 3; // �� ��Ͽ� ������ ��������
	private int totalPage; // �� ��������
	private int startRow; // ���� ���ڵ� ��ȣ
	private int endRow; // �� ���ڵ��ȣ
	private int startPage; // �� ����� ���� ������ ��ȣ
	private int endPage; // �� ����� �������� ��ȣ
	private int number;
	
	

	private String searchKey;
	private String searchWord;


	private int h_type;
	private int h_rooms;
	private int h_bath;
	
	
	public int getH_type() {
		return h_type;
	}


	public void setH_type(int h_type) {
		this.h_type = h_type;
	}


	public int getH_rooms() {
		return h_rooms;
	}


	public void setH_rooms(int h_rooms) {
		this.h_rooms = h_rooms;
	}


	public int getH_bath() {
		return h_bath;
	}


	public void setH_bath(int h_bath) {
		this.h_bath = h_bath;
	}


	public PageDTO() {
	}


	public PageDTO(int currentPage, int totalCount) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;

		// ���۷��ڵ�
		startRow = (currentPage - 1) * blockCount + 1;
		//���� ���ڵ�=(����������-1)*���������������ٷ��ڵ��+1
		// �����ڵ�
		endRow = startRow + blockCount - 1;
		//�� ���ڵ�= ���۷��ڵ�+�������������ڵ�-1
		// ����������
		totalPage = totalCount / blockCount + (totalCount % blockCount == 0 ? 0 : 1);

		// ����������
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;

		// ��������
		endPage = startPage + blockPage - 1;
		if (totalPage < endPage)
			endPage = totalPage;

		// ����Ʈ�������� ��¹�ȣ
		number = totalCount - (currentPage - 1) * blockCount;
	}

	public PageDTO(int currentPage, int totalCount, String searchKey, String searchWord) {
		this(currentPage, totalCount);
		this.searchKey = searchKey;
		this.searchWord = searchWord;
	}
	
	public PageDTO(int currentPage, int totalCount, int h_type,int h_rooms, int h_bath) {	
		this(currentPage, totalCount);
		this.blockCount= 6;
		this.h_type =h_type;
		this.h_rooms=h_rooms;
		this.h_bath = h_bath;
		//페이징시 추가
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

}
