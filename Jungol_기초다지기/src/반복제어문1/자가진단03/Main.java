package 반복제어문1.자가진단03;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
    	Scanner sc = new Scanner(System.in);
    	Main nn = new Main();
    	boolean x = true;
    	while(x == true) {
    		System.out.print("number? ");
    		int num = sc.nextInt();
    		nn.numpn(num);
    		
    		if(num == 0) {
    			x = false;
    		}
		}
    
    }
    
    public void numpn(int num) {
    	if(num < 0) {
    		System.out.println("negative number");
    	}else if(num > 0){
    		System.out.println("positive integer");
    	}
    }
}









