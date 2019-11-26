package com.ssafy.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.User;
import com.ssafy.model.service.QuizService;

import io.swagger.annotations.ApiOperation;

@RestController
public class QuizRestController {
	@Autowired
	private QuizService service;

	@ExceptionHandler
	public ResponseEntity<Map<String, Object>> handle(Exception e) {
		return handleFail(e.getMessage(), HttpStatus.OK);
	}
//	update == put
//	insert == post
	
	@ApiOperation("퀴즈 정보 1개 가져오기")
	@GetMapping("/rest/quiz/{no}")
	public ResponseEntity<Map<String, Object>> quizInfo(@PathVariable int no) throws SQLException {
		return handleSuccess(service.search(no));
	}
	
	@ApiOperation("퀴즈 모두 가져오기")
	@GetMapping("/rest/quiz")
	public ResponseEntity<Map<String, Object>> quizAll() throws SQLException {
		return handleSuccess(service.searchAll());
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
