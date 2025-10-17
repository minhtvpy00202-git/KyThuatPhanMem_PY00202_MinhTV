package mini.expense.model;

public class Category {
	public String id, userId, categoryTypeId, name;

	public Category(String id, String userId, String categoryTypeId, String name) {
		super();
		this.id = id;
		this.userId = userId;
		this.categoryTypeId = categoryTypeId;
		this.name = name;
	}

	public Category() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCategoryTypeId() {
		return categoryTypeId;
	}

	public void setCategoryTypeId(String categoryTypeId) {
		this.categoryTypeId = categoryTypeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}