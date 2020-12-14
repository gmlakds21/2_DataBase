package _2_Class_Java_DB;

import java.sql.*;

/*
 * playground 데이터베이스의 Books 테이블에
 * 새로운 도서정보를 입력하는 프로그램을 작성하세요
 * 컬럼 정보 : Bookid, bookname, publisher, price
 * 입력은 Scanner 이용
 *
 * 1. 도서정보 입력
 * 2. 입력받은 도서정보를 Books 테이블에 저장하는 SQL 문 작성
 */
import java.util.Scanner;
public class _12_14_4_JDBC_Books {
    public static void main(String[] args) {

// 데이터 값 입력 받기
        Scanner sc = new Scanner(System.in);
        System.out.print("Bookid : ");
        int bookid = sc.nextInt();
        String blank = sc.nextLine();
        System.out.print("Bookname : ");
        String bookname = sc.nextLine();
        System.out.printf("Publisher : ");
        String publisher = sc.nextLine();
        System.out.print("Price : ");
        int price = sc.nextInt();
    
// 입력 받은값 SQL 문으로 작성
        String sql = "insert into Books values("+bookid+",'"+bookname+"','"+publisher+"',"+price+" )";
        System.out.println(sql);

// 데이터 베이스에 접속
        String DRV = "org.mariadb.jdbc.Driver" ;
        String URL = "jdbc:mariadb://maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com:3306/playground5";
        String USR = "playground5";
        String PWD = "playground2020";

        try {
            Class.forName(DRV);
        } catch (ClassNotFoundException cnf) {
            System.out.println("JDBC 드라이버를 설치하세요");
        }

        Connection conn = null;
        try { conn = DriverManager.getConnection( URL, USR, PWD);
            if (!conn.isClosed())
                System.out.println("playground5 데이터 베이스 접속 성공");
        } catch (SQLException sqlex) {
            System.out.println("DB 접속 주소가 틀리거나, 아이디 비밀번호를 확인하세요");
        }
        
// SQL 문 실행하기
        Statement stmt = null;
        try {
            stmt = conn.createStatement();
            boolean isInsert = stmt.execute(sql);
            if (!isInsert) {
                System.out.println("데이터 추가 완료");
            }
        } catch (SQLException throwables) {
            System.out.println("SQL 실행 오류");
        }

// 닫기
        if (stmt != null) {
            try { stmt.close(); } catch (SQLException se) { }
        }
        if (conn != null) {
            try { conn.close(); } catch (SQLException se) { }
        }
    }
}