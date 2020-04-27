package com.lec.java.lambda03;

/*
	 세가지 방법으로 자유자재로 구현할수 있어야 합니다.
	 방법 1) 클래스 implements 인터페이스 + 오버라이딩.
	 방법 2) 익명클래스
	 방법 3) 람다 표현식 lambda expression
*/
public class Lambda03Main {

	public static void main(String[] args) {
		System.out.println("익명 클래스, 람다 표현식 연습");
		
//		 방법 1) 클래스 implements 인터페이스 + 오버라이딩.
		// 덧셈연산
		Operable operator1 = new Adder();
		System.out.println(operator1.operate(10, 20));
		
//		 방법 2) 익명클래스
		// 뺄셈연산
		Operable operator2 = new Operable() {
			@Override
			public double operate(double x, double y) {
				return x - y;
			}
		};
		System.out.println(operator2.operate(10, 20));
		
//		 방법 3) 람다 표현식 lambda expression
		// 제곱연산
		Operable operator3 = (a, b) -> Math.pow(a, b);
		System.out.println(operator3.operate(3, 4));
		
		System.out.println("\n프로그램 종료");
	} // end main()
	
	public static class Adder implements Operable {
		@Override
		public double operate(double x, double y) {
			return x + y;
		}
		
	}
	
} // end class

interface Operable {
	public abstract double operate(double x, double y);
}














