package cn.imethan.other;

import org.apache.commons.lang3.SystemUtils;
import org.junit.Test;

import cn.imethan.common.encode.DigestUtils;

/**
 * OtherTest.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年12月27日下午3:56:19
 */
public class OtherTest {
	
	@Test
	public void test01(){
		String de = DigestUtils.decode("4e6a45325a4455794e6a6b314f5464684e7a41334e4459314e5467305a5463344e6a49304e445a6d4e7a5930597a64684e4455334f54526c4e7a6b7a4e4463334e474d32595451784e7a55305a4455304e6d59335954526b4e3245304d544d7a4e474d7a4d6a5a6a4e7a5131595455344e5449325a6a55354e54637a4e5459324e546b325a4463344e7a5931595464684d7a6b7a4d54597a4d7a49314e6a55324e6a49325a445a6a4e6d45324d6a4d794e544932597a55774e5467314d6a63354e6a51314e7a55314e6d51314f544d794e6a67324f44597a4e6d51304e6a5a684e6a51304e7a55324e7a6b314d6a55334d7a5532595459794d7a49314d6a63774e6a49325a44597a4d7a6b324e4455344e5449325a44526a4e5451324e7a4e6b");
		System.out.println(de);
		System.out.println(DigestUtils.decode(de));
		
//		boolean isWindows = SystemUtils.IS_OS_WINDOWS;
//		System.out.println("isWindows:"+isWindows);
		
	}

}
