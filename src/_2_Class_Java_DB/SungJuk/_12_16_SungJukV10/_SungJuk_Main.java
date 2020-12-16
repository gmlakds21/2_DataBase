package _2_Class_Java_DB.SungJuk._12_16_SungJukV10;
import java.io.IOException;
import java.util.Scanner;
/* 파일명 : 성적 처리 프로그램 v10
 *
 * 성적처리 프로그램에 저장기능을 추가함
 * MariaDB 데이터베이스에 Sungjuk 테이블을 생성해서
 * 입력한 성적 데이터를 저장해 둠
 */
class _SungJuk_Main {
   public static void main(String[] args) throws IOException {

      Scanner sc = new Scanner (System.in);
      SungJuk_Service ser = new SungJuk_Service();

      String check = "";
      while ( !check.equals("0")) {
         ser.displayMenu();
         System.out.println();
         check = sc.nextLine();
         switch (check) {
            case "1" : ser.readSungJuk(); break;
            case "2" : ser.showSungJuk(); break;
            case "3" : ser.showAllSungJuk(); break;
            case "4" : ser.modifySungJuk(); break;
            case "5" : ser.removeSungJuk(); break;
            case "0" : System.out.println("프로그램을 종료합니다."); break;
            default :  System.out.println("번호를 다시 확인해주세요.");
         }
      }
   }
}