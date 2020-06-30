package com.lec.sts10_request.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * 클래스에 @RequestMapping 적용
 * 
 * base-package 이하에 새로운 패키지 작성하고 컨트롤러 클래스 만든 경우 서버를 '재시작' 하는 것이 좋다.
 */
@Controller
@RequestMapping("/main")
public class BoardController {
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	@RequestMapping("/contact")
	public String contact() {
		return "contact";
	}
	
	
	@RequestMapping("/board/write")
	public String writeBoard() {
		return "board/write_board";
	}
		
	@RequestMapping("/board/delete")
	public String deleteBoard() {
		return "board/delete_board";
	}
	
	@RequestMapping("/board/view") 
	public String viewBoard() {
		return "board/view_board";
	}
	
	@RequestMapping("/board/list") 
	public String listBoard() {
		return "board/list_board";
	}
	
	@RequestMapping("/board/update")
	public String updateBoard() {
		return "board/update_board";
	}
	
	@RequestMapping("/member/regist") 
	public String registMember() {
		return "member/regist";
	}
	
	@RequestMapping("/member/login") 
	public String loginMember() {
		return "member/login";
	}
	
	@RequestMapping("/member/info")
	public String infoMember() {
		return "member/info";
	}
	
	
	
	
	
	
} // end Controller
