package com.ssafy.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.FoodPageBean;
import com.ssafy.model.dto.User;

@Mapper
public interface UserDAO {
	public User search( String id) throws SQLException;
	public List<User> searchAll( ) throws SQLException;
	public void add(User user)	 throws SQLException;
	public void update(User user)throws SQLException;
	public void remove(String id)    throws SQLException;
}
