package _2_Class_Java_DB;
/* Exceptions
 * 예외(Exceptions)와 오류(Error)
 * 자바 프로그램 작성시 문법에 맞지 않게 코드를 작성하면
 * 컴파일 오류가 발생함
 * 또한, 코드가 제대로 작성되었다 하더라도 실행중에
 * 예상치 못한 상황으로 실헹 오류가 발생할 수 있음
 * 이처럼 프로그램 실행중에 예상치 못한 상황으로
 * 프로그램이 영향을 받는 것을 오류와 예외로 구분
 *
 * 일반적으로 오류(Error)는 시스템 단계에서 프로그램에
 * 심각한 문제를 야기해서 실행중인 프로그램을 강제 중단시킴
 * -> 네트워크 상 접속 오류, 메모리 부족
 * 이러한 오류는 개발자가 처리할 수 없음
 *
 * 반면 예외(Exceptions)는 오류와 마찬가지로 실행중인
 * 프로그램을 중단시키지만 발생할 수 있는 상황을 미리
 * 예측하여 코드를 통해 프로그램 실행 중단을 방지할 수 있다.
 */
import java.util.Scanner;
public class _12_14_1_Exceptions {
    public static void main(String[] args) {

// 예외 처리 전
        {
        // 예외 처리 전 1
            {
                System.out.println("프로그램 시작");
                int a = 20, b = 10;
                int c = a / b;
                System.out.println(c);
                System.out.println("프로그램 끝\n");
            }
        // 예외 처리 전 2
            {
                System.out.println("프로그램 시작");
                int a = 20, b = 0;
                // int c = a / b;            // 오류 발생! - 실행 중단! ( 0으로 나눔 )
                // System.out.println(c);
                System.out.println("프로그램 끝\n");
            }
        }
// 예외 처리 구문  ( try ~ catch ~ finally )
        {
        // 모든 상황에 적용 가능한 일반적 예외 처리
            {
                System.out.println("프로그램 시작");
                int a = 20, b = 0;
                int c = 0;
                    try {
                        c = a / b;                  // 오류 발생 예상 구역
                    } catch (Exception ex) {
                        // 예외 처리 핸들러
                        System.out.println("오류 발생! ( 0으로 나눔 )");
                        System.out.println(ex.getMessage());
                    }
                System.out.println(c);
                System.out.println("프로그램 끝\n");
            }
        // 상황에 따른 구체적 예외 처리
            {
                System.out.println("프로그램 시작");
                int a = 20, b = 0;
                int c = 0;
                    try {
                        c = a / b;
                    } catch (ArithmeticException ex) {
                        System.out.println("오류 발생!");
                        System.out.println(ex.getMessage());
                    }
                System.out.println(c);
                System.out.println("프로그램 끝\n");
            }
        }
// ex)
        /* 1 ~ 9 사이 정수만 입력받아 화면에 출력하는 코드를 작성 하세요
         * 단, 예외처리코드를 이용해서 문자를 입력했을 때에는
         * "1~9 사이 정수만 입력가능합니다" 라고 출력하세요
         */
        {
            Scanner sc = new Scanner (System.in);

            try {
                System.out.print("1~9 사이에 정수를 입력해 주세요 : ");
                int a = sc.nextInt();
                if (a<1 || a>9) {
                    a /= 0;
                }
                System.out.println(a);
            } catch (Exception ex) {
                System.out.println("1~9 사이 정수만 입력가능합니다");
            }
            System.out.println("정상 종로");
        }

        /* 학생 3명의 이름을 입력 받아 화면에 출력하는 코드를 작성하세요
         * 단, 배열과 예외처리를 이용해서 코드를 작성하세요
         */
        {
            Scanner sc = new Scanner (System.in);

            String[] names = new String[3];
            try {
                for (int i = 0; i < names.length; i++) {
                    System.out.print("이름을 입력해 주세요 : ");
                    names[i] = sc.nextLine();
                }
            } catch (ArrayIndexOutOfBoundsException ex) {
                System.out.println("배열의 크기를 초과했습니다.");
            }

            for ( int i = 0; i < names.length; i++ ) {
                System.out.println(names[i]);
            }
        }
    }
}