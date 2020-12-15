package _2_Class_Java_DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// Books 테이블에 저장된 모든 내용을 출력함
public class _12_15_5_JDBC_Books3 {
    public static void main(String[] args) {

        Connection conn = Util.makeconn("A");
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from Books";
        StringBuilder sb = new StringBuilder();

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            System.out.println("bookid    bookname       publisher       price");
            while ( rs.next() ) {

                String bookid = rs.getString(1);
                String bookname = rs.getString(2);
                String publisher = rs.getString(3);
                String price = rs.getString(4);
                String fmt = "%3s, %10s, %10s, %10s\n";
                String result = String.format(fmt, bookid, bookname, publisher, price);
                sb.append(result);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        System.out.println(sb.toString());
        Util.desconn(conn, pstmt, rs);

    }
}