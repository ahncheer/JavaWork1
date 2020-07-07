package com.mvn.junittest99;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.Arrays;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class AppTest 
{	
	
	private int [][] test = null;
	App app = null;
	// 저장경로
	static String path = System.getProperty("user.dir") + File.separator + "TEST";
	
	@Before
	public void preTest() {
		// 5개의 테스트 데이터
		test = new int[][] {
			{4, 1, 5, 7, -2},
    		{10, 5, 9, 7, 6},
    		{100, 600, 300, 200, 100},
    		{88, 55, 33, 22, 44},
    		{-4, -1, -5, -3, -1}
		};
		
		app = new App();
	}
	
	// 실습1
    @Test
    public void test1() {
    	
    	int [][] expected = {
        		{-2, 1, 4, 5, 7},
        		{5, 6, 7, 9, 10},
        		{100, 100, 200, 300, 600},
        		{22, 33, 44, 55, 88},
        		{-5, -4, -3, -1, -1}	
        };
    	
    	for(int i = 0; i < test.length; i++) {    		
    		app.sortArr(test[i]);

    		if(!Arrays.equals(test[i], expected[i])) 
    			fail();
    	}
    }
    
    // 실습2
    @Test
    public void test2() {
    	
    	int [][] expected = {
        		{-2, 7},
        		{5, 10},
        		{100, 600},
        		{22, 88},
        		{-5, -1}	
        };
    	
    	// 테스트
    	for(int i = 0; i < test.length; i++) {    		
    		assertEquals(expected[i][0], app.min(test[i]));
    		assertEquals(expected[i][1], app.max(test[i]));
    	}
    	
    	// 테스트 후 결과 파일 저장
    	try(
    		PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(new File(path, "report.txt"))));
    			){
        	for(int i = 0; i < test.length; i++) {    		
        		out.println(app.min(test[i]) + " " + app.max(test[i]));
        	}
    	} catch (Exception e) {
    		e.printStackTrace();
		}
    			
    }
    
    @BeforeClass
    public static void init() {
    	// 테스트 실행하기 전에 폴더 생성
    	File f = new File(path);
    	if(!f.exists()) {
    		if(f.mkdir()) {
    			System.out.println("폴더 생성");
    		}  
    	}
    }

}












