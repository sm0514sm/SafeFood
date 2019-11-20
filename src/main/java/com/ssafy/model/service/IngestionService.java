package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Ingestion;

public interface IngestionService {
	
	public List<Ingestion> searchAll(String id) throws SQLException;
	public Ingestion search(int ino) 			throws SQLException;
	public List<Food> searchNutrient(String id)	;
	public void add(Ingestion ingestion)	 	throws SQLException;
	public void update(Ingestion ingestion)		throws SQLException;
	public void remove(int ino)    				throws SQLException;
}
