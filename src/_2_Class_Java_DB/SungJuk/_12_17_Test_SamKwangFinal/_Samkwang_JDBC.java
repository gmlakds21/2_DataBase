package _2_Class_Java_DB.SungJuk._12_17_Test_SamKwangFinal;

import java.sql.*;

public class _Samkwang_JDBC {

    public static String selectCODP =
            "select 고객번호, 고객이름, 주문번호, 주문일, 제품번호, 수량, 제품이름, 단가 from CODP " +
                    "order by 주문번호 desc";

    public static String selectOneCODP =
            "select * from CODP where 주문번호 = ? order by 주문번호 desc";

    public static String selectSOE =
            "select 인사번호, 주문번호, 운송ID, 운송이름, 주문일, 직책 "+
            "from SOE order by 운송ID desc";

    public static String selectOneSOE =
            "select * from SOE where 운송ID = ?";

    public static Connection makeconn( ) {

        String DRV = "org.mariadb.jdbc.Driver";
        String URL = "jdbc:mariadb://maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com:3306/playground8";
        String USR = "playground8";
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
