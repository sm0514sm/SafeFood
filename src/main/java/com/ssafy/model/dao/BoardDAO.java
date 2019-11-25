package com.ssafy.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Board;

@Mapper
public interface BoardDAO {
	public Board search(String bno);						//board 하나 검색
	public List<Board> searchAll(String sno);				//board list
	public List<Board> searchBoard(Map<String,String> map);	//board 검색
	public void insertBoard(Board board);					//board 추가
	public void updateBoard(Board board);					//board 수정
	public void deleteBoard(String bno) ;					//board 삭제
}
