package com.zhiweiwang.datong.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
public class PureGetController {
    
//	private Logger logger = LoggerFactory.getLogger(this.getClass());
  
	@RequestMapping(value = "/index", method = GET)
	public void getIndex(){}
}
