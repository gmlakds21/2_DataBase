package _2_Class_Java_DB.SungJuk._12_17_Test_SamKwangFinal;
/*
 * 1. 제공된 CSV 파일로 테이블을 생성
 * 2. 제약조건 지정 (기본키, 외래키)
 * 3. 고객 - 주문 - 주문항목 - 제품을 join 해서 조회하는 기능 작성 (readCODP)
 * 4. 운송 - 주문 - 직원을 join 해서 조화하는 기능 작성 (readSOE)
 * 5. 그외 나머지 부분은 EmployeeV3 를 참고해서 작성함
 *
 * SamkwangFinal V1
 * 비지니스 관리 프로그램 진입점
 *
 * 여러개의 테이블을 join 시켜야해서 SQL 문이 길어질것같을때
 * view 를 만들면 좀더 쉽게 관리할 수 있다.
 */

import java.util.Scanner;

public class _Samkwang_Main {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        Samkwang_Service ser = new Samkwang_Service();

        String check = "";
        while (!check.equals("0")) {
            ser.displayMenu();
            check = sc.nextLine();
            System.out.println();

            switch (check) {
                case "1": ser.readCODP(); break;
                case "2": ser.readOneCODP(); break;
                case "3": ser.readSOE(); break;
                case "4": ser.readOneSOE(); break;
                case "0": System.out.println("프로그램을 종료합니다."); break;
                default: System.out.println("번호를 다시 확인해주세요."); break;
            }

        }
    }
}
