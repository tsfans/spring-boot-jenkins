package cn.hl.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author HULIN
 */
@RestController
public class IndexController {

	@RequestMapping(value="/hello",method=RequestMethod.GET)
	public String hello(String name) {
		return "hello,"+name+"!";
	}
	
	@RequestMapping(value="/say",method=RequestMethod.GET)
	public String say(String name) {
		return name+" say hello!";
	}
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index() {
		return "Index Page";
	}
}
