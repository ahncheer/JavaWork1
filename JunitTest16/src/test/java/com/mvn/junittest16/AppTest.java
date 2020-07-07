package com.mvn.junittest16;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.junit.Before;
import org.junit.Test;



public class AppTest 
{
	private App app = new App();
	
	// 실습1
    @Test
    public void test1() {
    	System.out.println("test1() 테스트 ");
    	int [] testArr1 = {1, 6, 3, 9}; String resultArr1 = "[1, 3, 6, 9]";
    	int [] testArr2 = {0, 1, 3, 9};  String resultArr2 = "[0, 1, 3, 9]";
    	int [] testArr3 = {-4, 6, 22, 9};  String resultArr3 = "[-4, 6, 9, 22]";
    	int [] testArr4 = {4, 11, 3, 9};  String resultArr4 = "[3, 4, 9, 11]";
    	int [] testArr5 = {99, 6, 3, 999};  String resultArr5 = "[3, 6, 99, 999]";
    	
//    	System.out.println("app.sortArr(testArr1) : " + app.sortArr(testArr1));
    	
//    	assertEquals(resultArr1, app.sortArr(testArr1));
//    	assertEquals(resultArr2, app.sortArr(testArr2));
//    	assertEquals(resultArr3, app.sortArr(testArr3));
//    	assertEquals(resultArr4, app.sortArr(testArr4));
//    	assertEquals(resultArr5, app.sortArr(testArr5));

    	if(resultArr1.equals(app.sortArr(testArr1))) { System.out.println("1번째 배열 정렬 성공");}
    	if(resultArr2.equals(app.sortArr(testArr2))) { System.out.println("2번째 배열 정렬 성공");}
    	if(resultArr3.equals(app.sortArr(testArr3))) { System.out.println("3번째 배열 정렬 성공");}
    	if(resultArr4.equals(app.sortArr(testArr4))) { System.out.println("4번째 배열 정렬 성공");}
    	if(resultArr5.equals(app.sortArr(testArr5))) { System.out.println("5번째 배열 정렬 성공");}
    	System.out.println("-------------------");
    }
    
    
    // 실습2
    @Test
    public void test2() {
    	System.out.println("test2() 테스트 ");

    	//폴더 만들기
    	String path = "D:/JavaApp01/Dropbox/Java16/JavaWork/JunitTest16/TEST"; //폴더 경로
    	File Folder = new File(path);
    	if (!Folder.exists()) {
    		try{
    		    Folder.mkdir(); //폴더 생성
    		    System.out.println("폴더가 생성되었습니다.");
    	        } 
    	        catch(Exception e){
    		    e.getStackTrace();
    	        }        
             }else {
    		System.out.println("이미 폴더가 생성되어 있습니다.");
    	}
    	
    	int [] testArr1 = {1, 6, 3, 9};
    	int [] testArr2 = {0, 1, 3, 9, 99};
    	int [] testArr3 = {-4, 6, 22, 9};
    	
//    	assertEquals(1, app.min(testArr1)); assertEquals(9, app.max(testArr1));
//    	assertEquals(0, app.min(testArr2)); assertEquals(9, app.max(testArr2));
//    	assertEquals(-4, app.min(testArr3)); assertEquals(22, app.max(testArr3));
    	
    	if(1 == app.min(testArr1) && 9 == app.max(testArr1)
    			&& 0 == app.min(testArr2) && 99 == app.max(testArr2) 
    			&& -4 == app.min(testArr3) && 22 == app.max(testArr3)) {
    		System.out.println("3개의 테스트 데이터 최대값 최소값이 모두 맞음");
    		
    		//txt 파일 생성
    		String txt = 
    				"첫번째 테스트 데이터 -> 최소값 : " + app.min(testArr1) + ", 최대값 : " + app.max(testArr1) + "\n"
    						+ "두번째 테스트 데이터 -> 최소값 : " + app.min(testArr2) + ", 최대값 : " + app.max(testArr2) + "\n"
    						+ "세번째 테스트 데이터 -> 최소값 : " + app.min(testArr3) + ", 최대값 : " + app.max(testArr3) + "\n";
    		String fileName = path +"/report.txt" ;
    		try{
    			// 파일 객체 생성
    			File file = new File(fileName) ;
    			// true 지정시 파일의 기존 내용에 이어서 작성
    			FileWriter fw = new FileWriter(file, false) ;
    			// 파일안에 문자열 쓰기
    			fw.write(txt);
    			System.out.println("report.txt 작성 완료");
    			fw.flush();
    			// 객체 닫기
    			fw.close();
    		}catch(Exception e){
    			e.printStackTrace();
    		}
    		
    	}else {
    		System.out.println("3개의 테스트 데이터가 최대값 최소값중 하나라도 틀린것이 있음");
    	}
    	
    }
    
    
}