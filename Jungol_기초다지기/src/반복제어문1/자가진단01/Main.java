package 반복제어문1.자가진단01;

//import java.util.Scanner;
//Scanner sc = new Scanner(System.in);
//sc.close();

public class Main {

    public static void main(String[] args) {
        java.util.Calendar cal = java.util.Calendar.getInstance();
        int a = 0; a = cal.get ( java.util.Calendar.YEAR )-1900; //---① 
        int x1 = a;
        a += cal.get ( java.util.Calendar.MONTH ); //---② 
		int x2 = a;
        a += cal.get ( java.util.Calendar.DATE ) ; 
		int x3 = a;
        System.out.printf("%d %d %d\n", x1, x2, x3); //---③ //① ② ③에서의 a값을 1, 2, 3자리에 각각 써 넣는다. 
    }
}










