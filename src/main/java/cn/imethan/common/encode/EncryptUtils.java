package cn.imethan.common.encode;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


/**
 * EncryptUtils.java 加密工具类
 *
 * @author Ethan Wong
 * @time 2014年3月8日下午2:43:57
 */
public class EncryptUtils {
	
	/**
	 * 对字符串加密,加密算法使用MD5,SHA-1,SHA-256,默认使用SHA-256
	 * @param strSrc 要加密的字符串
	 * @param encName 加密类型
	 * @return
	 */
	public static String Encrypt(String strSrc, String encName) {
		MessageDigest md = null;
		String strDes = null;

		byte[] bt = strSrc.getBytes();
		try {
			if (encName == null || encName.equals("")) {
				encName = "SHA-256";
			}
			md = MessageDigest.getInstance(encName);
			md.update(bt);
			strDes = bytes2Hex(md.digest()); // to HexString
		} catch (NoSuchAlgorithmException e) {
			return null;
		}
		return strDes;
	}
	
	
	public static String bytes2Hex(byte[] bts) {
		String des = "";
		String tmp = null;
		for (int i = 0; i < bts.length; i++) {
			tmp = (Integer.toHexString(bts[i] & 0xFF));
			if (tmp.length() == 1) {
				des += "0";
			}
			des += tmp;
		}
		return des;
	}
}
