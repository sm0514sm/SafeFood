package com.ssafy.model.dto;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
public class BoardAns implements Serializable {
	private int bno        	 ;			//게시글 번호
	private int sno        	 ;			//게시판 번호
	private String title     ;          //제목
	private String contents  ;          //내용
	private String bregdate  ;          //작성일자+시간
	private int hits		 ;          //조회수
	private int goods    	 ;          //좋아요 수
	private String uid       ;          //작성자 id
	
	public BoardAns() {}
	
	public BoardAns(int bno, int sno, String title, String contents, String bregdate, int hits, int goods, String uid) {
		super();
		this.bno = bno;
		this.sno = sno;
		this.title = title;
		this.contents = contents;
		this.bregdate = bregdate;
		this.hits = hits;
		this.goods = goods;
		this.uid = uid;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getBregdate() {
		return bregdate;
	}

	public void setBregdate(String bregdate) {
		this.bregdate = bregdate;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getGoods() {
		return goods;
	}

	public void setGoods(int goods) {
		this.goods = goods;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	@Override
	public String toString() {
		return "Board [bno=" + bno + ", sno=" + sno + ", title=" + title + ", contents=" + contents + ", bregdate="
				+ bregdate + ", hits=" + hits + ", goods=" + goods + ", uid=" + uid + "]";
	};
	
}
