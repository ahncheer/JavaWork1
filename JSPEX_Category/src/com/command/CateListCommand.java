package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lec.beans.CategoryDAO;
import com.lec.beans.CategoryDTO;

public class CateListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		

		CategoryDAO dao = new CategoryDAO();  // DAO 객체 생성
		CategoryDTO [] arr = null;  
		
		try {
			// 트랜잭션 수행
			arr = dao.select();
			
			// "list" 란 name 으로 request 에 arr 값 전달
			// 즉 request 에 담아서 컨트롤러에 전달되는 셈.
			request.setAttribute("list", arr);
			
		} catch(SQLException e) {
			// 만약 CP 사용한다면
			// NamingException 도 처리 해야 함.
			
			e.printStackTrace();
		}
	}
		
		
		
		
		
		

	}

}
