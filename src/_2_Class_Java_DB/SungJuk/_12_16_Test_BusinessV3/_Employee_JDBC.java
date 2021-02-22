package _2_Class_Java_DB.SungJuk._12_16_Test_BusinessV3;

import java.sql.*;

class _Employee_JDBC {

    public static String insertEmp =
            "insert into employees (first_name, last_name, email, phone_number, hire_date) " +
                    "values (?,?,?,?,?)";

    public static String selectEmp =
            "select employee_id, first_name, last_name, email, phone_number, hire_date from employees " +
                    "order by employee_id";

    public static String selecetOneEmp =
            "select employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id from employees " +
                 "where employee_id = ?";

    public static String updateEmp =
            "update employees set first_name = ?, last_name = ?, email = ?, phone_number = ? where employee_id = ?";

    public static String deleteEmp =
            "delete from employees where employee_id = ?";

    public static Connection makeconn( ) {

        String DRV = "org.mariadb.jdbc.Driver";
        String URL = "jdbc:mariadb://maria-db.coqecfviusin.ap-northeast-2.rds.amazonaws.com:3306/Employees";
        String USR = "Employees";
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
