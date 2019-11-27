package com.ssafy.model.dto;

/** 식품 정보 */
public class User {
	String address, email, id, name, password, phone, allergy;
	int best_quiz_score;

	/*
	 * CREATE TABLE `ssafydb`.`user` ( `id` VARCHAR(15) NOT NULL, `password`
	 * VARCHAR(45) NULL, `address` VARCHAR(300) NULL, `email` VARCHAR(45) NULL,
	 * `name` VARCHAR(20) NULL, `phone` VARCHAR(45) NULL, `allergy` VARCHAR(1000)
	 * NULL, PRIMARY KEY (`id`));
	 * 
	 * 
	 */
	public User() {
		super();
	}

	public int getBest_quiz_score() {
		return best_quiz_score;
	}

	public void setBest_quiz_score(int best_quiz_score) {
		this.best_quiz_score = best_quiz_score;
	}

	public User(String id, String name, String email, String phone) {
		super();
		this.email = email;
		this.id = id;
		this.name = name;
		this.phone = phone;
	}

	public User(String id, String password, String name, String email, String phone, String address, String allergy,
			int bestScore) {
		super();
		this.address = address;
		this.email = email;
		this.id = id;
		this.name = name;
		this.password = password;
		this.phone = phone;
		this.allergy = allergy;
		this.best_quiz_score = bestScore;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	@Override
	public String toString() {
		return "User [address=" + address + ", email=" + email + ", id=" + id + ", name=" + name + ", password="
				+ password + ", phone=" + phone + ", allergy=" + allergy + "]";
	}

}
