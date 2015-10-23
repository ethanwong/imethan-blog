package cn.imethan.common.config;

import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.util.ObjectUtils;

import cn.imethan.common.encode.DigestUtils;
import cn.imethan.utils.Debug;

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
					convertedValue = DigestUtils.decode(DigestUtils.decode(propertyValue));
				} else {
					convertedValue = convertPropertyValue(propertyValue);
				}
//				Debug.println("convertedValue:"+convertedValue);
			} else {
				convertedValue = convertPropertyValue(propertyValue);
			}
			if (!ObjectUtils.nullSafeEquals(propertyValue, convertedValue)) {
				props.setProperty(propertyName, convertedValue);
			}
		}
	}
	
}
