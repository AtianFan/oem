package com.cishi.util;

import java.beans.PropertyDescriptor;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.Date;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import com.cishi.beans.BaseEntity;

public class DataToClassUtil {

	public static Object getBeanData(String str) {
		return null;
	}

	public static Object toClassData(String requestList, Class clzz) {
		return DataToClassUtil.toClassData(parseRequestList(requestList), clzz);
	}

	public static void main(String[] args) {
//		Map<String,String> map = parseRequestList("{\"param\":\"1\"}");
//		System.out.println(map.get("param"));
		System.out.println(Boolean.valueOf(true+""));
	}
	public static Map<String, String> parseRequestList(String requestList) {
		Map<String, String> pMap = null;
		try {
			pMap = (Map<String, String>) JacksonUtil.jsonToBean(requestList, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pMap;
	}

	public static Object toClassData(Map<String, String> map, Class<?> clzz) {
		Field[] fields = clzz.getDeclaredFields();
		//针对类class 针对方法 针对变量 针对参数
		Resource resource = fields[0].getAnnotation(Resource.class);
		Set<String> set = map.keySet();
		Object object = null;
//		int.class;
		try {
			object = clzz.newInstance();
			for (Field field : fields) {
				String fieldName = field.getName(), value = map.get(fieldName);
				if (!set.contains(fieldName) || value == null) {
					continue;
				}
				PropertyDescriptor propertyDescriptor = new PropertyDescriptor(fieldName, clzz);
				Method method = propertyDescriptor.getWriteMethod();
				String type = field.getType().getName();
				Object obj = null;
				if (type.equals("java.lang.String")) {
					obj = (String)value;
				} else if (type.equals("java.util.Date")) {
					if(value==null){
						obj = new Date();
					}else{
						obj = new Date(Long.valueOf(value));
					}
				} else if (type.equals("java.lang.Integer")) {
					obj = Integer.valueOf(value);
				} else if(type.equals("java.lang.Double")){
					obj = Double.valueOf(value);
				} else if(type.equals("java.lang.Byte")){
					obj = Byte.valueOf(value);
				}else if(type.equals("java.lang.Boolean")){
					obj = Boolean.valueOf(value);
				}else if(type.equals(double.class)){
					obj = Double.valueOf(value);
				}
				method.invoke(object,  obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return object;
	}

//	public static void main(String[] args) {
//		Date date = new Date();
//		try {
//			Field field = BaseEntity.class.getField("test");
//			if (field == null) {
//				System.out.println("123");
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		Date date2 = new Date();
//		System.out.println(date2.getTime() - date.getTime());
//	}

}
