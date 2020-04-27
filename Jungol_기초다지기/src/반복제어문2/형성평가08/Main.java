package 반복제어문2.형성평가08;

/* 137 : 반복제어문2 - 형성평가8
http://jungol.co.kr/bbs/board.php?bo_table=pbank&wr_id=37&sca=1070

행과 열의 수를 입력받아 다음과 같이 출력하는 프로그램을 작성하시오.

입력 예]
3 4
출력 예]
1 2 3 4
2 4 6 8
3 6 9 12
 */
import java.util.Scanner;
public class Main {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int row = sc.nextInt(); // 행 입력
		int col = sc.nextInt(); // 열 입력
		
		for(int i = 1; i <= row; i++) {
			for(int j = 0; j < col; j++) {
				System.out.print((i + i * j) + " ");
			}
			System.out.println();
		}
		
		
		sc.close();
	}// end main

}// end class
