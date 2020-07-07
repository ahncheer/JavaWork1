package com.mvn.junittest16;

import java.util.Arrays;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
    }
    
    // 실습 1
    public String sortArr(int [] arr) {
    	Arrays.sort(arr);
    	String x = Arrays.toString(arr);
//    	System.out.println("App.java에서 sortArr 추출 : " + x);
    	System.out.println(x);
    	return x;
    }
    
//	public void sortArr(int [] arr) {
//    Arrays.sort(arr);
//    System.out.println("정렬 이후 -> " + Arrays.toString(arr));
//}
    
    
    
    // 실습 2
    public int max(int [] arr) {
    	int max = arr[0]; //최대값
    	for(int i=0;i<arr.length;i++) {
    	    if(max<arr[i]) {
    		max = arr[i];
    	    }
    	}
//    	System.out.println("App.java에서 최대값 추출 : " + max);
    	return max;
    }
    
    public int min(int [] arr) {
    	int min = arr[0]; //최소값
    	for(int i=0;i<arr.length;i++) {
    	    if(min>arr[i]) {
    		min = arr[i];
    	    }
    	}
//    	System.out.println("App.java에서 최소값 추출 : " + min);
    	return min;
    }
    
    // 실습3
    public String toNumber(String str) {
    	String result = str.replaceAll("[^0-9]", "");
//    	System.out.println("App.java에서 문자열에서 숫자만 추출 : " + result);
    	return result;
    }
    
    
}










