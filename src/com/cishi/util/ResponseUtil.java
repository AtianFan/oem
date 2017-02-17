package com.cishi.util;

import org.springframework.util.StringUtils;

import com.cishi.constant.ErrorCode;
import com.cishi.param.ResponseData;

public class ResponseUtil {

	public static  ResponseData parseResponseError(ResponseData responseData,ErrorCode errorCode){
		responseData.setRetcode(errorCode.getRetcode());
		responseData.setRetmsg(errorCode.getRetmsg());
		return responseData;
	}
	public  static ResponseData parseResponseError(ErrorCode errorCode){
		ResponseData responseData = new ResponseData();
		responseData.setRetcode(errorCode.getRetcode());
		responseData.setRetmsg(errorCode.getRetmsg());
		return responseData;
	}
	
	/**
	 * 参数cannot不能为空 false标识验证不通过，true表示验证通过
	 * @param fields
	 * @param responseData
	 * @return
	 */
	public static boolean paramsCanNotBeNull(String[] fields,ResponseData responseData){
		StringBuffer sb = new StringBuffer();
		for(String field:fields){
			if(StringUtils.isEmpty(field)){
				sb.append(field+" ");
			}
		}
		String sbstr = sb.toString();
		if(!StringUtils.isEmpty(sbstr)){
			String msg = ErrorCode.PARAMS_CAN_NOT_BE_NULL.getRetmsg().replaceAll("\\?",sbstr);
			ErrorCode.PARAMS_CAN_NOT_BE_NULL.setRetmsg(msg);
			responseData.parseErrorCode(ErrorCode.PARAMS_CAN_NOT_BE_NULL);
			return false;
		}
		return true;
	}
	
	public static boolean paramsCanNotBeNull(String[] fields,String[] fieldNames,ResponseData responseData){
		StringBuffer sb = new StringBuffer();
		for(int i=0,length=fields.length;i<length;i++){
			String field = fields[i];
			if(StringUtils.isEmpty(field)){
				sb.append(fieldNames[i]+" ");
			}
		}
		String sbstr = sb.toString();
		if(!StringUtils.isEmpty(sbstr)){
			String msg = ErrorCode.PARAMS_CAN_NOT_BE_NULL.getRetmsg().replaceAll("\\?",sbstr);
			ErrorCode.PARAMS_CAN_NOT_BE_NULL.setRetmsg(msg);
			responseData.parseErrorCode(ErrorCode.PARAMS_CAN_NOT_BE_NULL);
			return false;
		}
		return true;
	}
	
	public static boolean paramsShouldBeNumber(String[] fields,ResponseData responseData){
		
		return true;
	}
}
