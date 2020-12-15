package _2_Class_Java_DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class _12_15_4_JDBC_Orders2 {
    public static void main(String[] args) {

        Connection conn = Util.makeconn("A");

        Scanner sc = new Scanner(System.in);
        PreparedStatement pstmt = null;
        String sql = null;

        sql = "insert into BookOrders value (?,?,?,?,?)";

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

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, orderid);
            pstmt.setInt(2,custid);
            pstmt.setInt(3,bookid);
            pstmt.setInt(4,saleprice);
            pstmt.setString(5, orderdate);
            int cnt = pstmt.executeUpdate();
            if (cnt > 0 ) System.out.println("주문 입력 완료");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        Util.desconn(conn,pstmt);

    }
}