package com.zhiweiwang.datong;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

public class DTUtils {

	public static final String regex = "[^@/'\"?#$%&^*]+{1,}";
	public static Pattern pattern = Pattern.compile(regex);

	public static boolean regexMatches(String str) {
		return pattern.matcher(str).matches();
	}

	public static String md5s(String plainText) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(plainText.getBytes());
			byte b[] = md.digest();

			int i;

			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			return buf.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static void makeJson2Map(Map model, String name) {

		ObjectMapper objMapper = new ObjectMapper();
		if (model.get(name) == null)
			return;

		String text = model.get(name).toString();

		if (text.length() < 1)
			return;

		try {
			List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) objMapper.readValue(text,
					new TypeReference<List<HashMap<String, Object>>>() {
					});
			model.put(name + "list", list);
			if (list != null && list.size() > 0)
				model.put(name + "size", list.size());

		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static void makeMap2Json(Map map, String[] names, String mapname) {

		if (map.get(names[0] + "0") == null) {
			return;
		}
		ObjectMapper objMapper = new ObjectMapper();
		// make list
		int num = 0;
		Object key = "";
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		do {
			Map<String, Object> value = new HashMap<String, Object>();

			for (String name : names)
				value.put(name, map.get(name + num).toString());
			value.put("index", num);
			list.add(value);
			num++;
			key = map.get(names[0] + num);
		} while (key != null && key.toString().length() > 0);

		// transform and put into map
		try {
			String string = objMapper.writeValueAsString(list);
			map.put(mapname, string);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
