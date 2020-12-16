package _2_Class_Java_DB.SungJuk._12_16_Test_BusinessV3;

import java.io.IOException;
import java.util.Scanner;

/* 인사 관리 프로그램 v3
 * -------------------
 * 1. 인사 정보 입력
 * 2. 인사 정보 조회      (사번, 성, 이메일, 직책, 상사번호, 부서번호)
 * 3. 인사 정보 상세조회  (사번조회 -> 전부 다)
 * 4. 인사 정보 수정
 * 5. 인사 정보 삭제
 * 0. 프로그램 종료
 */
class _Employee_Main {

   public static void main ( String [] args ) {

      Scanner sc = new Scanner(System.in);
      Employee_Service ser = new Employee_Service();

      String check = "";
      while ( !check.equals("0")) {
         ser.displayMenu();
         check = sc.nextLine();
         System.out.println();

         switch (check) {
            case "1" : ser.readInfo(); break;
            case "2" : ser.showInfo(); break;
            case "3" : ser.showAllInfo(); break;
            case "4" : ser.modifyInfo(); break;
            case "5" : ser.removeInfo(); break;
            case "0" : System.out.println("프로그램을 종료합니다."); break;
            default : System.out.println("번호를 다시 확인해주세요."); break;
         }
      }
   }
}