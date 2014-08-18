package spring.domain;

public class Page
{
	// 페이지에 대한 모든 정보를 추상화 캡슐화
	// 필드
	private int currentPage; // 현재 페이지
	private int totalCount; // 총 게시물 수
	private int pageUnit; // 하단 페이지 번호 화면에 보여지는 수, 예) 5면 [1] [2] [3] [4] [5]
	private int pageSize; // 한 페이지당 보여지는 게시물 수, 게시물의 row 수
	private int maxPage; // 최대 페이지 번호(전체 페이지)
	private int beginUnitPage; // 화면에 보여지는 페이지 번호의 최소수
	private int endUnitPage; // 화면에 보여지는 페이지 번호의 최대수
	
	// 생성자
	public Page()
	{
		
	}
	// jsp로 리턴해 줄 페이지와 begin, endUnitPage 세팅
	public Page(int currentPage, int totalCount, int pageUnit, int pageSize)
	{
		// Page 생성자를 호출했을 때 총 게시물의 수를 알 수 없기 때문에 필드 초기화 x
		this.currentPage = currentPage; // 1
		this.totalCount = totalCount;
		this.pageUnit = pageUnit; // 5
		this.pageSize = pageSize; // 3
		
		// 총 페이지 수는 totalCount / pageSize 일듯..
		// 총 게시물 나누기 페이지당 보여줄 게시물의 로우 수
		maxPage = (totalCount % pageSize == 0) ? (totalCount / pageSize) : (totalCount / pageSize + 1);
		// totalCount = 20이라고 가정하면
		// maxPage = 7이된다.
		
		beginUnitPage = ((currentPage-1) / pageUnit) * pageUnit + 1;
		
		if(((currentPage - 1) / pageUnit) >= maxPage / pageUnit)
		{
			endUnitPage = maxPage;
		}
		else
		{
			endUnitPage = (((currentPage - 1) / pageUnit) + 1) * pageUnit;
		}
	}
	
	// 메서드
	// getter, setter
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

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getBeginUnitPage() {
		return beginUnitPage;
	}

	public void setBeginUnitPage(int beginUnitPage) {
		this.beginUnitPage = beginUnitPage;
	}

	public int getEndUnitPage() {
		return endUnitPage;
	}

	public void setEndUnitPage(int endUnitPage) {
		this.endUnitPage = endUnitPage;
	}

	// toString()
	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", totalCount="
				+ totalCount + ", pageUnit=" + pageUnit + ", pageSize="
				+ pageSize + ", maxPage=" + maxPage + ", beginUnitPage="
				+ beginUnitPage + ", endUnitPage=" + endUnitPage + "]";
	}
}
