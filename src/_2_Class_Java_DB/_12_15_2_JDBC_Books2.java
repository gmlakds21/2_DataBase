package _2_Class_Java_DB;
import java.sql.*;
import java.util.Scanner;
/*
 * Statement (정적 쿼리문) vs preparedStatement (동적 쿼리문)
 * 정적쿼리문은 사용하기전에 변수들을 이용해서
 * 온전한 형태의 문장을 미리 만들어둬야 함
 *
 * Statement -> 성능 저하
 * 1) 쿼리 문장 분석
 * 2) 컴파일
 * 3) 실행의 과정을 거쳐야 함
 *
 * PreparedStatement
 * 반면 동적 쿼리문은 불완전한 형태의 문장을 먼저 만들어두고
 * sql = "insert into Books value (?,?,?,?);
 * 실행전에 매개변수에 실제로 전달할 값을 지정할 수 있음
 * pstmt.set(   );
 * 또한, 캐쉬기능을 지원하기 때문에 반복적으로 실행하는 문장의 경우
 * 1), 2) 과정을 건너뛰고 3) 과정으로 바로 갈 수 있다.
 *
 * PreparedStatement 의 IN/OUT 매개변수
 * SQL 질의문 객체 생성시 사용하는 매개변수는 ? 로 표기
 * IN (placeholder) 매개변수는 질의문 생성시 입력값 대용으로 사용
 * OUT (binding) 매개변수는 질의문을 실행하고 넘겨주는 결과값을 받을 때 사용
 *
 * java : ?, ?
 * python : %s, %d;
 * c# : @name, @passwd
 * oracle : :1, :2
 */
public class _12_15_2_JDBC_Books2 {

    public static Connection makeconn() {

        String DRV = "org.mariadb.jdbc.Driver" ;
        String URL = "jdbc:mariadb://maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com:3306/playground5";
        String USR = "playground5";
        String PWD = "playground2020";

        Connection conn = null;

        try {
            Class.forName(DRV);
            conn = DriverManager.getConnection( URL, USR, PWD);
        } catch (ClassNotFoundException cnf) {
            System.out.println("JDBC 드라이버를 설치하세요");
        } catch (SQLException sqlex) {
            System.out.println("DB 접속 주소가 틀리거나, 아이디 비밀번호를 확인하세요");
        }

        return conn;
    }

    public static void destroyconn (PreparedStatement pstmt, Connection conn) {
        try {
            if (pstmt != null) { pstmt.close(); }
            if (conn != null) { conn.close(); }
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }

    public static void main(String[] args) {

        Connection conn = makeconn();

        Scanner sc = new Scanner(System.in);
        PreparedStatement pstmt = null;

        String sql = "insert into Books value (?,?,?,?)";

        System.out.print("Bookid : ");
        int bookid = sc.nextInt();
        String blank = sc.nextLine();
        System.out.print("Bookname : ");
        String bookname = sc.nextLine();
        System.out.printf("Publisher : ");
        String publisher = sc.nextLine();
        System.out.print("Price : ");
        int price = sc.nextInt();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bookid);
            pstmt.setString(2, bookname);
            pstmt.setString(3, publisher);
            pstmt.setInt(4, price);

            int cnt = pstmt.executeUpdate();
            if ( cnt > 0 ) System.out.println("도서 정보 추가 완료");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        destroyconn(pstmt,conn);
    }
}