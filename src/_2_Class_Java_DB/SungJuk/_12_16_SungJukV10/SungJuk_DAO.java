package _2_Class_Java_DB.SungJuk._12_16_SungJukV10;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

class SungJuk_DAO {

    // 넘겨받은 성적데이터를 Sungjuk 테이블에 저장
    public static String insertSungJuk(SungJuk_VO person) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        String result = "데이터 업로드 실패\n";

        conn = _SungJuk_JDBC.makeconn();
        try {
            pstmt = conn.prepareStatement(_SungJuk_JDBC.insertSungjuk);
            pstmt.setString(1, person.getName());
            pstmt.setInt(2, person.getKor());
            pstmt.setInt(3, person.getEng());
            pstmt.setInt(4, person.getMat());
            pstmt.setInt(5, person.getSum());
            pstmt.setDouble(6, person.getMean());
            pstmt.setString(7, String.valueOf(person.getGrd()));
            int cnt = pstmt.executeUpdate();
            if ( cnt > 0) { result = "데이터 업로드 성공\n"; }
        } catch (SQLException throwables) {
            System.out.println("insert SQL 에서 오류 발생");
        }
        _SungJuk_JDBC.desconn(conn, pstmt);
        return result;
    }

    // 번호, 이름, 국어, 영어, 수학, 등올일을 조회하고
    // 그 결과들을 ArrayList에 담아서 넘김
    public static ArrayList<SungJuk_VO> selectSungjuk() {

        ArrayList<SungJuk_VO> persons = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        conn = _SungJuk_JDBC.makeconn();
        try {
            pstmt = conn.prepareStatement(_SungJuk_JDBC.selectSungjuk);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                SungJuk_VO person = new SungJuk_VO (
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        0, 0.0,' ',
                        rs.getString(6));
                persons.add(person);
            }
        } catch (SQLException se) {
            System.out.println("select SQL 에서 오류 발생");
        }
        _SungJuk_JDBC.desconn(conn,pstmt,rs);

        return persons;
    }

    // 학생 번호로 조회하고
    // 그 결과를 SungJuk_VO 에 담아서 넘김
    public static SungJuk_VO selecetOneSungJuk( String target ) {
        SungJuk_VO person = null;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        conn = _SungJuk_JDBC.makeconn();

        try {
            pstmt = conn.prepareStatement(_SungJuk_JDBC.selectOneSungjuk);
            pstmt.setString(1, target);
            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                person = new SungJuk_VO(rs.getInt(1),
                rs.getString(2),
                rs.getInt(3),
                rs.getInt(4),
                rs.getInt(5),
                rs.getInt(6),
                rs.getDouble(7),
                rs.getString(8).charAt(0),
                rs.getString(9));
            }
        } catch (SQLException throwables) {
            System.out.println("Select SQL 에서 오류 발생");
        }
        return person;
    }
}
