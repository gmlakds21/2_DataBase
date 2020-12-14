package _2_Class_Java_DB;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
/* 예외 처리 두가지
 * 검사형 예외 : checked exception
 * 명시적인 예외처리를 강제함, 예외발생 확인 시점은 컴파일시 임 ( 실행 전 )
 * IOException, ClassNotFoundException
 *
 * 비 검사형 예외 : unchecked exception
 * 명시적인 예외처리를 강제하지 않음, 예외발생 확인 시점은 실행시 임
 * ArithmeticException, ArrayIndexOutOfBoundsException, InputMismatchException
 *
 * ex) sungjuk.dat 파일을 읽어서 화면에 출력하세요
 */
public class _12_14_2_Exceptions2 {
    public static void main(String[] args) {

// 검사형 예외 처리
        // 예외 처리 전
        {
            String fath = "c:/JAVA/sungjuk.txt";
            // FileReader fr = new FileReader(fath);  -- 예외 발생, 실행도 할 수 없음
        }
        // 예외 처리 후
        {
            String fath = "c:/JAVA/sungjuk.txt";
            try {
                FileReader fr = new FileReader(fath);
                while(fr.ready()) {
                    System.out.print((char)fr.read());
                }
                fr.close();
            } catch (FileNotFoundException fnf) {
                System.out.println("파일을 찾기 못했습니다.");
            } catch (IOException ioe) {
                System.out.println("파일을 읽어 올 때 오류 발생!!");
            }
            /* catch ( 1번 Exception | 2번 Exception ex ) {
             * 구문
             * }
             * 이렇게 사용 할 수도 있다. 1번, 2번 오류에 대해 같은 구문을 사용할떄 이용
             */
        }
        System.out.println("\n");
/* JDK 7 이전의 버전
 * finally 블럭
 * 예외 발생 여부와 상관없이 무조건 실행되는 코드는
 * finally 절에 작성함
 */
        {
            String fath = "c:/JAVA/sungjuk.txt";
            FileReader fr = null;               // fr 과 br 을 try {} 뿐만 아니라
            BufferedReader br = null;           // finally 까지 보내기 위해 밖에서 선언
            try {
                fr = new FileReader(fath);
                br =  new BufferedReader(fr);
                while(br.ready()) {
                    System.out.println(br.readLine());
                }
                fr.close();
            } catch (FileNotFoundException fnf) {
                System.out.println("파일을 찾기 못했습니다.");
            } catch (IOException ioe) {
                System.out.println("파일을 읽어 올 때 오류 발생!!");
            } finally {
                /* 이렇게 힘들게 쓰는 이유
                 * 먼저 if 문을 사용해 null 인지 아닌지 검사를 한다음
                 * null 값이라면 닫도록 명령을 함
                 */
                if (br != null) {
                    try { br.close(); } catch (IOException e) { } }
                if (fr != null) {
                    try { fr.close(); } catch (IOException e) { } }
            }
        }
        System.out.println("\n");
/* JDK 7 이후의 버전
 * FileReader 와 BufferReader 를 try 안에 넣어둠
 * 데이터베이스를 이용하는 자바코드의 경우
 * 자원을 반납하는 코드가 반드시 작성되어야 하는데,
 * try ~ with ~ resource 구문을 사용하면
 * 명시적으로 자원 반납 코드를 작성하지 않아도 됨
 */
        {
            String fath = "c:/JAVA/sungjuk.txt";
            try( FileReader fr = new FileReader(fath);
                 BufferedReader br = new BufferedReader(fr);) {
                while(br.ready()) {
                    System.out.println(br.readLine());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
/* 예외 회피/양도/떠넘기기
 * 매서드 선언부에 throws 를 사용해서
 * 해당 매서드에서 발생한 예외를 미리 명시하고
 * 매서드를 호출한 사위 매서드에서 이걸을 처리하도록 할 수 있음
 * 이를 통해 각 하위 메서드에서 발생하는 예외들을 한곳에 모아서
 * 처리할 수 있음
 * 메서드 명 throws 예외 종류
 */
    }
}