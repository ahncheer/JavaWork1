package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CategoryDAO;
import com.lec.beans.CategoryDTO;


public class CategoryListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CategoryDAO dao = new CategoryDAO();  // DAO 객체 생성
		CategoryDTO [] arr = null;  
		
		// ajax response 에 필요한 값들
		StringBuffer message = new StringBuffer();
		String status = "FAIL";   // 기본 FAIL

		//관련 세팅값들
//		int parent=1;
//		int depth=Integer.parseInt(request.getParameter("depth"));
//		System.out.println(depth);
//		int parent=Integer.parseInt(request.getParameter("parent"));
//		String param;
		
		//parent
//		param = request.getParameter("parent");
//		if(param != null && param.trim().length() != 0) {
//			try {				
//				parent = Integer.parseInt(param);
//			} catch(NumberFormatException e) {
//				// 예외 처리 안함
//			}
//		}
		
		//depth
//		param = request.getParameter("depth");
//		if(param != null && param.trim().length() != 0) {
//			try {				
//				depth = Integer.parseInt(param);
//			} catch(NumberFormatException e) {
//				// 예외 처리 안함
//			}
//		}
//		
		String aa = request.getParameter("depth");
		System.out.println(aa);
		int depth = Integer.parseInt(request.getParameter("depth"));
		System.out.println("depth:" + depth);
//		int depth = 1;
		try {

			dao = new CategoryDAO();
			arr = dao.selectFrom2(depth);
			if(arr == null) {
				message.append("[리스트할 데이터가 없습니다]");
			} else {
				status = "OK";
			}
			
		} catch(SQLException e) {
			//e.printStackTrace();
			message.append("[트랜잭션 에러:" + e.getMessage()+ "]");
		} // end try
	
		request.setAttribute("status", status);
		request.setAttribute("message", message.toString());
		request.setAttribute("list", arr);

		
	}//end execute()

}//end Command
