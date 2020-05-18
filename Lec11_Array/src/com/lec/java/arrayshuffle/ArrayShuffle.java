package com.lec.java.arrayshuffle;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

// 초간단 배열 섞기

// 이성준, 임상빈, 박빈나, 방석민, 김보겸, 정종훈, 윤지우, 정세헌, 
// 고유성, 홍성용, 이예지, 정인주, 김민호, 김우경, 김광진, 김재현, 
// 김성원, 장윤성, 한수빈, 조현주, 안성원, 이승환, 장수영, 이강혁, 
// 최현주, 신훈지, 윤종섭, 김진영, 남윤주, 김준영, 주낙경]

public class ArrayShuffle {
	public static void main(String[] args) {
		String [] arr = {"고유성",
				"김광진",
				"김민호",
				"김보겸",
				"김성원",
				"김우경",
				"김재현",
				"김준영",
				"김진영",
				"남윤주",
				"박빈나",
				"방석민",
				"신훈지",
				"안성원",
				"윤종섭",
				"윤지우",
				"이강혁",
				"이성준",
				"이승환",
				"이예지",
				"임상빈",
				"장수영",
				"장윤성",
				"정세헌",
				"정인주",
				"정종훈",
				"조현주",
				"주낙경",
				"최현주",
				"한수빈",
				"홍성용"};
		
		List<String> list = Arrays.asList(arr);  // 배열 --> List 로 변환
		Collections.shuffle(list);   // shuffle() 무작위로 섞기
		
		//int n = 4;
		//list = list.subList(0, n);   // 상위 n개만 뽑을 경우 (즉 무착위로 n개만 뽑는경우)
		
		//arr = (String[])list.toArray();  //  List --> 배열 로 변환
		System.out.println(Arrays.toString(list.toArray()));
	}
}
