package com.ssafy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.FoodPageBean;
import com.ssafy.model.service.FoodService;

import io.swagger.annotations.ApiOperation;

@RestController
public class FoodRestController {
	@Autowired
	private FoodService service;

	@ExceptionHandler
	public ResponseEntity<Map<String, Object>> handle(Exception e) {
		return handleFail(e.getMessage(), HttpStatus.OK);
	}

	@ApiOperation("전체 음식 목록을 조회하는 기능")
	@GetMapping("/rest/food")
	public ResponseEntity<Map<String, Object>> foodList() {
		List<Food> list = service.searchAll();
		return handleSuccess(list);
	}
	
	@ApiOperation("키워드에 해당하는 음식 목록을 조회하는 기능\nKeyword (name, maker, material)")
	@GetMapping("/rest/food/{searchSelect}/{searchWord}")
	public ResponseEntity<Map<String, Object>> searchKeyword(@PathVariable String searchSelect, @PathVariable String searchWord) {
		List<Food> list = service.searchAllBean(new FoodPageBean(searchSelect, searchWord, null, null));
		return handleSuccess(list);
	}
	
	@ApiOperation("코드에 해당하는 음식을 자세히 조회하는 기능")
	@GetMapping("/rest/food/foodDetail/{code}")
	public ResponseEntity<Map<String, Object>> foodDetail(@PathVariable String code) {
		int codeInt = Integer.parseInt(code);
		service.addCount(codeInt);
		return handleSuccess(service.search(codeInt));
	}

	@ApiOperation("입력한 문자를 포함하는 음식 목록을 조회하는 기능")
	@GetMapping("/rest/food/searchCharacter/{input}")
	public ResponseEntity<Map<String, Object>> searchCharacter(@PathVariable String input) {
		if(input.equals(""))
			input = new String("아무것도 입력안해서 검색 안돌아가게 하는 텍스트");
		List<Integer> codeResults = service.searchCharacter(input);
		List<String[]> results = new ArrayList<String[]>();
		for (int i = 0; i < codeResults.size();i++) {
			Food temp = service.search(codeResults.get(i));
			results.add(new String[] {temp.getCode() + "", temp.getName()});
			System.out.println(temp.getCode() + " : " + temp.getName());
		}
		return handleSuccess(results);
	}

	public ResponseEntity<Map<String, Object>> handleFail(Object data, HttpStatus state) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("state", "fail");
		resultMap.put("data", data);
		return new ResponseEntity<Map<String, Object>>(resultMap, state);
	}

	public ResponseEntity<Map<String, Object>> handleSuccess(Object data) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("state", "ok");
		resultMap.put("data", data);
		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
	}
}
