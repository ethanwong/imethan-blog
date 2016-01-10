package cn.imethan.common.config;

import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

import org.apache.commons.lang3.SystemUtils;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.util.ObjectUtils;

import cn.imethan.common.encode.DigestUtils;

/**
 * DecryptPropertyPlaceholderConfigurer.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2016年1月5日上午9:13:03
 */
public class DecryptPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {

	private List<String> decodePropertyNames;

	public List<String> getDecodePropertyNames() {
		return decodePropertyNames;
	}

	public void setDecodePropertyNames(List<String> decodePropertyNames) {
		this.decodePropertyNames = decodePropertyNames;
	}

	@Override
	protected void convertProperties(Properties props) {
		Enumeration<?> propertyNames = props.propertyNames();
		while (propertyNames.hasMoreElements()) {
			String propertyName = (String) propertyNames.nextElement();
			String propertyValue = props.getProperty(propertyName);
			String convertedValue = null;
			if (this.decodePropertyNames != null && decodePropertyNames.size() > 0) {
				if (this.decodePropertyNames.contains(propertyName)) {
					//本机开发测试为windows，使用本机配置文件
					if(!SystemUtils.IS_OS_WINDOWS && !SystemUtils.IS_OS_MAC){
						propertyValue =  props.getProperty("bae."+propertyName);
					}
					convertedValue = DigestUtils.decode(DigestUtils.decode(propertyValue));
					
				} else {
					convertedValue = convertPropertyValue(propertyValue);
				}
			} else {
				convertedValue = convertPropertyValue(propertyValue);
			}
			if (!ObjectUtils.nullSafeEquals(propertyValue, convertedValue)) {
				props.setProperty(propertyName, convertedValue);
			}
		}
	}
}