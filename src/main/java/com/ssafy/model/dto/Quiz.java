package com.ssafy.model.dto;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Quiz implements Serializable {
	private int no;
	private int level;
	private String question;
	private int answer_cnt;
	private int answer;
	private String ps;
	private String ans1;
	private String ans2;
	private String ans3;
	private String ans4;

	public Quiz() {
	}

	public Quiz(int no, int level, String question, int answer_cnt, int answer, String ps, String ans1, String ans2,
			String ans3, String ans4) {
		this.no = no;
		this.level = level;
		this.question = question;
		this.answer_cnt = answer_cnt;
		this.answer = answer;
		this.ps = ps;
		this.ans1 = ans1;
		this.ans2 = ans2;
		this.ans3 = ans3;
		this.ans4 = ans4;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public int getAnswer_cnt() {
		return answer_cnt;
	}

	public void setAnswer_cnt(int answer_cnt) {
		this.answer_cnt = answer_cnt;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}

	public String getPs() {
		return ps;
	}

	public void setPs(String ps) {
		this.ps = ps;
	}

	public String getAns1() {
		return ans1;
	}

	public void setAns1(String ans1) {
		this.ans1 = ans1;
	}

	public String getAns2() {
		return ans2;
	}

	public void setAns2(String ans2) {
		this.ans2 = ans2;
	}

	public String getAns3() {
		return ans3;
	}

	public void setAns3(String ans3) {
		this.ans3 = ans3;
	}

	public String getAns4() {
		return ans4;
	}

	public void setAns4(String ans4) {
		this.ans4 = ans4;
	}

	@Override
	public String toString() {
		return "Quiz [no=" + no + ", level=" + level + ", question=" + question + ", answer_cnt=" + answer_cnt
				+ ", answer=" + answer + ", ps=" + ps + ", ans1=" + ans1 + ", ans2=" + ans2 + ", ans3=" + ans3
				+ ", ans4=" + ans4 + "]";
	}
}
