package _2_Class_Java_DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;
// BookMembers 테이블에 저장된 특정 내용을 출력함
public class _12_15_8_JDBC_Members3C {
    public static void main(String[] args) {

        Connection conn = Util.makeconn("A");

        Scanner sc = new Scanner(System.in);
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from BookMembers where name like ?";
        System.out.print("검색하실 회원의 이름을 입력해 주세요 : ");
        String order = sc.nextLine();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,"%"+order+"%");
            rs = pstmt.executeQuery();

            while ( rs.next() ) {
                String custid = rs.getNString(1);
                String name = rs.getNString(2);
                String address = rs.getNString(3);
                String phone = rs.getNString(4);

                String fmt = "%s, %s, %s, %s \n";
                String result = String.format(fmt,custid, name, address, phone);
                System.out.println(result);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        Util.desconn(conn, pstmt);



    }
}
