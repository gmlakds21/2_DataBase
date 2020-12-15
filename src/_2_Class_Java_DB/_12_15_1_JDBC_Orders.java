package _2_Class_Java_DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
/*
 * playground 데이터베이스의 BookOrders 테이블에
 * 새로운 주문정보를 입력하는 JDBC 프로그램을 장석하세요
 * 컬럼 정보 : orderid, custid, bookid, saleprice, orderdate
 * 입력은 Scanner 이용
 */
public class _12_15_1_JDBC_Orders {
    public static void main(String[] args) {

// 기초 설정
        Scanner sc = new Scanner (System.in);

        String DRV = "org.mariadb.jdbc.Driver" ;
        String URL = "jdbc:mariadb://maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com:3306/playground5";
        String USR = "playground5";
        String PWD = "playground2020";

        Connection conn = null;
        Statement stmt = null;
        String sql = null;

// 입력 정보값 받기
        System.out.print("orderid : ");
        int orderid = sc.nextInt();
        System.out.print("custid : ");
        int custid = sc.nextInt();
        System.out.print("bookid : ");
        int bookid = sc.nextInt();
        System.out.print("saleprice : ");
        int saleprice = sc.nextInt();
        String blank = sc.nextLine();
        System.out.print("orderdate : ");
        String orderdate = sc.nextLine();

        sql = "insert into BookOrders value ("+orderid+","+custid+","+bookid+","+saleprice+",'"+orderdate+"')";

// sql 문 실행하기
        try {
            Class.forName(DRV);
            conn = DriverManager.getConnection(URL, USR, PWD);
            stmt = conn.createStatement();
            int cnt = stmt.executeUpdate(sql);
            if ( cnt > 0 ) { System.out.println("입력 완료"); }
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버가 없어요!!");
        } catch (SQLException throwables) {
            System.out.println("JDBC 연결 실패!!");
        }

        try {
            if (stmt != null) { stmt.close(); }
            if (conn != null) { conn.close(); }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}