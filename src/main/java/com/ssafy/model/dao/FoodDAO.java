package com.ssafy.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.FoodPageBean;

@Mapper	//query.xml을 자동 매핑
public interface FoodDAO {
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
