package _2_Class_Java_DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class _12_15_9_JDBC_Orders3B {
    public static void main(String[] args) {

        Connection conn = Util.makeconn("A");
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from BookOrders where orderid = ?";

        Scanner sc = new Scanner(System.in);
        System.out.print("주문 번호를 입력해 주세요 : ");
        String order = sc.nextLine();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, order);
            rs = pstmt.executeQuery();

            while ( rs.next() ) {
                String orderid = rs.getString(1);
                String custid = rs.getString(2);
                String bookid = rs.getString(3);
                String saleprice = rs.getString(4);
                String orderdate = rs.getString(5);

                String fmt = ("%s, %s, %s, %s, %s");
                String result = String.format(fmt, orderid, custid, bookid, saleprice, orderdate);
                System.out.println(result);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        Util.desconn(conn, pstmt, rs);
    }
}
