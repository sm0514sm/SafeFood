package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.Board;
import com.ssafy.model.dto.BoardAns;
import com.ssafy.model.service.BoardAnsService;
import com.ssafy.model.service.BoardService;

import io.swagger.annotations.ApiOperation;

@CrossOrigin("*")
@RestController
public class BoardRestController {
	@Autowired
	private BoardService service;
	@Autowired
	private BoardAnsService aService;

	@ExceptionHandler
	public ResponseEntity<Map<String, Object>> handle(Exception e) {
		return handleFail(e.getMessage(), HttpStatus.OK);
	}
	
	@ApiOperation("bno에 해당하는 게시글 목록을 조회하는 기능")
	@GetMapping("/rest/board/{bno}")
	public ResponseEntity<Map<String, Object>> searchBoard(@PathVariable String bno) {
		Board board = service.search(bno);
		return handleSuccess(board);
	}
	
	@ApiOperation("전체 게시글 목록을 조회하는 기능")
	@GetMapping("/rest/board")
	public ResponseEntity<Map<String, Object>> searchAll() {
		List<Board> list = service.searchAll();
		return handleSuccess(list);
	}
	
	@ApiOperation("게시글 목록을 검색하는 기능")
	@GetMapping("/rest/boardsearch/{keyword}_{name}")
	public ResponseEntity<Map<String, Object>> searchBoard(@PathVariable String keyword,@PathVariable String name) {
		Map<String, String> m = new HashMap<>();
		m.put("keyword", keyword);
		m.put("name", name);
		List<Board> list = service.searchBoard(m);
		return handleSuccess(list);
	}
	
	@ApiOperation("게시글을 등록하는 기능")
	@PostMapping("/rest/board")
	public ResponseEntity<Map<String, Object>> insertBoard(@RequestBody Board board) {
		service.insertBoard(board);
		return handleSuccess("등록 완료");
	}
	
	@ApiOperation("게시글을 수정하는 기능")
	@PutMapping("/rest/board")
	public ResponseEntity<Map<String, Object>> updateBoard(@RequestBody Board board) {
		service.updateBoard(board);
		return handleSuccess("수정 완료");
	}
	
	@ApiOperation("게시글을 삭제하는 기능")
	@DeleteMapping("/rest/board/{bno}")
	public ResponseEntity<Map<String, Object>> deleteBoard(@PathVariable String bno) {
		service.deleteBoard(bno);
		return handleSuccess("삭제 완료");
	}
	
	//BoardAns
	@ApiOperation("bno에 해당하는 답변 게시글 목록을 조회하는 기능")
	@GetMapping("/rest/boardans/{bno}")
	public ResponseEntity<Map<String, Object>> searchBoardAns(@PathVariable String bno) {
		BoardAns boardAns = aService.search(bno);
		return handleSuccess(boardAns);
	}
	
	@ApiOperation("전체 답변 게시글 목록을 조회하는 기능")
	@GetMapping("/rest/boardansq/{qno}")
	public ResponseEntity<Map<String, Object>> searchAll(@PathVariable String qno) {
		List<BoardAns> list = aService.searchAll(qno);
		return handleSuccess(list);
	}
	
	@ApiOperation("답변 게시글을 등록하는 기능")
	@PostMapping("/rest/boardans")
	public ResponseEntity<Map<String, Object>> insertBoardAns(@RequestBody BoardAns boardans) {
		aService.insertBoardAns(boardans);
		return handleSuccess("등록 완료");
	}
	
	@ApiOperation("답변 게시글을 수정하는 기능")
	@PutMapping("/rest/boardans")
	public ResponseEntity<Map<String, Object>> updateBoardAns(@RequestBody BoardAns boardans) {
		aService.updateBoardAns(boardans);
		return handleSuccess("수정 완료");
	}
	
	@ApiOperation("답변 게시글을 삭제하는 기능")
	@DeleteMapping("/rest/boardans/{bno}")
	public ResponseEntity<Map<String, Object>> foodDetail(@PathVariable String bno) {
		aService.deleteBoardAns(bno);
		return handleSuccess("삭제 완료");
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
