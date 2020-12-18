package _2_Class_Java_DB.SungJuk._12_17_Test_SamKwangFinal;

import java.util.ArrayList;
import java.util.Scanner;

public class Samkwang_Service implements _Samkwang_interface {

    Scanner sc = new Scanner(System.in);
    public Samkwang_Service() { }

    @Override
    public void displayMenu() {

        StringBuilder sb = new StringBuilder();
        sb.append("----------------------\n")
                .append(" 1. CODP 조회\n")
                .append(" 2. CODP 상세 조회\n")
                .append(" 3. SOE 조회\n")
                .append(" 4. SOE 상세 조회\n")
                .append(" 0. 프로그램 종료\n")
                .append("----------------------\n")
                .append("원하시는 작업은 ? ");
        System.out.print(sb);

    }

    /*
     * 고객 : 주문 번호, 고객이름
     * 주문 : 주문 번호, 주문 일
     * 주문항목 : 제품 번호, 수량
     * 제품 : 제품 이름, 단가
     */
    @Override
    public void readCODP() {

        ArrayList<Samkwang_VO_CODP> codps = Samkwang_DAO.selectCODP();

        String fmt = "%7s %6s %3s %10s %9s %5s %10s %7s\n";
        StringBuilder sb = new StringBuilder();


        for ( Samkwang_VO_CODP codp : codps) {
            String result = String.format(fmt, codp.get고객번호(), codp.get고객이름(),
                codp.get주문번호(), codp.get주문일().substring(0,10), codp.get제품번호(), codp.get수량(),
                codp.get제품이름(), codp.get단가());
            sb.append(result);
        }

        System.out.println(sb.toString());
    }

    @Override
    public void readOneCODP() {

        System.out.print("조회하고자 하는 주문 번호를 입력해 주세요 : ");
        String target = sc.nextLine();

        ArrayList<Samkwang_VO_CODP> codps = Samkwang_DAO.selectOneCODP( target );

        String fmt = "%9s %3s %8s %7s %10s %5s %10s %10s\n" +
            "%10s %10s %7s %6s %10s %5s %6s %6s\n\n";
        StringBuilder sb = new StringBuilder();

        for ( Samkwang_VO_CODP codp : codps ) {
            String result = String.format(fmt, codp.get제품번호(), codp.get주문번호(), codp.get고객번호(),
                    codp.get고객이름(), codp.get주소(), codp.get시도(), codp.get우편번호(), codp.get전화번호(),
                    codp.get주문일().substring(0,10), codp.get납기일().substring(0,10), codp.get인사번호(), codp.get수량(), codp.get제품이름(),
                    codp.get제품분류(), codp.get단가(), codp.get재고량());
            sb.append(result);
        }
        System.out.println(sb.toString());
    }

    @Override
    public void readSOE() {

        String fmt = "%10s %10s %10s %10s %10s %10s\n";
        StringBuilder sb = new StringBuilder();

        ArrayList<Samkwang_VO_SEO> seos = Samkwang_DAO.selectSOE();

        for ( Samkwang_VO_SEO seo : seos ) {
            String result = String.format(fmt, seo.get인사번호(), seo.get주문번호(), seo.get운송ID(),
                    seo.get운송이름(), seo.get주문일(), seo.get직책());
            sb.append(result);
        }

        System.out.println(sb.toString());
    }

    public void readOneSOE() {

        String fmt = "%7s, %4s, %10s, %10s, %10s, %10s," +
                " %10s, %8s, %10s, %5s, %5s, %5s, %10s";

        System.out.print("조회할 운송ID를 입력해 주세요 : ");
        String target = sc.nextLine();

        Samkwang_VO_SEO seo = Samkwang_DAO.selectOneSEO( target );

        String result = String.format(fmt, seo.get인사번호(), seo.get주문번호(), seo.get운송ID(), seo.get운송이름(),
                seo.get담당자_전화번호(), seo.get주문일().substring(0,10), seo.get납기일().substring(0,10), seo.get고객번호(), seo.get주민등록번호(),
                        seo.get성명(), seo.get소속부서(), seo.get직책(), seo.get입사일());

        System.out.println(result);

    }
}
