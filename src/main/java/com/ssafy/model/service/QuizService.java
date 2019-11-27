package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.model.dto.Quiz;

public interface QuizService {
	public Quiz search(int no) throws SQLException;
	public List<Quiz> searchRealAll( ) throws SQLException;
	public List<Quiz> searchAll(int level) throws SQLException;
	public List<Quiz> searchOneWithLevel(int level) throws SQLException;
}
