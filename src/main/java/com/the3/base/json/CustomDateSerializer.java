package com.the3.base.json;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;

/**
 * CustomDateSerializer.java
 * 自定义返回JSON 数据格中日期格式化处理
 *
 * @author Ethan Wong
 * @time 2014年12月9日下午11:03:10
 */
public class CustomDateSerializer extends JsonSerializer<Date> {

	@Override
	public void serialize(Date value, JsonGenerator jgen,
			SerializerProvider provider) throws IOException,
			JsonProcessingException {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		String formattedDate = formatter.format(value);
		jgen.writeString(formattedDate);

		
	}
	
	

}


