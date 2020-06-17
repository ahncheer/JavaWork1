package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.AjaxListCommand;
import com.command.CategoryListCommand;
import com.command.Command;


@WebServlet("*.ajax")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjaxController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		// 컨트롤러는 다음 두개를 선택해야 한다.
		Command command = null;   // 어떠한 커맨드? --> 어떠한 로직 수행.
		
		// URL로부터 URI, ContextPath, Command 분리 
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);
		
		
		//cate_list.ajax : 목록 요청
		switch(com) {
		case "/cate_list.ajax": 
			new CategoryListCommand().execute(request, response);
			new AjaxListCommand().execute(request, response);
			break;
		
		} // end switch
		
		
	}//end doAction();

}
