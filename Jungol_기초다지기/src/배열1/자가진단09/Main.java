package 배열1.자가진단09;

import java.util.Scanner;

/*
563 : 배열1 - 자가진단9 
http://www.jungol.co.kr/bbs/board.php?bo_table=pbank&wr_id=200&sca=1090

[문제]
10개의 정수를 입력받아 배열에 저장한 후 내림차순으로 정렬하여 출력하시오.

[입력예]
95 100 88 65 76 89 58 93 77 99

[출력예]
100 99 95 93 89 88 77 76 65 58
*/
public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int[] array = new int[10];
		for (int i = 0; i < array.length; i++) {
			array[i] = sc.nextInt();
		}
		sc.close();

		// 배열 정렬하기
		// bubble sort
		
		// cycle
		for(int i = array.length; i > 0; i--) {
			// 비교
			for(int j = 0; j < i - 1; j++) {
				if(array[j] < array[j + 1]) {
					int temp = array[j];
					array[j] = array[j + 1];
					array[j + 1] = temp;
				}
			}
		}
		
		for (int i = 0; i < array.length; i++) {
			System.out.print(array[i] + " ");
		} // end for

		System.out.println();

	}
}
