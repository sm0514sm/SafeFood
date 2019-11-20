package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.User;

public interface UserService {
	public User search(String id);
	public List<User> searchAll();
	public boolean login(String id, String pw);
	public boolean checkID(String id);
	public void add(User user);
	public void update(User user);
	public void remove(String id);
}
