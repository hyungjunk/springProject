package com.jun.util;

import java.util.UUID;

public class CommonsUtil {
	
    public static String getRandomString(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}