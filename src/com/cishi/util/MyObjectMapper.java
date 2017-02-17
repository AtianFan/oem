package com.cishi.util;

import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.ResolvedType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.module.SimpleModule;

public class MyObjectMapper extends ObjectMapper {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public MyObjectMapper() {
		super();
		this.getSerializerProvider().setNullValueSerializer(new JsonSerializer<Object>() {
			
			@Override
			public void serialize(Object arg0, JsonGenerator arg1, SerializerProvider arg2)
					throws IOException, JsonProcessingException {
				arg1.writeString("");
			}
		});
		SimpleModule module = new SimpleModule();
        module.addSerializer(String.class, new JsonSerializer<String>() {
            @Override
            public void serialize(String value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
            	if(value.contains("{basePath}")){
            		value = value.replace("{basePath}", GlobalContextUtil.basePath);
            	}
            	jgen.writeString(value);
            }
        });
        this.registerModule(module);
	}
	@Override
	public ObjectWriter writerWithView(Class<?> serializationView) {
		return super.writerWithView(serializationView);
	}
	
	@Override
	public void writeValue(JsonGenerator g, Object value)
			throws IOException, JsonGenerationException, JsonMappingException {
		super.writeValue(g, value);
	}
}
