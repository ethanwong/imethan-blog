package cn.imethan.entity.system;

/**
 * SettingCode.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年11月25日下午1:59:56
 */
public enum SettingCode {
	
	RESUME("简历配置"),
    OTHER("其他配置");
	
	private String context;

	private String getContext() {
		return this.context;
	}

	private SettingCode(String context) {
		this.context = context;
	}

}
