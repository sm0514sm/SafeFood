package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.QuizDAO;
import com.ssafy.model.dto.Quiz;
import com.ssafy.model.dto.User;
import com.ssafy.model.dto.UserException;

@Service
public class QuizServiceImpl implements QuizService {
	@Autowired
	private QuizDAO dao;
	
	@Override
	public Quiz search(int no) throws SQLException {
		try {
			Quiz quiz = dao.search(no);
			if(quiz == null) {
				throw new UserException("등록되지 않은 퀴즈입니다.");
			}else {
			   return quiz;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException();
		}
	}

	@Override
	public List<Quiz> searchAll() throws SQLException {
		try {
			return dao.searchAll();
		}catch (SQLException e) {
			throw new UserException();
		}
	}

}
