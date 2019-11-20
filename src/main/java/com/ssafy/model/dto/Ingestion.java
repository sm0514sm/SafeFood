package com.ssafy.model.dto;

public class Ingestion {
	int ino;
	String id;
	int code;
	String ingdate;
	int quantity;
	String foodName;
	String material;
	String allergy;
	
	public Ingestion() {
		super();
	}

	public Ingestion(String id, int code, int quantity) {
		super();
		this.id = id;
		this.code = code;
		this.quantity = quantity;
	}

	public Ingestion(int ino, String id, int code, String ingdate, int quantity) {
		super();
		this.ino = ino;
		this.id = id;
		this.code = code;
		this.ingdate = ingdate;
		this.quantity = quantity;
	}

	public Ingestion(int ino, String id, int code, String ingdate, int quantity, String foodName, String material,
			String allergy) {
		super();
		this.ino = ino;
		this.id = id;
		this.code = code;
		this.ingdate = ingdate;
		this.quantity = quantity;
		this.foodName = foodName;
		this.material = material;
		this.allergy = allergy;
	}

	public int getIno() {
		return ino;
	}

	public void setIno(int ino) {
		this.ino = ino;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getIngdate() {
		return ingdate;
	}

	public void setIngdate(String ingdate) {
		this.ingdate = ingdate;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	@Override
	public String toString() {
		return "Ingestion [ino=" + ino + ", id=" + id + ", code=" + code + ", ingdate=" + ingdate + ", quantity="
				+ quantity + "]";
	}
	
	
}
