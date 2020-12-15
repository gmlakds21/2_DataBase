package _2_Class_Java_DB._12_16_SungJukV10;

abstract class _SungJuk_GenericService implements _SungJuk_Interface {

      @Override
      public void displayMenu() {

      }
      @Override
      public void readSungJuk() {

      }
      @Override
      public void showSungJuk() {

      }
      @Override
      public void showAllSungJuk() {

      }
      @Override
      public void modifySungJuk() {
      }
      @Override
      public void removeSungJuk() {
      }

}

/* 인터페이스를 바로 받지않고 중간단계를 걸쳐서 임시 처리 해줌
 * 이번 경우에는 모든 매소드를 손봐야 했지만, 만약에 베이스 클래스를
 * 상속받는 클래스가 여러개이고, 대동소이 하다면, 여기서 디폴트 매소드를 선언해줄 수 있다.
 */