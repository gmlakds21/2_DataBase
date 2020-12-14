package _2_Class_Java_DB;

import java.sql.*;
import java.util.Scanner;
/*
 * playground 데이터베이스의 BookMembers 테이블에
 * 새로운 도서정보를 입력하는 프로그램을 작성하세요
 * 컬럼 정보 : custid, name, address, phone
 * 입력은 Scanner 이용
 */
public class _12_14_5_JDBC_BookMembers {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        String DRV = "org.mariadb.jdbc.Driver" ;
        String URL = "jdbc:mariadb://maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com:3306/playground5";
        String USR = "playground5";
        String PWD = "playground2020";

        Connection conn = null;
        Statement stmt = null;
        String sql = null;

// 데이터 베이스 접속
        try {
            Class.forName(DRV);
        } catch (ClassNotFoundException e) {
            System.out.println("");
        }
        try {
            conn = DriverManager.getConnection(URL,USR,PWD);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

// 자료 입력하기
        System.out.print("custid : ");
        int custid = sc.nextInt();
        String blank = sc.nextLine();
        System.out.print("name : ");
        String name = sc.nextLine();
        System.out.print("address : ");
        String address = sc.nextLine();
        System.out.print("phone : ");
        String phone = sc.nextLine();

        sql = "insert into BookMembers value ("+custid+",'"+name+"','"+address+"','"+phone+"')";

// SQL 문 실행하고 닫기
        try {
            stmt = conn.createStatement();
            stmt.execute(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException throwables) {
            }
        }
        try {
            conn.close();
        } catch (SQLException throwables) {
        }

    }
}
