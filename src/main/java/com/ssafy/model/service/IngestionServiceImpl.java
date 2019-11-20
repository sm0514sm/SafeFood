package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.IngestionDAO;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Ingestion;

@Service
public class IngestionServiceImpl implements IngestionService{
	@Autowired
	private IngestionDAO dao;

	public List<Ingestion> searchAll(String id) throws SQLException {
		return dao.searchAll(id);
	}
	public Ingestion search(int ino) 			throws SQLException {
		Ingestion find = dao.search(ino);
		return find;
	}
	public List<Food> searchNutrient(String id)	{
		try {
			System.out.println("## showGraph Service##");
			List<Food> list = dao.searchNutrient(id);
			return list;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public void add(Ingestion ingestion) 		throws SQLException {
		dao.add(ingestion);
	}
	public void update(Ingestion ingestion) 	throws SQLException {
		dao.update(ingestion);
	}
	public void remove(int ino) 				throws SQLException {
		dao.remove(ino);
	}
}
