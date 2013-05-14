package com.zhiweiwang.datong.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TimeTable {

	String title;
	List<Map<String, ?>> dtstudentlist;
	String number;
	int cnt;
	
	public TimeTable(){
		dtstudentlist = new ArrayList<Map<String, ?>>();
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<Map<String, ?>> getDtstudentlist() {
		return dtstudentlist;
	}
	public void setDtstudentlist(List<Map<String, ?>> dtstudentlist) {
		this.dtstudentlist = dtstudentlist;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String string) {
		this.number = string;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
