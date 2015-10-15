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
	
	
	
	/**
	 * 解密
	 */
	@Test
	public void decode(){
		String encode = "4e6a45325a4455794e6a6b314f5464684e7a41334e4459314e5467305a5463344e6a49304e445a6d4e7a5930597a4d7a4e4755334f4459794e4463314d5463314e5745304f4455324e6a67324d7a51344e4445334e5455354d7a497a4f5463304e475932595455784e7a63305a5455304e4445334e6a59304d7a45314d6a51344e54457a4d6a5a6a4e5455324e5455334e474532595459794e6d517a4f54557a4e6a51304e7a4d354e546b314d5455314e7a41324f54557a4e5463324d7a4a6d4e6a51314f44526c4e6d4d314e6a55334d7a55334d4455354d7a497a4f545a694e5745314e444d784d7a41324d7a5a6c4e545932597a52684e6d51305a545a6d4e546b314f4452684e6a67314f544d7a4e544932597a597a4e6d49314e6a63314e546b7a4d6a4d354e6d49324d5455334d7a55325a5455774e5467314e6a4d774e5745324f544d774d7a513d";
		System.out.println(encode);
		String decode = DigestUtils.decode(DigestUtils.decode(encode));
		System.out.println(decode);
	}
	
	/**
	 * 加密
	 */
	@Test
	public void encode(){
//		jdbc:mysql://sqld.duapp.com:4050/wTGCiTybcnoRtoXAJbIg?useUnicode=true&characterEncoding=utf-8
		
//		String key= "jdbc:mysql://sqld.duapp.com:4050/wTGCiTybcnoRtoXAJbIg?useUnicode=true&characterEncoding=utf-8";
//		String key= "jdbc:mysql://127.0.0.1:3306/imethan_blog?useUnicode=true&characterEncoding=utf-8";
		String key= "46e48c467cb44a24bccbb649c6b3c23b";
//		String key= "123456";
		String encode = DigestUtils.encode(DigestUtils.encode(key));
		System.out.println(encode);
	}

	
	

}
