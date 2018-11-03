package com.abc.model;

import java.io.Serializable;

public class Poster implements Serializable {
	private int seq;
	private String file;
	private String name;
	private int rank;
	private int ani;
	private int up;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getAni() {
		return ani;
	}
	public void setAni(int ani) {
		this.ani = ani;
	}
	public int getUp() {
		return up;
	}
	public void setUp(int up) {
		this.up = up;
	}
}
