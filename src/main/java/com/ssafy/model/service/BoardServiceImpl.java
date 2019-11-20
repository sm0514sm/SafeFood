package com.ssafy.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.BoardDAO;
import com.ssafy.model.dto.Board;
import com.ssafy.model.dto.BoardException;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO dao ;
	
	public Board search(String bno) {
		try {
			return dao.search(bno);
		}catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시글 검색 중 오류 발생");
		}
	}
	
	public List<Board> searchAll() {
		try {
			return dao.searchAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("전체 게시글 검색 중 오류 발생");
		}
	}
	
	public List<Board> searchBoard(Map<String,String> map){
		try {
			return dao.searchBoard(map);
		}catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시글 검색 중 오류 발생");
		}
	}
	
	public void insertBoard(Board board) {
		try {
			dao.insertBoard(board);
		}catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시글 추가 중 오류 발생");
		}
	}
	
	public void updateBoard(Board board) {
		try {
			dao.updateBoard(board);
		}catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시글 수정 중 오류 발생");
		}
	}
	
	public void deleteBoard(String bno) {
		try {
			dao.deleteBoard(bno);
		}catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("게시글 삭제 중 오류 발생");
		}
	}
}














