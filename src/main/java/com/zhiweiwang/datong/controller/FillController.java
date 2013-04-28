package com.zhiweiwang.datong.controller;

import com.zhiweiwang.datong.DTContants;
import com.zhiweiwang.datong.DTMessage;
import com.zhiweiwang.datong.mapper.StudentMapper;
import com.zhiweiwang.datong.model.User;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

@Controller
@SessionAttributes(DTContants.USER_IN_SESSION)
public class FillController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	protected StudentMapper studentMapper;
	
	ObjectMapper objMapper = new ObjectMapper();
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/fillin", method = RequestMethod.POST)
	public ModelAndView fillin(HttpServletRequest request, @ModelAttribute(DTContants.USER_IN_SESSION) User user) {
		
		logger.info("user is:  {} ",user.getId());
		
		Map map = new HashMap(request.getParameterMap());
		Set<String> keys = map.keySet();
        for (Iterator it = keys.iterator(); it.hasNext();) {
            String key = (String) it.next();
            Object student = request.getParameter(key);           
            map.put(key, student.toString());
            logger.info("params:  {} - {}",new Object[]{key, student});
        }
        
      	makeMap2Json(map, HONOR_NAMES, "honors");
      	makeMap2Json(map, PRICE_NAMES, "prices");
        map.put(DTContants.DT_ID, user.getId());
        map.put(DTContants.DT_USERNAME, user.getUsername());
        
        Object imgpath = request.getSession().getAttribute(DTContants.IMG_PATH);
        if(imgpath != null){
        	map.put(DTContants.IMG_PATH, imgpath);
        }
        logger.info(map.toString());
        
        ModelAndView mav = new ModelAndView();
        
        Map<?, ?> student = studentMapper.getStudent(user.getId());
        if( student == null || student.size()<1){
        	studentMapper.insertRow(map);
        	mav.addObject(DTContants.MSG_ERRER, DTMessage.FILLIN_SUCCESS);
        }else{
        	studentMapper.update(map);
        	mav.addObject(DTContants.MSG_ERRER, DTMessage.FILLIN_UPATE_SUCCESS);
        }
		
		mav.setViewName("redirect:/message");
		return mav;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@ModelAttribute(DTContants.DT_STUDENT)
	@RequestMapping(value = "/fillin", method = GET)
	public Map<?,?> get(@ModelAttribute(DTContants.USER_IN_SESSION) User user) {
		logger.info("user:  {} ",user.getId());
		Map model = new HashMap();
        model.putAll(studentMapper.getStudent(user.getId()));
        
        makeJson2Map(model, "honors");
        makeJson2Map(model, "prices");
        return model;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void makeMap2Json(Map map, String[] names, String mapname) {
		
		if(map.get(names[0]+"0") == null){
			return;
		}
		
		// make list
		int num=0;
		Object key = "";
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		do{
			Map<String, Object> value = new HashMap<String, Object>();

			for(String name : names)
				value.put(name, map.get(name+num).toString());
			value.put("index", num);
			list.add(value);
			num++;
			key = map.get(names[0]+num);
		}while(key != null && key.toString().length()>0);
		
		// transform and put into map
		try {
			String string = objMapper.writeValueAsString(list);
			logger.debug(string);
			map.put(mapname, string);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}


	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void makeJson2Map(Map model, String name){
		if(model.get(name) == null )
			return;
		
		String text = model.get(name).toString();
		
		if(text.length()<1)
			return;
		
		try {
			List<HashMap<String,Object>> list = (List<HashMap<String,Object>>)objMapper.readValue(text, new TypeReference<List<HashMap<String,Object>>>() {});
			model.put(name+"list", list);
			if(list!=null && list.size()>0)
			model.put(name+"size", list.size());
			
			logger.debug("real model  {}",model);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	private static final String[] PRICE_NAMES = {"pname","plev","pcell","ptime"};
	private static final String[] HONOR_NAMES = {"hname","hlev"};
}
