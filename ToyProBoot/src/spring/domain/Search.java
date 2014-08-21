package spring.domain;


public class Search {
	
	///Field
	private Integer currentPage;
	private String searchConditionCate;
	private String searchConditionAge;
	private String bbsCondition;
	private String searchKeyword;
	private int pageSize;
	private int shopCode;
	

	///Constructor
	public Search() {
	}

	///Method
	public Integer getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}


	public String getSearchConditionCate() {
		return searchConditionCate;
	}


	public void setSearchConditionCate(String searchConditionCate) {
		this.searchConditionCate = searchConditionCate;
	}


	public String getSearchConditionAge() {
		return searchConditionAge;
	}


	public void setSearchConditionAge(String searchConditionAge) {
		this.searchConditionAge = searchConditionAge;
	}


	public String getBbsCondition() {
		return bbsCondition;
	}


	public void setBbsCondition(String bbsCondition) {
		this.bbsCondition = bbsCondition;
	}


	public String getSearchKeyword() {
		return searchKeyword;
	}


	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getShopCode() {
		return shopCode;
	}


	public void setShopCode(int shopCode) {
		this.shopCode = shopCode;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchConditionCate="
				+ searchConditionCate + ", searchConditionAge="
				+ searchConditionAge + ", bbsCondition=" + bbsCondition
				+ ", searchKeyword=" + searchKeyword + ", pageSize=" + pageSize
				+ ", shopCode=" + shopCode + ", getCurrentPage()="
				+ getCurrentPage() + ", getSearchConditionCate()="
				+ getSearchConditionCate() + ", getSearchConditionAge()="
				+ getSearchConditionAge() + ", getBbsCondition()="
				+ getBbsCondition() + ", getSearchKeyword()="
				+ getSearchKeyword() + ", getPageSize()=" + getPageSize()
				+ ", getShopCode()=" + getShopCode() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

	
}