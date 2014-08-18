package spring.domain;


public class Search {
	
	///Field
	private Integer currentPage;
	private String searchConditionCate;
	private String searchConditionAge;
	private String searchKeyword;
	private int pageSize;
	private int shopCode;
	
	public int getShopCode() {
		return shopCode;
	}

	public void setShopCode(int shopCode) {
		this.shopCode = shopCode;
	}

	///Constructor
	public Search() {
	}
	
	///Method
	public Integer getCurrentPage() {
		return currentPage;
	}

	public String getSearchConditionCate() {
		return searchConditionCate;
	}

	public String getSearchConditionAge() {
		return searchConditionAge;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public void setSearchConditionCate(String searchConditionCate) {
		this.searchConditionCate = searchConditionCate;
	}

	public void setSearchConditionAge(String searchConditionAge) {
		this.searchConditionAge = searchConditionAge;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchConditionCate="
				+ searchConditionCate + ", searchConditionAge="
				+ searchConditionAge + ", searchKeyword=" + searchKeyword
				+ ", pageSize=" + pageSize + ", shopCode=" + shopCode + "]";
	}
	
	
}