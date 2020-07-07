package com.mvn.junittest16;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.Collection;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

@RunWith(value = Parameterized.class)
public class AppTest3 {

	private String expected;
	private String valueOne;
	
	
	@Parameters
	public static Collection<String[]> getTestParameters(){
		return Arrays.asList(new String[][] {
			{"192091091901182", "as19j2je091j091j901182"}, // expected, valueOne, valueTwo
			{"01045372233", "010-4537-2233"},
			{"12345678", "	q1w2e3r4t5 #6&7*8"}
		});
	}
	
	public AppTest3(String expected, String valueOne) {
		super();
		this.expected = expected;
		this.valueOne = valueOne;
	}

	@Test
	public void test() {
		App app = new App();
		assertEquals(expected, app.toNumber(valueOne));
		System.out.println("테스트 통과: " + expected + ", " + valueOne);
	}	
	
	/*
	 //파라미터 미사용
	 
	private App app = new App();
	@Test
	public void test() {
		String test1 = "as19j2je091j091j901182";
		String test2 = "010-4537-2233";
		String test3 = "	q1w2e3r4t5 #6&7*8";
		
		app.toNumber(test1);
		app.toNumber(test2);
		app.toNumber(test3);
	}
	*/
	
}
