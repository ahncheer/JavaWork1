package com.mvn.junittest99;

import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.Collection;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

@RunWith(value = Parameterized.class)
public class AppTest3 {

	String expected;
	String value;
	
	@Parameters
	public static Collection<String[]> getTestParameters(){
		return Arrays.asList(new String[][] {
			{"01011112222", "010-1111-2222"},   // expected, value
			{"025864722", "02)586-4722"},
			{"20200707", "2020년 07월 07일"}
		});
	}
	
	public AppTest3(String expected, String value) {
		this.expected = expected;
		this.value = value;
	}
	
	// 실습3
	@Test
	public void test3() {
		App app = new App();
		assertEquals(expected, app.toNumber(value));
	}

}

