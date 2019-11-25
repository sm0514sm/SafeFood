package com.ssafy.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.model.dto.Board;

public interface BoardService {
	public Board search(String bno);
	public List<Board> searchAll(String bno);
	public List<Board> searchBoard(Map<String,String> map);
	public void insertBoard(Board board);
	public void updateBoard(Board board);
	public void deleteBoard(String bno);
}
