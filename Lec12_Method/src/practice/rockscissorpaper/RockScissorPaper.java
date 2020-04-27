package practice.rockscissorpaper;

import java.util.Scanner;

/*
	 간단한 가위, 바위, 보 게임을 만듭니다.
	(실행화면은 다음 페이지에)
	
	showMenu / inputChoice / displayChoice
	/ computeResult  메소드들을 어떻게 
	구현해볼수 있을까요? 
	
	
	main() 메소드는 오른쪽과 같이 구성하고
	변경하지 않는 상태에서
	나머지 메소드들을 구현하여 완성해보세요
	
	필요하다면 클래스의 멤버변수등을 추가해도
	좋습니다
 */

// by 방석민
public class RockScissorPaper {

	// 멤버변수가 필요하면 작성하세요.
	static String[] RockScissorPaper = { "가위", "바위", "보" };

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		String[] RockScissorPaper = { "가위", "바위", "보" };
		while (true) {
			showMenu(); // 메뉴보여주기
			int userChoice = inputChoice(sc); // 사용자 입력
			if (userChoice == 0) {
				break; // 0 이면 종료
			}
			// 컴퓨터 선택: 1 - 가위, 2- 바위, 3 - 보
			int computerChoice = (int) Math.floor(Math.random() * 3) + 1;
			displayChoice(userChoice, computerChoice); // 양측의 선택 보여주기
			computeResult(userChoice, computerChoice); // 승부결과 보여주기
		}
		sc.close();
	} // end main()

	public static void showMenu() {
		System.out.println("가위 바위 보 게임");
		System.out.println("[1]가위");
		System.out.println("[2]바위");
		System.out.println("[3]보");
		System.out.println("[0]종료");
		System.out.println("-------");

	} // end showMenu()

	public static int inputChoice(Scanner sc) {
		int choice = 0;

		System.out.print("선택 :");

		choice = sc.nextInt();
		while (true) {
			
			if(choice<0 || choice>3) {
				System.out.println("다시입력하세요");
				choice = sc.nextInt();
			}else {
				break;
			}
		}
		return choice;
		
	} // end inputChoice()

	public static void displayChoice(int user, int com) {
		String userType = "";
		String comType = "";
		switch (user) {
		case 1:
			userType = RockScissorPaper[0].toString();
			break;
		case 2:
			userType = RockScissorPaper[1].toString();
			break;
		case 3:
			userType = RockScissorPaper[2].toString();
			break;

		default:
			break;
		}
		switch (com) {
		case 1:
			comType = RockScissorPaper[0].toString();
			break;
		case 2:
			comType = RockScissorPaper[1].toString();
			break;
		case 3:
			comType = RockScissorPaper[2].toString();
			break;

		default:
			break;
		}
		System.out.println("사용자 vs 컴퓨터");
		System.out.println(userType + " vs " + comType);
	} // end displayChoice()
	public static void computeResult(int user, int com) {

		if((user==1 && com==3) ||(user==2 && com==1) ||(user==3 && com==2)) {
			System.out.println("User Win!");
		}
		else if(user==com) {
			System.out.println("비겼습니다.");
		}
		else {
			System.out.println("Com Win!");
		}
	} // end computeResult()

} // end class

