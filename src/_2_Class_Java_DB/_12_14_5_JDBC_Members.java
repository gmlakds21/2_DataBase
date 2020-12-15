package _2_Class_Java_DB;
import java.sql.*;
import java.util.Scanner;
/*
 * playground 데이터베이스의 BookMembers 테이블에
 * 새로운 도서정보를 입력하는 프로그램을 작성하세요
 * 컬럼 정보 : custid, name, address, phone
 * 입력은 Scanner 이용
 */
public class _12_14_5_JDBC_Members {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        String DRV = "org.mariadb.jdbc.Driver" ;
        String URL = "jdbc:mariadb://maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com:3306/playground5";
        String USR = "playground5";
        String PWD = "playground2020";

        Connection conn = null;
        Statement stmt = null;
        String sql = null;
        
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

// 데이터 베이스 접속 및 실행
        try {
            Class.forName(DRV);
            conn = DriverManager.getConnection(URL,USR,PWD);
            stmt = conn.createStatement();
            int cnt = stmt.executeUpdate(sql);
            if (cnt > 0) { System.out.println("데이터 추가 완료"); }
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버가 없어요!!");
        } catch (SQLException throwables) {
            System.out.println("JDBC 연결 실패!!");
        }

        try {
            if (stmt != null) { stmt.close(); }
            if (conn != null) { conn.close(); }
        } catch (SQLException throwables) {
        }

    }
}
