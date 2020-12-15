package _2_Class_Java_DB._12_16_SungJukV10;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

class SungJuk_Service extends _SungJuk_GenericService {

   // 멤버변수 선언
   ArrayList<SungJuk_VO> VOdata = new ArrayList<>();     // 실질 객체들이 저장되는 데이터 창
   SungJuk_VO person = new SungJuk_VO();                 // 그때 그때 사용되는 객체

   private String fpath = "c:/java/sungjuk.txt";         // 데이터 베이스를 저장할 공간
   private FileReader fr;
   private FileWriter fw;
   private BufferedReader br;
   private BufferedWriter bw;

   /**
    * readSungJuk
    * 파일에 저장된 모든 성적 데이터를
    * List 타입의 VOdata 에 저장
    */
   protected void readSungJukDat ( )  throws IOException {

      fr = new FileReader( fpath );
      br = new BufferedReader( fr );

      while ( br.ready() ) {
         String[] personData = br.readLine().split(", ");
         // String line = br.readLine();
         // String[] person = line.split(", "); 과 동일한 말
         person = new SungJuk_VO(personData[0], Integer.parseInt(personData[1]), Integer.parseInt(personData[2]), Integer.parseInt(personData[3]), Integer.parseInt(personData[4]),  Double.parseDouble(personData[5]), personData[6].charAt(0));
         VOdata.add(person);
      }
      br.close();
      fr.close();
   }

   /**
    * 프로그램 종료시
    * VOdata 에 저장된 모든 데이터를
    * sungjuk.txt 파일에 저장함
    */
   protected void writeSungJukDat ( ) throws IOException {

      String fmt = "%s, %s, %s, %s, %s, %.1f, %s";
      fw = new FileWriter( fpath );
      bw = new BufferedWriter( fw );

      Iterator<SungJuk_VO> person = VOdata.iterator();
      while ( person.hasNext() ) {
         String data = String.format(fmt, person.next().getName(), person.next().getKor(), person.next().getEng(), person.next().getMat(), person.next().getSum(), person.next().getMean(), person.next().getGrd());
         bw.write(data);
         bw.newLine();  // 입력후 줄바꾸기 println 또는 \n과 같은 의미
      }
      bw.close();
      fw.close();
   }


// 이 밑으로는 V8 버전에서 짰던 프로그램
// 자료가 영구적으로 저장되도록 만듬


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
      int kor;
      int eng;
      int mat;

      System.out.print("이름을 입력해 주세요 : ");
      name = scanner.nextLine();
      System.out.print("국어 점수를 입력해 주세요 : ");
      kor = scanner.nextInt();
      System.out.print("영어 점수를 입력해 주세요 : ");
      eng = scanner.nextInt();
      System.out.print("수학 점수를 입력해 주세요 : ");
      mat = scanner.nextInt();
      System.out.println();

      // person 라는 임시 객체를 만들어서 값을 입력받음
      // 다시 readSungJuk 을 수행해 person 라는 객체를 새로 생성할때
      // 동일 명으로 오류가 생기지 않는 이유는  { } 를 나가 사라지기 때문
      person = new SungJuk_VO(name, kor, eng, mat);
      // person 객체의 평균, 학점까지 계산함
      computeSungJuk(person);
      // person 객체의 정보들을 VOdata 에 추가함
      VOdata.add(person);

   }

   public void computeSungJuk (SungJuk_VO sj){

      sj.setSum(sj.getKor() + sj.getEng() + sj.getMat());
      sj.setMean(sj.getSum() / 3.0);

      switch ((int) sj.getMean() / 10) {
         case 10:
         case 9:
            sj.setGrd('수');
            break;
         case 8:
            sj.setGrd('우');
            break;
         case 7:
            sj.setGrd('미');
            break;
         case 6:
            sj.setGrd('양');
            break;
         default:
            sj.setGrd('가');
            break;
      }
   }

   @Override
   public void showSungJuk () {

      String fmt = "이름 : %s, 국어 : %d, 영어 : %d, 수학 : %d\n";
      //동적 배열에 저장된 데이터들을 출력하기 위해
      // 각 요소를 순회할 수 있도록 Iterator 선언
      Iterator<SungJuk_VO> iter = VOdata.iterator();
      while (iter.hasNext()) {
         person = iter.next();

         System.out.printf(fmt, person.getName(), person.getKor(), person.getEng(), person.getMat());
      }
      // SungJuk_VO person = new SungJuk_VO ();
      // 를 하지 않았는데 person 이 살아있는 이유는 뭘까 { } 를 빠져 나왔는데
      // SungJuk_VO person = new SungJuk_VO ();
      // person = iter.next(); 와 같은 의미이다.
   }

   @Override
   public void showAllSungJuk () {

      Scanner sc = new Scanner(System.in);
      String fmt = "이름 : %s, 국어 : %d, 영어 : %d, 수학 : %d, 총점 : %d, 평균 : %.1f, 학점 : %c\n";

      System.out.print("상세 조회할 학생이름을 입력해 주세요 : ");
      String target = sc.nextLine();

      // 이터레이터를 이용 한 방법
      Iterator<SungJuk_VO> iter = VOdata.iterator();
      while (iter.hasNext()) {
         person = iter.next();
         if (person.getName().equals(target))
            System.out.printf(fmt, person.getName(), person.getKor(), person.getEng(), person.getMat(), person.getSum(), person.getMean(), person.getGrd());
      }

      // 포이치문을 이용한 방법
      for ( SungJuk_VO person : VOdata ) {
         if (person.getName().equals(target))
            System.out.printf(fmt, person.getName(), person.getKor(), person.getEng(), person.getMat(), person.getSum(), person.getMean(), person.getGrd());
      }
   }

   @Override
   public void modifySungJuk () {
      super.modifySungJuk();
   }

   @Override
   public void removeSungJuk () {
      super.removeSungJuk();
   }

}