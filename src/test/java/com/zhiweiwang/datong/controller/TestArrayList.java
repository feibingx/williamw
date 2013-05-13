package com.zhiweiwang.datong.controller;

import java.security.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class TestArrayList {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ArrayList<Integer> cnts = new ArrayList<Integer>(10);
		
		for(int i=1; i<9; i++){
			cnts.set(i, i*3);
		}
		
		
		System.out.println(cnts);
	}

}
