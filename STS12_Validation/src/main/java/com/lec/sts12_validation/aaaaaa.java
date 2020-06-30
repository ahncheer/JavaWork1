//package com.lec.sts12_validation;
//
//import javax.validation.Valid;
//
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.lec.beans.WriteDTO;
//
//public class aaaaaa {
//
//}
//
//1. HttpServletRequest 객체 사용
//
//- url 뒤에 ? 를 붙히고 key=value 의 형태로 사용자가 url을 통해 서버에 넘겨줄 수 있다.
//	@RequestMapping(value = "/member/register")
//	public String doRegister(HttpServletRequest request, Model model) {
//		String id = request.getParameter("id");
//		model.addAttribute("id", id);
//		String pw = request.getParameter("pw");
//		model.addAttribute("pw", pw);
//		String name = request.getParameter("name");
//		model.addAttribute("name", name);
//		
//		return "/member/doRegister";
//	}
//
//
//
//
//
//2. @RequestParam("key")어노테이션 사용
//- @RequestParam 어노테이션은 사용자가 전달한 Parameter 값을 어노테이션 뒤에 나오는 변수에 자동으로 맵핑해주는 어노테이션이다.
//	@RequestMapping(value = "/member/register")
//	public String doRegister(
//			@RequestParam("id")String id, 
//			@RequestParam("pw")String pw,
//			@RequestParam("name")String name,
//			 Model model) {
//				model.addAttribute("id", id);
//				model.addAttribute("pw", pw);
//				model.addAttribute("name", name);
//		return "/member/doRegister";
//	}
//
//3. Command 객체 사용하기
//- 데이터가 너무 많은 경우 사용자가 전달하는 모든 값을 자동으로 Command 객체로 Mapping한다.
//	+) myMember에 id, pw, name 에 대한 getter&Setter 작성
//	
//	@RequestMapping(value = "/member/register")
//	public String register(myMember member) {
//		return "/member/register"
//	}
//
//
//
//4. 경로를 변수화한다. (@PathVariable)
//- url의 경로를 변수화 하여 사용한다. 
//@RequestMapping("/board/writePath/{id}/{pw}/{name}")
//public String writePathBoard(Model model,
//		@PathVariable String id, 
//		@PathVariable String pw, 
//		@PathVariable String name
//		) {
//	model.addAttribute("id", id);
//	model.addAttribute("pw", pw);
//	model.addAttribute("name", name);
//	
//	return "board/writePath";
//	
//}
//
//
