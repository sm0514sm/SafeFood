package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Board;

public interface BoardService {
	public Board search(String bno);
	public List<Board> searchAll();
	public void insertBoard(Board board);
	public void updateBoard(Board board);
	public void deleteBoard(String bno);
}
