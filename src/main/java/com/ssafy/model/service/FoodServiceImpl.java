package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.FoodDAO;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.FoodPageBean;
import com.ssafy.model.dto.SafeFoodException;

@Service
public class FoodServiceImpl implements FoodService{
	@Autowired
	private FoodDAO dao;
	private String[] allergys={"대두","땅콩","우유","게","새우","참치","연어","쑥","소고기","닭고기","돼지고기","복숭아","민들레","계란흰자"};
	static int now = 0;
	
	public Food search(int code) {
		Food find = dao.search(code);
		String str = "";
		if (find == null) {
			throw new SafeFoodException("음식이 없습니다.");
		} else {
			for (int i = 0; i < allergys.length; i++) {
				if (find.getMaterial().contains(allergys[i])) {
					str = str.concat(allergys[i]+" ");
				}
			}
		}
		find.setAllergy(str);
		return find;
	}
	public List<Food> searchAll() {
		return dao.searchAll();
	}
	public List<Food> searchAllBean(FoodPageBean bean) {
		return dao.searchAllBean(bean);
	}
	public List<Integer> searchCharacter(String input){
		return dao.searchCharacter(input);
	}
	@Override
	public void addCount(int code) {
		dao.addCount(code);
	}
	@Override
	public int foodCount(FoodPageBean bean) {
		return dao.foodCount(bean);
	}
	
	@Override
	public List<Food> caloryCalc(String keyword, String cal) {
		now = 0;
		try {
			List<Food> food = dao.searchAll();
			Collections.sort(food, new Comparator<Food>() {
	            @Override
	            public int compare(Food f1, Food f2) {
	                return (int) (-1 * (f1.getCalory() - f2.getCalory()));
	            }
	        });
			if (food == null) {
				throw new SQLException();
			} else {
				List<Food> calfood = new LinkedList<>();
				int calory = Integer.parseInt(cal);
				int size = food.size();
				for (int i = 1; i < size; i++) {
					int[] com = new int[i];
					if (combi(i, 0, 0, com, 0, calory, food)) {
						for (int j = 0; j < now; j++)
							calfood.add(food.get(com[j]));
						return calfood;
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private boolean combi(int n, int k, int idx, int[] com, double sum, int calory, List<Food> food) {
		if (sum >= calory - 100 && sum <= calory + 100) {
			now = k;
			return true;
		}
		if (n == k)
			return false;
		
		for (int i = idx; i < n; i++) {
			com[k] = i;
			if (combi(n, k + 1, i + 1, com, sum + food.get(i).getCalory(), calory, food)) return true;
			com[k] = 0;
		}
		return false;
	}
}