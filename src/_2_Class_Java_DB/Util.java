package _2_Class_Java_DB;
import java.sql.*;

// 12_15_3 부터 사용
public class Util {

    public static Connection makeconn(String order) {

        String DRV = "org.mariadb.jdbc.Driver" ;
        String URL = null;
        String USR = null;
        String PWD = null;

        switch(order) {
            case "A" :
                URL = "jdbc:mariadb://maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com:3306/playground5";
                USR = "playground5";
                PWD = "playground2020";
                break;
            case "B" :
                URL = "jdbc:mariadb://maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com:3306/playground4_2";
                USR = "playground4_2";
                PWD = "playground2020";
                break;
            case "C" :
                URL = "jdbc:mariadb://maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com:3306/playground6";
                USR = "playground6";
                PWD = "playground2020";
                break;
            case "D" :
                URL = "jdbc:mariadb://maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com:3306/playground7";
                USR = "playground7";
                PWD = "playground2020";
                break;
            case "S" :
                URL = "jdbc:mariadb://maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com:3306/Sungjuk";
                USR = "Sungjuk";
                PWD = "Sungjuk2020";
        }

        Connection conn = null;

        try {
            Class.forName(DRV);
            conn = DriverManager.getConnection( URL, USR, PWD);
        } catch (ClassNotFoundException cnf) {
            System.out.println("JDBC 드라이버를 설치하세요");
        } catch (SQLException sqlex) {
            System.out.println("DB 접속 주소가 틀리거나, 아이디 비밀번호를 확인하세요");
        }

        return conn;
    }

    public static void desconn(Connection conn) {
        try {
            if (conn != null) { conn.close(); }
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }

    public static void desconn(Connection conn, PreparedStatement pstmt) {
        try {
            if (pstmt != null) { pstmt.close(); }
            if (conn != null) { conn.close(); }
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }


    public static void desconn(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null) { rs.close(); }
            if (pstmt != null) { pstmt.close(); }
            if (conn != null) { conn.close(); }
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }


}
