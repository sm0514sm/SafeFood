package com.ssafy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.FoodPageBean;
import com.ssafy.model.dto.Ingestion;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.IngestionService;

import io.swagger.annotations.ApiOperation;

@RestController
public class FoodRestController {
	@Autowired
	private FoodService service;
	
	@Autowired
	private IngestionService ingestionService;

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
	
	@ApiOperation("자주 섭취한 식품 정보를 조회하는 기능")
	@GetMapping("/rest/frefoodlist")
	public ResponseEntity<Map<String, Object>> freIngesFoodList() {
		List<Food> list = service.freIngesFoodList();
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

	@ApiOperation("찜한 음식 추가")
	@PostMapping("/rest/selectfood")
	public ResponseEntity<Map<String, Object>> insertSelectFood(@RequestBody Ingestion ingestion){
		service.insertSelectFood(ingestion);
		return handleSuccess("찜 등록 성공");
	}
	
	@ApiOperation("찜한 음식 조회")
	@GetMapping("/rest/selectfood/{id}")
	public ResponseEntity<Map<String, Object>> insertSelectFood(@PathVariable String id){
		List<Ingestion> list = service.selectSelectFood(id);
		return handleSuccess(list);
	}
	//deleteSelectFood
	@ApiOperation("찜한 음식 삭제")
	@DeleteMapping("/rest/selectfood/{ino}")
	public ResponseEntity<Map<String, Object>> deleteSelectFood(@PathVariable String ino){
		service.deleteSelectFood(ino);
		return handleSuccess("삭제 성공");
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
