package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.BoardAnsDAO;
import com.ssafy.model.dto.BoardAns;
import com.ssafy.model.dto.BoardException;

@Service
public class BoardAnsServiceImpl implements BoardAnsService {
	@Autowired
	BoardAnsDAO dao ;
	
	public BoardAns search(String bno) {
		try {
			return dao.search(bno);
		}catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("답변 게시글 검색 중 오류 발생");
		}
	}
	
	public List<BoardAns> searchAll(String qno) {
		try {
			return dao.searchAll(qno);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("해당 게시글 전체 답변 게시글 검색 중 오류 발생");
		}
	}
	
	public void insertBoardAns(BoardAns boardAns) {
		try {
			dao.insertBoardAns(boardAns);
		}catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("답변 게시글 추가 중 오류 발생");
		}
	}
	
	public void updateBoardAns(BoardAns boardAns) {
		try {
			dao.updateBoardAns(boardAns);
		}catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("답변 게시글 수정 중 오류 발생");
		}
	}
	
	public void deleteBoardAns(String bno) {
		try {
			dao.deleteBoardAns(bno);
		}catch (Exception e) {
			e.printStackTrace();
			throw new BoardException("답변 게시글 삭제 중 오류 발생");
		}
	}
}














