package com.the3.other;

import org.junit.Test;

import com.the3.base.encode.DigestUtils;
import com.the3.base.encode.EncryptUtils;


/**
 * PasswordTest.java
 * 注意这个类不能提交GitHub
 *
 * @author Ethan Wong
 * @time 2014年3月8日下午2:43:57
 */
public class PasswordTest {
	
	
	@Test
	public void t1(){
		String key = "";
		String encode = DigestUtils.encode(DigestUtils.encode(key));
		System.out.println(encode);
		String decode = DigestUtils.decode(DigestUtils.decode(encode));
		
		System.out.println(decode);
	}
	
	@Test
	public void t2(){
		String key = "";
	    String MD5Password = EncryptUtils.Encrypt(key, "MD5");
	    System.out.println(MD5Password);
	    System.out.println(EncryptUtils.Encrypt(MD5Password, "SHA-1"));
	}

}
