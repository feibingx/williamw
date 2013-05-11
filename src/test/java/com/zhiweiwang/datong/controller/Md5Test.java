package com.zhiweiwang.datong.controller;


import org.junit.Test;

import com.zhiweiwang.datong.DTUtils;
import com.zhiweiwang.datong.SysConfContants;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

public class Md5Test {

	public static enum eSYSPHASE{
		applying,
		close}

	public void should_md5(){
		assertThat(eSYSPHASE.applying.toString(),is("applying"));
	}
	
	public static void main(String[] args){
		System.out.println("applying".equals(SysConfContants.eSYSPHASE.applying.toString()));
	}
}