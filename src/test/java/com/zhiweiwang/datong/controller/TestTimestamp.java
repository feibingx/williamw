package com.zhiweiwang.datong.controller;

import java.security.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TestTimestamp {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//System.out.println(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		
		String str="test中文string哈哈哈a";
		
		System.out.println(str);
		System.out.println(str.substring(0, 2));
		System.out.println(str.substring(0, 3));
		System.out.println(str.substring(0, 4));
		System.out.println(str.substring(0, 5));
		System.out.println(str.substring(0, 6));
		System.out.println(str.substring(0, 7));
		
	}

}
