package com.lec.java.collection04;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class Collection04Main {

	public static void main(String[] args) {
		System.out.println("ArrayList 연습");

		// TODO
		// MemberModel 타입을 담는 ArrayList를 만드고
		// 사용자로부터 3개의 Student 데이터 을 입력받아서
		//        (id, passwd)
		// 3가지 방법으로 출력해보세요. 
		// for, Enhanced-for, Iterator
		ArrayList<MemberModel> list = new ArrayList<MemberModel>();
		
		Scanner sc = new Scanner(System.in);
		
		for(int i = 0; i < 3; i++) {
			System.out.print("id입력:");
			String id = sc.nextLine();
			System.out.print("pw입력:");
			String pw = sc.nextLine();
			
			MemberModel model = new MemberModel(id, pw);
			list.add(model);
		}
		
		sc.close();
		
		Iterator<MemberModel> itr = list.iterator();
		while(itr.hasNext()) {
			itr.next().displayInfo();
		}
		
		System.out.println("\n프로그램 종료");
	} // end main()

} // end class












