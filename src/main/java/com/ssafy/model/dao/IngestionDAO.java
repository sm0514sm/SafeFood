package com.ssafy.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Ingestion;

@Mapper
public interface IngestionDAO {

	public List<Ingestion> searchAll(String id) throws SQLException;
	public Ingestion search(int ino) 			throws SQLException;
	public List<Food> searchNutrient(String id)		throws SQLException;
	public void add(Ingestion ingestion)	 	throws SQLException;
	public void update(Ingestion ingestion)		throws SQLException;
	public void remove(int ino)    				throws SQLException;
}
