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

	public List<Ingestion> searchAll(String id){
		try {
			return dao.searchAll(id);
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	public Ingestion search(int ino) 			{
		
		try {
			Ingestion find = dao.search(ino);
			return find;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
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
	public void add(Ingestion ingestion){
		try {
			dao.add(ingestion);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("섭취 음식 추가 중 오류");
		}
	}
	public void update(Ingestion ingestion) {
		try {
			dao.update(ingestion);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("섭취 음식 수정 중 오류");
		}
	}
	public void remove(int ino) {
		try {
			dao.remove(ino);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("섭취 음식 삭제 중 오류");
		}
	}
	public List<Food> searchNutrientD(String id){
		try {
			return dao.searchNutrientD(id);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("섭취 음식 조회 중 오류 D");
		}
	}
	public List<Food> searchNutrientW(String id){
		try {
			return dao.searchNutrientW(id);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("섭취 음식 조회 중 오류 W");
		}
	}
	public List<Food> searchNutrientM(String id){
		try {
			return dao.searchNutrientM(id);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("섭취 음식 조회 중 오류 M");
		}
	}
	
}
