package cn.imethan.other;

import org.junit.Test;

import cn.imethan.common.encode.DigestUtils;
import cn.imethan.common.encode.EncryptUtils;


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
		String key = "12345678";
	    String MD5Password = EncryptUtils.Encrypt(key, "MD5");
	    System.out.println(MD5Password);
	    System.out.println(EncryptUtils.Encrypt(MD5Password, "SHA-1"));
	}
	
	
	
	/**
	 * 解密
	 */
	@Test
	public void decode(){
		String encode = "4e4755304e4456684e6d4d305a5451304e6a67325954526c4e4451314f544d7a4e546b7a4d6a51354d7a41305a5451334e4455334f54526c4e44633059545a684e546b7a4d6a52684e6a6b305a545a684e54457a4e5455354e324531595459354e47517a4d6a526b4e7a6b305a444d794e446b7a5a413d3d";
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
		String key= "jdbc:mysql://127.0.0.1:3307/imethan_blog?useUnicode=true&characterEncoding=utf-8";
//		String key= "46e48c467cb44a24bccbb649c6b3c23b";
//		String key= "123456";
		String encode = DigestUtils.encode(DigestUtils.encode(key));
		System.out.println(encode);
	}

	
	

}
