package com.zhiweiwang.datong.controller;

import java.util.regex.Pattern;

public class TestRegex {
	
	public static final String regex = "[^@/'\"#$%&^*]+{1,}";
	public static Pattern pattern = Pattern.compile(regex);
	
	public static void main(String[] args) {

		test("'");
		test("321");
		test("32cvxz`#cvzxcvxzwetdgdfgsdf1");
		test("as$df");
		test("zcvxcvxzcvxzc");
		test("v3'42a'sdfzxcvzxcv");
		test("dwf'dz");
		test("zxcvxz\\cvxzcvxzcvzxcv");
	}


	private static void test(String text) {
		System.out.print(text+" : ");
		System.out.println(testRegex(text));
	}


	public static boolean testRegex(String str) {
		return pattern.matcher(str).matches();
	}
}
