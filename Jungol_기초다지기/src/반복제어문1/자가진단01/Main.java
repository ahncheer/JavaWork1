package 반복제어문1.자가진단01;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
    	Scanner sc = new Scanner(System.in);
    	int num = sc.nextInt();

    	if(num == 2) {
    		System.out.println(28);
    	}else if((num == 1) || (num == 3) || (num == 5) || (num == 7) || (num == 8)
    			|| (num == 10) || (num == 12)) {
    		System.out.println(31);
    	}else {
    		System.out.println(30);
    	}
    	
    	sc.close();
    }
}









