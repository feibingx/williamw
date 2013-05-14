package com.zhiweiwang.datong.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TimeTable {

	String title;
	List<Map<String, ?>> dtstudentlist;
	
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
	
	
}
