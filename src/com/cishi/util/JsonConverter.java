package com.cishi.util;

import java.io.IOException;

import org.springframework.http.HttpInputMessage;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;

public class JsonConverter extends MappingJackson2HttpMessageConverter {

	@Override
	protected Object readInternal(Class<? extends Object> class1, HttpInputMessage httpinputmessage)
			throws IOException, HttpMessageNotReadableException {
//		ObjectMapper
		return null;
	}

}
