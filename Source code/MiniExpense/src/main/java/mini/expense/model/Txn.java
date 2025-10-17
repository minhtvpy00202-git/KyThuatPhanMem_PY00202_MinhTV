package mini.expense.model;

import java.sql.Date;
import java.time.LocalDate;

public class Txn {
	public String id, userId, categoryId, notes;
	public String categoryName;
	public double amount;
	public java.sql.Date txDay; 
	
	public Txn(String id, String userId, String categoryId, String notes, String categoryName, double amount,
			Date txDay) {
		super();
		this.id = id;
		this.userId = userId;
		this.categoryId = categoryId;
		this.notes = notes;
		this.categoryName = categoryName;
		this.amount = amount;
		this.txDay = txDay;
	}
	public Txn() {
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
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public java.sql.Date getTxDay() {
		return txDay;
	}
	public void setTxDay(java.sql.Date txDay) {
		this.txDay = txDay;
	}
	
	
	
}