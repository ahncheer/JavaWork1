package 선택제어문.자가진단01;

import java.util.Scanner;

/*
http://jungol.co.kr/bbs/board.php?bo_table=pbank&wr_id=165&sca=1050
528 : 선택제어문 - 자가진단1 

정수를 입력받아 첫 줄에 입력 받은 숫자를 출력하고 둘째 줄에 음수이면 “minus” 라고 출력하는 프로그램을 작성하시오.

[입력예]
-5
[출력예]
-5
minus
 
 
[입력예]
5
[출력예]
5
 */
public class Main {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		int n = sc.nextInt();
		
		System.out.println(n);

		// 음수이면 "minus" 출력
		if(n < 0)
			System.out.println("minus");
		
		sc.close();
	} // end main

} // end class
