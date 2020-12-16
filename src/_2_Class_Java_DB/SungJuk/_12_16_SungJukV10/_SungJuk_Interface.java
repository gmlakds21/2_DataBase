package _2_Class_Java_DB.SungJuk._12_16_SungJukV10;
// 매소드를 구현한 인터페이스 클래스
interface _SungJuk_Interface {

   void displayMenu();
   void readSungJuk();
   void showSungJuk();
   void showAllSungJuk();
   void modifySungJuk();
   void removeSungJuk();

}

/* 베이스 클래스에서 선언을 뺸 이유 인터페이스 단계에서 모두 선언해주면 한눈에 알아 볼 수 있어서 좋지만
 * 매소드의 정의는 매소드명, 리턴값, 매개변수이다. 즉 매개변수 까지 통일 시켜줘야 하는데
 * 만약 인터페이스에서도 선언하고 싶다면
 * void computeSungJuk ( SungJuk_VO person ) 이런식으로 미리 선언해야 했을 것이다.
 */