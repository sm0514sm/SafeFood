package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.FoodPageBean;
import com.ssafy.model.dto.Ingestion;

public interface FoodService {
	/**
	 * 식품 코드에 해당하는 식품정보를 검색해서 반환. 
	 * @param code	검색할 식품 코드
	 * @return	식품 코드에 해당하는 식품 정보, 없으면 null이 리턴됨
	 */
	public Food search(int code);
	
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 식품 정보(Food)를  검색해서 반환.  
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public List<Food> searchAll();
	public List<Food> searchAllBean(FoodPageBean  bean);
	
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 식품 정보(Food)의 개수를 반환. 
	 * web에서 구현할 내용. 
	 * web에서 페이징 처리시 필요 
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한  식품 개수
	 */
	public int foodCount(FoodPageBean bean);
	
	public List<Integer> searchCharacter(String input);
	
	public void addCount(int code);
	
	public List<Food> caloryCalc(String keyword, String cal);
	
	public List<Food> freIngesFoodList();			//자주 섭취한 식품 정보 보여주기
	
	public void insertSelectFood(Ingestion ingestion);		//찜한 음식 추가
	
	public List<Ingestion> selectSelectFood(String id);		//찜한 음식 조회
	
	public void updateSelectFood(Ingestion ingestion);		//찜한 음식 수정
	
	public void deleteSelectFood(String ino);				//찜한 음식 삭제
	
	public List<Food> searchNutrientS(String id);					//그래프 정보
	
//	아래 미구현
//	/**
//	 * 가장 많이 검색한 Food  정보 리턴하기 
//	 * web에서 구현할 내용.  
//	 * @return
//	 */
//	public List<Food> searchBest();
//	
//	public List<Food> searchBestIndex();

}
