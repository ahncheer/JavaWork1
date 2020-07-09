package 반복제어문1.자가진단02;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
    	Scanner sc = new Scanner(System.in);
    	int num1 = 1;
    	int num2 = sc.nextInt();
    	int result = 0;
    	
    	while(num1 <= num2) {
    		result += num1;
    		num1++;
    	}
    	System.out.println(result);
    }
}









