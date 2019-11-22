package com.ssafy.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.BoardAns;

@Mapper
public interface BoardAnsDAO {
	public BoardAns search(String bno);				//boardAns 하나 검색
	public List<BoardAns> searchAll(String qno);	//boardAns list 
	public void insertBoardAns(BoardAns board);		//boardAns 추가
	public void updateBoardAns(BoardAns board);		//boardAns 수정
	public void deleteBoardAns(String bno) ;		//boardAns 삭제
}