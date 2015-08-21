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
		String encode = "4e6a45325a4455794e6a6b314f5464684e7a41334e4459314e5467305a5463344e6a49304e445a6d4e7a5930597a4d7a4e474532596a597a4d7a49334d4459344e4751314e44597a4d7a4d305a4451304e4449325954526b4e4451314e6a63784e4755304e7a526c4e6d51324d6a55304e6a637a4e44526a4e6d517a4d544d314e6a4d7a4d7a51324e7a4d30597a5a6c4e474532596a597a4e7a6b7a4e5459344e6a49304e7a5a6a4d7a55324e4455334d7a55325954597a4e7a6b7a4e545a684e6a497a4d6a4d774d7a59305a4464684e4751334e7a526c4e6a6b7a4f5463354e6a45314e4459344e7a41324d6a5a684e6a51334e54526b4d7a4d304e544d784e4755304e4455314d7a41305a545a6c4e54597a4d4455774d7a4d314e6a64684e5745314e6a55324e7a55324d5455334e4755334e6a56684e4463314e544d354e6a51304f4452684d7a45315954557a4e574532595459784e4463304e6a63354e546b314e7a526c4d7a4131595455344e4745304e6a59794e6d51305a5463324e5745304e7a5a6a4e7a5531595464684d7a457a4d5459304e4463314f5463304e4759304d544e6b4d32513d";
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
//		String key= "741ee2651ed1483f91697c8c35377a6e";
		String key= "46e48c467cb44a24bccbb649c6b3c23b";
		String encode = DigestUtils.encode(DigestUtils.encode(key));
		System.out.println(encode);
	}

	
	

}
