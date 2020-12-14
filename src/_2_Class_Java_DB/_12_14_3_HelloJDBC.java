package _2_Class_Java_DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/* JDBC
 * Java DataBase Connectivity
 * 자바를 통해 다양한 관계형 데이터베이스에 접속하고
 * SQL 문을 실행해서 관리하고자 할때 사용하는
 * 표준 SQL 인터페이스
 *
 * 이것을 통해 데이터베이스 코드를 한번만 작성해두면
 * 어떤 DBMS 라도 코드변경없이 동일하게 작동시킬 수 있음
 *
 * JDK 에 포함된 JDBC 인터페이스는 java.sql 패키지 아래에 있음
 *
 * 하지만, 이것만으로는 작동하지 않고 JDBC 인터페이스에 맞기
 * 각 데이터베이스 제조사가 구현한 JDBC 클래스들이 필요한데,
 * 이것을 JDBC 드라이버라고 함
 *
 * JDBC 드라이버들은 제조사 홈페이지에서 내려받을 수 있음
 *
 * mariadb.org => Download MariaDB Connector/J
 * 다운받아 C 드라이브에 Java 폴더에 넣어둠
 */
public class _12_14_3_HelloJDBC {
    public static void main(String[] args) {

/* JDBC 연결
 * File - Project Structure - Libraries
 * + 눌러서 java 선택, 경로를 찾아서 추가한 jar 파일 선택, 확인
 * 왼쪽에 프로젝트 창 밑에 External Libraries 안에 들어가면 완료
 */
        // 1. JDBC 드라이버를 메모리에 적재함
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            // Class.forName("org.mariadb.jdbc.Driver") 작성하고 try - catch 처리
        } catch (ClassNotFoundException cnf) {
            System.out.println("JDBC 드라이버를 설치하세요");
        }

        // 2. 데이터베이스 서버에 접속하기

           // playground 4_2 옛날 방식으로 접속
            Connection conB = null;
            String url4_2 = "jdbc:mariadb://"
                    +"maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com"
                    +":3306/playground4_2";
            try {
                conB = DriverManager.getConnection(
                        url4_2,
                        "playground4_2",
                        "playground2020");
                // Connection conn = DriverManager.getConnection("","","") 작성하고 try - catch 처리
                if (!conB.isClosed())
                    System.out.println("playground4_2 데이터 베이스 접속 성공");
            } catch (SQLException sqlex) {
                System.out.println("DB 접속 주소가 틀리거나, 아이디 비밀번호를 확인하세요");
            } finally {
                if (conB != null) { try { conB.close(); } catch (SQLException sqlex) { }
                }
            }


            // playground 5 접속
            String url5 = "jdbc:mariadb://"
                    +"maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com"
                    +":3306/playground5";
            try ( Connection conA = DriverManager.getConnection(
                    url5,
                    "playground5",
                    "playground2020")) {
                if (!conA.isClosed())
                    System.out.println("playground5 데이터 베이스 접속 성공");
            } catch (SQLException sqlex) {
                System.out.println("DB 접속 주소가 틀리거나, 아이디 비밀번호를 확인하세요");
            }


            // playground 6 접속
            String url6 = "jdbc:mariadb://"
                    +"maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com"
                    +":3306/playground6";
            try ( Connection conC = DriverManager.getConnection(
                    url6,
                    "playground6",
                    "playground2020")) {
                if (!conC.isClosed())
                    System.out.println("playground6 데이터 베이스 접속 성공");
            } catch (SQLException sqlex) {
                System.out.println("DB 접속 주소가 틀리거나, 아이디 비밀번호를 확인하세요");
            }


            // playground 7 접속
            String url7 = "jdbc:mariadb://"
                    +"maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com"
                    +":3306/playground7";
            try ( Connection conD = DriverManager.getConnection(
                    url7,
                    "playground7",
                    "playground2020")) {
                if (!conD.isClosed())
                    System.out.println("playground7 데이터 베이스 접속 성공");
            } catch (SQLException sqlex) {
                System.out.println("DB 접속 주소가 틀리거나, 아이디 비밀번호를 확인하세요");
            }

        // 3.


    }
}
