package _2_Class_Java_DB.SungJuk._12_16_SungJukV10;

import java.sql.*;

public class _SungJuk_JDBC {

    public static String insertSungjuk =
            "insert into Sungjuk (name, kor, eng, mat, tot, mean, grd) values (?,?,?,?,?,?,?)" ;
    public static String selectSungjuk =
            "select sjno,name,kor,eng,mat,regdate from Sungjuk order by sjno";
    public static String selectOneSungjuk =
            "select * from Sungjuk where sjno = ?";
    public static String updateSungjuk =
            "update Sungjuk set kor = ?, eng = ?, mat = ?, tot = ?, mean = ?, grd = ? where sjno = ?";
    public static String deleteSungJuk =
            "delete Sungjuk where sjno = ?";

    public static Connection makeconn( ) {

        String DRV = "org.mariadb.jdbc.Driver";
        String URL = "jdbc:mariadb://maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com:3306/Sungjuk";
        String USR = "Sungjuk";
        String PWD = "Sungjuk2020";

        Connection conn = null;
        try {
            Class.forName(DRV);
            conn = DriverManager.getConnection(URL, USR, PWD);
        } catch (ClassNotFoundException cnf) {
            System.out.println("JDBC 드라이버를 설치하세요");
        } catch (SQLException sqlex) {
            System.out.println("DB 접속 주소가 틀리거나, 아이디 비밀번호를 확인하세요");
        }

        return conn;
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
