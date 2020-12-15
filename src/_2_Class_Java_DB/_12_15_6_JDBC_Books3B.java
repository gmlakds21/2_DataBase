package _2_Class_Java_DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

/* Books 테이블에 저장된 특정 내용을 출력함
 * 도서 제목으로 도서 정보 조회
 */
public class _12_15_6_JDBC_Books3B {
    public static void main(String[] args) {

        Connection conn = Util.makeconn("A");
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from Books where bookname = ?";
        String fmt = "%s %s %s %s \n";
        StringBuilder sb = new StringBuilder();

        Scanner sc = new Scanner(System.in);
        System.out.print("검색하실 도서 제목을 입력하세요 : ");
        String order = sc.nextLine();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, order);
            rs = pstmt.executeQuery();
            while ( rs.next() ) {
                String bookid = rs.getString(1);
                String bookname = rs.getString(2);
                String publisher = rs.getString(3);
                String price = rs.getString(4);

                String result = String.format(fmt,bookid, bookname, publisher, price);
                sb.append(result);
        }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        Util.desconn(conn, pstmt, rs);
        System.out.println(sb.toString());



    }
}