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
		System.out.println(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
	}

}
