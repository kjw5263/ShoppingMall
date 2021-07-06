package com.test.sim;

import com.var.list.varlist;

public class testbox {
	public static void main() {
		String cat = "etude";
		varlist var = new varlist();
		for (int i = 0; i<var.getCat().length;i++){
			if(cat.equals(var.getCat()[i][0].split("=",2)[1])){
				cat = var.getCat()[i][1];
			}
		}
		System.out.println(cat);
	}
}
