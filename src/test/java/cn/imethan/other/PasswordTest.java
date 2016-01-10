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
		String encode = "4e6a45325a4455794e6a6b314f5464684e7a41334e4459314e5467305a5463344e6a49304e445a6d4e7a5930597a64684e4455334f54526c4e7a6b7a4e4463334e474d32595451784e7a55305a4455304e6d59335954526b4e3245304d544d7a4e474d7a4d6a5a6a4e7a5131595455344e5449325a6a55354e54637a4e5459324e546b325a4463344e7a5931595464684d7a6b7a4d54597a4d7a49314e6a55324e6a49325a445a6a4e6d45324d6a4d794e544932597a55774e5467314d6a63354e6a51314e7a55314e6d51314f544d794e6a67324f44597a4e6d51304e6a5a684e6a51304e7a55324e7a6b314d6a55334d7a5532595459794d7a49314d6a63774e6a49325a44597a4d7a6b324e4455344e5449325a44526a4e5451324e7a4e6b";
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
		String key= "jdbc:mysql://127.0.0.1:3306/imethan_blog?useUnicode=true&characterEncoding=utf-8";
//		String key= "46e48c467cb44a24bccbb649c6b3c23b";
//		String key= "123456";
		String encode = DigestUtils.encode(DigestUtils.encode(key));
		System.out.println(encode);
	}

	
	

}
