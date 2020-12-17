package _2_Class_Java_DB.SungJuk._12_17_Test_SamKwangFinal;

import java.util.Scanner;

public class Samkwang_Service implements _Samkwang_interface {

    Scanner sc = new Scanner(System.in);
    public Samkwang_Service() { }

    @Override
    public void displayMenu() {

        StringBuilder sb = new StringBuilder();
        sb.append("----------------------\n")
                .append(" 1. 직원 데이터 입력\n")
                .append(" 2. 직원 데이터 조회\n")
                .append(" 3. 직원 데이터 상제 조회\n")
                .append(" 4. 직원 데이터 수정\n")
                .append(" 5. 직원 데이터 삭제\n")
                .append(" 0. 프로그램 종료\n")
                .append("----------------------\n")
                .append("원하시는 작업은 ? ");
        System.out.print(sb);
    }

    @Override
    public void readCODP() {

    }

    @Override
    public void readSOE() {

    }
}
