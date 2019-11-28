package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Ingestion;

public interface IngestionService {
	
	public List<Ingestion> searchAll(String id) ;
	public Ingestion search(int ino) 			;
	public List<Food> searchNutrient(String id)	;
	public void add(Ingestion ingestion)	 	;
	public void update(Ingestion ingestion)		;
	public void remove(int ino)    				;
	public List<Food> searchNutrientD(String id)	throws SQLException;
	public List<Food> searchNutrientW(String id)	throws SQLException;
	public List<Food> searchNutrientM(String id)	throws SQLException;
}
