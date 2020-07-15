package com.lec.sterre_test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/client/*")
public class ClientController {
	
	//@RequestMapping(value = "/all", method=RequestMethod.GET) 의 축약형	
	@GetMapping("clientIndex")
	public void doAll() {  // 리턴타입 없으면 url 과 같은 경로의 jsp 파일을 찾는다.--> /sample/all.jsp
		System.out.println("doClientIndex() : access everybody");
	}
	/*
	@GetMapping("/member")
	public void doMember() {
		System.out.println("doMember() : access member only");
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		System.out.println("doAdmin() : access admin only");
	}
	
	*/
	
}
















