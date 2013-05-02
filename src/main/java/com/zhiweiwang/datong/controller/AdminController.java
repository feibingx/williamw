package com.zhiweiwang.datong.controller;
import com.zhiweiwang.datong.mapper.StudentMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import static com.zhiweiwang.datong.DTContants.QUERY_CONF;
import static com.zhiweiwang.datong.DTContants.DT_STUDENT_LIST;
import static com.zhiweiwang.datong.DTContants.LINES_PER_PAGE;
import static com.zhiweiwang.datong.DTContants.TOTAL_COUNT;
/**
 * Created with IntelliJ IDEA.
 * User: WilliamW
 * Date: 13-4-18
 * Time: 上午10:26
 * To change this template use File | Settings | File Templates.
 */
@Controller
@SessionAttributes(QUERY_CONF)
public class AdminController {
    

	private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private ReloadableResourceBundleMessageSource message;
    
	@RequestMapping(value = "/admin", method = GET)
	public /*List<?>*/ ModelAndView get(@RequestParam(required = false) String start,@RequestParam(required = false) String limit,@RequestParam(required = false) String sts,HttpSession session) {
		int intstart = 0, intlimit = LINES_PER_PAGE;
		Object conf = session.getAttribute(QUERY_CONF);
		logger.debug("sts {}", new Object[]{sts});
		if (limit == null || limit.length() < 1) {
			intlimit = LINES_PER_PAGE;
		} else {
			intlimit = Integer.parseInt(limit);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		logger.debug(map.toString());
		if(conf != null){
			map = (Map<String, Object>)conf;
			if(map.get("start")!=null)
				intstart = (Integer)map.get("start");
			if(map.get("limit")!=null)
				intlimit = (Integer)map.get("limit");

		}
		try{
		if (start != null)
			intstart = Integer.parseInt(start);
		}catch(NumberFormatException e){
			intstart = 0;
		}
		map.put("nextstart", intstart+intlimit);
		map.put("start", intstart);		

		if(intstart - intlimit >0){
			map.put("perviousstart", intstart - intlimit);
		}else{
			map.put("perviousstart", 0);
		}
		
		Object msts = map.get("sts");
		if(sts == null){
			if(msts != null )
				sts = msts.toString();
		}else if("clear".equals(sts)){
			sts = null;
			map = new HashMap<String, Object>();
		}else if(msts!=null && msts.equals(sts)==false){
			//状态变更 重置页数
			map = new HashMap<String, Object>();
		}
		
		List<Map<?, ?>> list = null;
		if(sts != null){
			logger.debug("sts {}", new Object[]{sts});
			list = studentMapper.getStudentsBySts(intstart, intlimit, sts);
			map.put("sts",sts);
		}else{
			list = studentMapper.getStudentsLimit(intstart, intlimit);
		}

		map.put("limit", intlimit);
		map.put("listsize", list.size());
		
		ModelAndView mav =  new ModelAndView("admin", DT_STUDENT_LIST, list);

		// 状态栏
		List<Map<String, ?>> totalcountlist = studentMapper.getCounting();
		Map<String, Object> cnts = new HashMap<String, Object>();
		for(Map m : totalcountlist){
			if(m.get("sts")!=null){
				cnts.put(m.get("sts").toString(), m.get("cnt"));
			}
		}
		mav.addObject(QUERY_CONF, map);
		mav.addObject(TOTAL_COUNT, cnts);
		session.setAttribute(QUERY_CONF, map);
		return mav;
    }
	
	@RequestMapping(value = "/counting", method = GET)
	public List<?> counting(){
		return studentMapper.getCounting();
	}
}
