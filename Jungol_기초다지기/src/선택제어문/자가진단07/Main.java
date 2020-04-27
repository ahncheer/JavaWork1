package 선택제어문.자가진단07;

import java.util.Scanner;

/*
http://jungol.co.kr/bbs/board.php?bo_table=pbank&wr_id=171&sca=1050
534 : 선택제어문 - 자가진단7 

영문 대문자를 입력받아 
'A'이면 “Excellent”, 
'B'이면 “Good”, 
'C'이면 “Usually”, 
'D'이면 “Effort”, 
'F'이면 “Failure”, 
그 외 문자이면 “error” 라고 출력하는 프로그램을 작성하시오.

[입력예]
B

[출력예]
Good
 


 */
public class Main {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		char grade = sc.next().charAt(0);  // char 하나 입력
		
		switch(grade) {
		case 'A':
			System.out.println("Excellent");
			break;
		case 'B':
			System.out.println("Good");
			break;
		case 'C':
			System.out.println("Usually");
			break;
		case 'D':
			System.out.println("Effort");
			break;
		case 'F':
			System.out.println("Failure");
			break;
		default:
			System.out.println("error");
		} // end switch
		
		sc.close();
	} // end main

} // end class
