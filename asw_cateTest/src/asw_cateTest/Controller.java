package asw_cateTest;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.HashMap;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

public class Controller {
	/**
	* AJAX 동적 select box Controller
	*/
	public void selectAjax(HttpServletRequest req, HttpServletResponse res, String param) { 
	   try {
	   // 도 정보 받음
	   String province = param;
	 
	   // 알맞은 동적 select box info 생성
	   List<String> cityList = new ArrayList();
	 
	   if (province.equals("gyeonGi")) {
	      cityList.add("안양");
	      cityList.add("의정부");
	   } else if (province.equals("gangWon")) {
	      cityList.add("원주");
	      cityList.add("우리집");
	   }
	 
	   // jsonArray에 추가
	   JSONArray jsonArray = new JSONArray();
	   for (int i = 0; i < cityList.size(); i++) {
	      jsonArray.add(cityList.get(i));
	   }
	 
	   // jsonArray 넘김
	   PrintWriter pw = res.getWriter();
	   pw.print(jsonArray.toString());
	   pw.flush();
	   pw.close();
	 
	   } catch (Exception e) {
	       System.out.println("Controller error");
	   }
	}
}
