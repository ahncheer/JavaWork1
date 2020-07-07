package com.mvn.junittest99;

import java.util.Arrays;

/**
 * Hello world!
 *
 */
public class App 
{
	// 실습 1
    public void sortArr(int [] arr) {
    	Arrays.sort(arr);
    }
    
    // 실습 2
    public int max(int [] arr) {
    	int max = arr[0];
        for (int i = 1 ; i<arr.length; i++){
            if(max < arr[i]){
                max = arr[i];
            }
        }
    	return max;
    }
    
    public int min(int [] arr) {
    	int min = arr[0];
        for (int i = 1 ; i<arr.length; i++){
            if(min > arr[i]){
                min = arr[i];
            }
        }
    	return min;
    }
    
    // 실습3
    public String toNumber(String str) {
    	String result = str.replaceAll("[^0-9]", "");
    	return result;
    }
}















