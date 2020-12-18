package _2_Class_Java_DB.SungJuk._12_17_Test_SamKwangFinal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Samkwang_DAO {


    public static ArrayList<Samkwang_VO_CODP> selectCODP() {
        ArrayList<Samkwang_VO_CODP> codps = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        conn = _Samkwang_JDBC.makeconn();
        try {
            pstmt = conn.prepareStatement(_Samkwang_JDBC.selectCODP);
            rs = pstmt.executeQuery();
            while ( rs.next() ) {
                Samkwang_VO_CODP codp = new Samkwang_VO_CODP(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getInt(8));
                codps.add(codp);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        _Samkwang_JDBC.desconn(conn, pstmt, rs);

        return codps;
    }

    public static ArrayList<Samkwang_VO_CODP> selectOneCODP( String target ) {

        ArrayList<Samkwang_VO_CODP>  codps = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        conn = _Samkwang_JDBC.makeconn();
        try {
            pstmt = conn.prepareStatement(_Samkwang_JDBC.selectOneCODP);
            pstmt.setString(1, target );
            rs = pstmt.executeQuery();
            while ( rs.next() ) {
                Samkwang_VO_CODP codp = new Samkwang_VO_CODP(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getInt(15),
                        rs.getInt(16));
                codps.add(codp);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        _Samkwang_JDBC.desconn(conn, pstmt, rs);

        return codps;
    }

    public static ArrayList<Samkwang_VO_SEO> selectSOE() {

        ArrayList<Samkwang_VO_SEO> seos = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        conn = _Samkwang_JDBC.makeconn();
        try {
            pstmt = conn.prepareStatement(_Samkwang_JDBC.selectSOE);
            rs = pstmt.executeQuery();
            while ( rs.next() ) {
                Samkwang_VO_SEO seo = new Samkwang_VO_SEO(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
                seos.add(seo);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        _Samkwang_JDBC.desconn(conn, pstmt, rs);

        return seos;
    }

    public static Samkwang_VO_SEO selectOneSEO( String target ) {

        Samkwang_VO_SEO seo = new Samkwang_VO_SEO();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        conn = _Samkwang_JDBC.makeconn();
        try {
            pstmt = conn.prepareStatement(_Samkwang_JDBC.selectOneSOE);
            pstmt.setString(1, target);
            rs = pstmt.executeQuery();
            if ( rs.next() ) {
                seo = new Samkwang_VO_SEO(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        _Samkwang_JDBC.desconn(conn, pstmt, rs);

        return seo;
    }
}
