package spring.domain;

public class Category
{
	private String categoryCode;
	private String categoryName;
	
	public Category()
	{
		
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "Category [categoryCode=" + categoryCode + ", categoryName="
				+ categoryName + "]";
	}
}
