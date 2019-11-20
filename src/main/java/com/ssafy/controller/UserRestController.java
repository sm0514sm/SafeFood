package com.ssafy.controller;

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
import com.ssafy.model.service.UserService;

import io.swagger.annotations.ApiOperation;

@RestController
public class UserRestController {
	@Autowired
	private UserService service;

	@ExceptionHandler
	public ResponseEntity<Map<String, Object>> handle(Exception e) {
		return handleFail(e.getMessage(), HttpStatus.OK);
	}
//	update == put
//	insert == post
	
	@ApiOperation("회원가입 기능")
	@PostMapping("/rest/user/signIn")
	public ResponseEntity<Map<String, Object>> signIn(@RequestBody User user) {
		service.add(user);
		return handleSuccess("회원가입 성공");
	}

	@ApiOperation("유저 정보 확인 기능")
	@GetMapping("/rest/user/{id}")
	public ResponseEntity<Map<String, Object>> userInfo(@PathVariable String id) {
		return handleSuccess(service.search(id));
	}
	
	@ApiOperation("유저 정보 확인 기능")
	@PutMapping("/rest/user/modify")
	public ResponseEntity<Map<String, Object>> modify(@RequestBody User user) {
		service.update(user);
		return handleSuccess("유저 정보 업데이트 성공");
	}

	@ApiOperation("유저 삭제 기능")
	@DeleteMapping("/rest/user/remove/{id}")
	public ResponseEntity<Map<String, Object>> remove(String id) {
		service.remove(id);
		return handleSuccess("유저 삭제 성공");
	}
	
	
	@ApiOperation("id에 해당하는 비밀번호 찾기 기능")
	@GetMapping("/rest/user/searchPW/{id}")
	public ResponseEntity<Map<String, Object>> searchPW(@PathVariable String id) {
		User temp =service.search(id);
		return handleSuccess(temp.getPassword());
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
