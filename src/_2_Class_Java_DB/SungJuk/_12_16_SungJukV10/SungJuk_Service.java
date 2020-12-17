package _2_Class_Java_DB.SungJuk._12_16_SungJukV10;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

class SungJuk_Service extends _SungJuk_GenericService {

   @Override
   public void displayMenu () {

      StringBuilder sb = new StringBuilder();
      sb.append("----------------------\n")
              .append(" 1. 학생 성적 입력\n")
              .append(" 2. 학생 성적 조회\n")
              .append(" 3. 학생 성적 상제 조회\n")
              .append(" 4. 학생 성적 수정\n")
              .append(" 5. 학생 정보 삭제\n")
              .append(" 0. 프로그램 종료\n")
              .append("----------------------\n")
              .append("원하시는 작업은 ? ");
      System.out.print(sb);
   }

   @Override
   public void readSungJuk () {

      Scanner scanner = new Scanner(System.in);

      String name;
      int kor, eng, mat;

      System.out.print("이름을 입력해 주세요 : ");
      name = scanner.nextLine();
      System.out.print("국어 점수를 입력해 주세요 : ");
      kor = scanner.nextInt();
      System.out.print("영어 점수를 입력해 주세요 : ");
      eng = scanner.nextInt();
      System.out.print("수학 점수를 입력해 주세요 : ");
      mat = scanner.nextInt();

      // 객체 단위로 저장
      SungJuk_VO person = new SungJuk_VO (name, kor, eng, mat);
      // 합계와, 평균 계산
      computeSungJuk(person);
      // DataBase 에 Upload 명령
      String result = SungJuk_DAO.insertSungJuk(person);
      // DataBase 처리 정보를 출력
      System.out.println(result);
   }

   public void computeSungJuk (SungJuk_VO person){

      person.setSum(person.getKor() + person.getEng() + person.getMat());
      person.setMean(person.getSum() / 3.0);

      switch ((int) person.getMean() / 10) {
         case 10:
         case 9: person.setGrd('수'); break;
         case 8: person.setGrd('우'); break;
         case 7: person.setGrd('미'); break;
         case 6: person.setGrd('양'); break;
         default: person.setGrd('가'); break;
      }
   }

   // 조회할 성적 데이터를 DAO 로 부터 넘겨받아 출력
   @Override
   public void showSungJuk () {

      String fmt = "번호 : %2d, 이름 : %s, 국어 : %d, 영어 : %d, 수학 : %d, 등록일 : %s\n";
      StringBuilder sb = new StringBuilder();

      ArrayList<SungJuk_VO> persons = SungJuk_DAO.selectSungjuk();
      for ( SungJuk_VO person : persons) {
         String result = String.format(fmt, person.getSjno(), person.getName(),
                 person.getKor(), person.getEng(), person.getMat(),
         person.getRegdate().substring(0,10));
         sb.append(result);
      }

      System.out.println(sb.toString());
   }

   @Override
   public void showAllSungJuk () {

      Scanner sc = new Scanner(System.in);
      System.out.print("상세 조회할 성적번호를 입력해 주세요 : ");
      String target = sc.nextLine();

      SungJuk_VO person = SungJuk_DAO.selecetOneSungJuk( target );
      String fmt = "번호 : %2d, 이름 : %s, 국어 : %d, 영어 : %d, 수학 : %d, " +
              "총점 : %d, 평균 : %.1f, 학점 : %s, 등록일 : %s\n";
      String result = String.format(fmt, person.getSjno(), person.getName(),
              person.getKor(), person.getEng(), person.getMat(), person.getSum(),
              person.getMean(), person.getGrd(), person.getRegdate());

      System.out.println(result);
   }

   @Override
   public void modifySungJuk () {

      Scanner sc = new Scanner (System.in);
      SungJuk_VO person = new SungJuk_VO();

      System.out.print("수정할 학생의 번호를 입력해 주세요 : ");
      person.setSjno( sc.nextInt() );

      System.out.print("국어 점수를 입력해 주세요 : ");
      person.setKor( sc.nextInt() );
      System.out.print("영어 점수를 입력해 주세요 : ");
      person.setEng( sc.nextInt() );
      System.out.print("수학 점수를 입력해 주세요 : ");
      person.setMat( sc.nextInt() );

      computeSungJuk(person);

      String result = SungJuk_DAO.updateSungJuk( person );
      System.out.println(result);
   }

   @Override
   public void removeSungJuk () {

      Scanner sc = new Scanner (System.in);

      System.out.print("삭제할 성적 번호를 입력해 주세요 : ");
      String target = sc.nextLine();

      String result = SungJuk_DAO.deleteSungJuk(target);
      System.out.println(result);


   }

}