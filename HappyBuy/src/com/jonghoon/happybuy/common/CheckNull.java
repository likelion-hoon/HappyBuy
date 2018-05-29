package com.jonghoon.happybuy.common;

public class CheckNull {
	public static String checkNull(String str) {
		if(str==null) {
			return ""; 
		} else {
			return str; 
		}
	}
}
