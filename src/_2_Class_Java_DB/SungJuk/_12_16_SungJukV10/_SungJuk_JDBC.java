package _2_Class_Java_DB.SungJuk._12_16_SungJukV10;

import java.sql.*;

class _SungJuk_JDBC {

    static String insertSungjuk =
            "insert into Sungjuk (name, kor, eng, mat, tot, mean, grd) values (?,?,?,?,?,?,?)" ;

    static String selectSungjuk =
            "select sjno,name,kor,eng,mat,regdate from Sungjuk order by sjno";

    static String selectOneSungjuk =
            "select * from Sungjuk where sjno = ?";

    static String updateSungjuk =
            "update Sungjuk set kor = ?, eng = ?, mat = ?, tot = ?, mean = ?, grd = ? where sjno = ? regdate = sysdate()";

    static String deleteSungJuk =
            "delete from Sungjuk where sjno = ?";

    static Connection makeconn( ) {

        String DRV = "org.mariadb.jdbc.Driver";
        String URL = "jdbc:mariadb://maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com:3306/Sungjuk";
        String USR = "Sungjuk";
        String PWD = "tmdgml201";

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

    static void desconn(Connection conn, PreparedStatement pstmt) {
        try {
            if (pstmt != null) { pstmt.close(); }
            if (conn != null) { conn.close(); }
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }


   static void desconn(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null) { rs.close(); }
            if (pstmt != null) { pstmt.close(); }
            if (conn != null) { conn.close(); }
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
}
