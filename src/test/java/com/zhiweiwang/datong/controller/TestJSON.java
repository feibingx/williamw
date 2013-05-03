package com.zhiweiwang.datong.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

public class TestJSON {

	/**
	 * @param args
	 */
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		String text = "[{\"hname0\":\"123123123\",\"hlev0\":\"区级\"}]";
		ObjectMapper objMapper = new ObjectMapper();
		try {
			List<?> obj = (List<?>)objMapper.readValue(text, new TypeReference<List<HashMap<String,Object>>>() {});
			
			for(Object o: obj){
				Map<String, ?> map = (Map<String, ?>)o;
				Set<String> keys = map.keySet();
		        for (Iterator<String> it = keys.iterator(); it.hasNext();) {
		            String key = (String) it.next();
		            Object student = map.get(key); 
		            System.out.println(key + " - " + student);
		        }
			}
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
