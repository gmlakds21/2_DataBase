package _2_Class_Java_DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;
public class _12_15_3_JDBC_Members2 {

    public static void main(String[] args) {

        Connection conn = Util.makeconn("A");

        Scanner sc = new Scanner(System.in);
        PreparedStatement pstmt = null;

        String sql = "insert into BookMembers values (?,?,?,?)";

        System.out.print("custid : ");
        int custid = sc.nextInt();
        String blank = sc.nextLine();
        System.out.print("name : ");
        String name = sc.nextLine();
        System.out.printf("address : ");
        String address = sc.nextLine();
        System.out.print("phone : ");
        String phone = sc.nextLine();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt (1, custid);
            pstmt.setString (2, name);
            pstmt.setString (3, address);
            pstmt.setString (4, phone);

            int cnt = pstmt.executeUpdate();
            if ( cnt > 0 ) System.out.println("회원 정보 추가 완료");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        Util.desconn(conn, pstmt);
    }
}
