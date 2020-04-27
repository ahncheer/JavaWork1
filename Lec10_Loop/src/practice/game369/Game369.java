package practice.game369;

public class Game369 {
	
	// feat. 김보겸
	public static void main(String[] args) {
		System.out.println("369게임");
		int i;
		for (i = 1; i < 101; i++) {
			int x = i % 10;   // <-- 1의 자리
			int y = i / 10;  // <-- 10의 자리

			if ((x == 3 || x == 6 || x == 9) || (y == 3 || y == 6 || y == 9)) {
				System.out.print("*" + "\t");
			} else {
				System.out.print(i + "\t");
			}
			if (i % 10 == 0)

				System.out.println();

		}

	}
}
