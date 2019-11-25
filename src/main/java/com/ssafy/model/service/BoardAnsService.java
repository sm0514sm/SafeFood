package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.BoardAns;

public interface BoardAnsService {
	public BoardAns search(String bno);
	public List<BoardAns> searchAll(String qno);
	public void insertBoardAns(BoardAns boardAns);
	public void updateBoardAns(BoardAns boardAns);
	public void deleteBoardAns(String bno);
	public void goodBoardAns(BoardAns boardAns);	//goods++
}
