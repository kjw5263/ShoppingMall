package com.member.action;

import java.util.Random;

public class RandNum {

	public static String rand() {

			Random rand  = new Random();
	        String numStr = "";
	        for(int i=0; i<4; i++) {
	            String ran = Integer.toString(rand.nextInt(10));
	            numStr += ran;
	            
	        }
            System.out.println(numStr);

	        return numStr;
	
	    }
	
	}