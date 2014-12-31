package com.the3.base.encode;

import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.SecureRandom;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.lang3.Validate;

import com.the3.utils.ExceptionUtils;

/**
 * DigestUtils.java 字符转码工具类
 *
 * @author Ethan Wong
 * @time 2014年3月8日下午2:43:57
 */
public class DigestUtils {
	
	private static final String SHA1 = "SHA-1";
	private static final String MD5 = "MD5";
	private static SecureRandom random = new SecureRandom();
	
	/**
	 * 编码.先进行base64转码， 再转换为16进制字符
	 * @param encode 要加密的字符串
	 * @return 双重加密后的字符串
	 */
	public static String encode(String encode) {
		encode = new String(EncodeUtils.encodeBase64(encode.getBytes()));
		encode = new String(Hex.encodeHex(encode.getBytes()));
		return encode;
	}

	/**
	 * 解码，先转换为16进制字符，再进行base64解码
	 * @param decode 要解密的字符串
	 * @return 双重解密后的字符串
	 */
	public static String decode(String decode) {
		try {
			decode = new String(Hex.decodeHex(decode.toCharArray()));
			decode = new String(EncodeUtils.decodeBase64String(decode));
		} catch (DecoderException e) {
			e.printStackTrace();
		}
		return decode;
	}
	
	/**
	 * 对输入字符串进行sha1散列.
	 */
	public static byte[] sha1(byte[] input) {
		return digest(input, SHA1, null, 1);
	}

	public static byte[] sha1(byte[] input, byte[] salt) {
		return digest(input, SHA1, salt, 1);
	}

	public static byte[] sha1(byte[] input, byte[] salt, int iterations) {
		return digest(input, SHA1, salt, iterations);
	}

	/**
	 * 对字符串进行散列, 支持md5与sha1算法.
	 */
	private static byte[] digest(byte[] input, String algorithm, byte[] salt, int iterations) {
		try {
			MessageDigest digest = MessageDigest.getInstance(algorithm);

			if (salt != null) {
				digest.update(salt);
			}

			byte[] result = digest.digest(input);

			for (int i = 1; i < iterations; i++) {
				digest.reset();
				result = digest.digest(result);
			}
			return result;
		} catch (GeneralSecurityException e) {
			throw ExceptionUtils.unchecked(e);
		}
	}

	/**
	 * 生成随机的Byte[]作为salt.
	 * 
	 * @param numBytes byte数组的大小
	 */
	public static byte[] generateSalt(int numBytes) {
		Validate.isTrue(numBytes > 0, "numBytes argument must be a positive integer (1 or larger)", numBytes);

		byte[] bytes = new byte[numBytes];
		random.nextBytes(bytes);
		return bytes;
	}

	/**
	 * 对文件进行md5散列.
	 */
	public static byte[] md5(InputStream input) throws IOException {
		return digest(input, MD5);
	}

	/**
	 * 对文件进行sha1散列.
	 */
	public static byte[] sha1(InputStream input) throws IOException {
		return digest(input, SHA1);
	}

	private static byte[] digest(InputStream input, String algorithm) throws IOException {
		try {
			MessageDigest messageDigest = MessageDigest.getInstance(algorithm);
			int bufferLength = 8 * 1024;
			byte[] buffer = new byte[bufferLength];
			int read = input.read(buffer, 0, bufferLength);

			while (read > -1) {
				messageDigest.update(buffer, 0, read);
				read = input.read(buffer, 0, bufferLength);
			}

			return messageDigest.digest();
		} catch (GeneralSecurityException e) {
			throw ExceptionUtils.unchecked(e);
		}
	}
}
