package mini.expense.model;

public class CategoryType {
	public String id, name;

	public CategoryType(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public CategoryType() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}