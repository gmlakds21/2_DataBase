package _2_Class_Java_DB.SungJuk._12_16_Test_BusinessV3;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

class Employee_Service implements _Employee_interface {

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
   public void readInfo() {

      Scanner sc = new Scanner(System.in);

      System.out.println("FIRST_NAME 를 입력해 주세요");
      String fname = sc.nextLine();
      System.out.println("LAST_NAME 를 입력해 주세요");
      String lname = sc.nextLine();
      System.out.println("EMAIL 를 입력해 주세요");
      String email = sc.nextLine();
      System.out.println("PHONE_NUMBER 를 입력해 주세요");
      String phone = sc.nextLine();
      System.out.println("HIRE_DATE 를 입력해 주세요");
      String hdata = sc.nextLine();

      Employee_VO employee = new Employee_VO(fname, lname, email, phone, hdata);

      String result = Employee_DAO.insertEmp(employee);
      System.out.println(result);
   }

   @Override
   public void showInfo() {
      //사번, 성, 이메일, 직책, 상사번호, 부서번호

      Scanner sc = new Scanner(System.in);

      StringBuilder sb = new StringBuilder();
      String fmt = "employee_id : %d, First_name : %s, last_name : %s, email : %s, phone_number : %s, hire_date : %s\n";

      ArrayList<Employee_VO> employees = Employee_DAO.selectEmp();
      for ( Employee_VO employee : employees  ) {
         String result = String.format(fmt, employee.getEmpno(), employee.getFname(), employee.getLname(),
                 employee.getEmail(), employee.getPhone(), employee.getHdata());
         sb.append(result);
      }
      System.out.println(sb.toString());
   }

   @Override
   public void showAllInfo() {

      Scanner sc = new Scanner(System.in);
      System.out.println("검색하시려는 EMPLOYEE_ID를 입력해 주세요 : ");
      String target = sc.nextLine();

      Employee_VO employee = Employee_DAO.selectOneEmp( target );

      String fmt = "employee_id : %d, First_name : %s, last_name : %s, email : %s, phone_number : %s, hire_date : %s" +
              "job_id : %s, salay : %d, commission_pct : %.2f, manager_id : %d, department_id : %d\n";
      String result = String.format(fmt, employee.getEmpno(), employee.getFname(), employee.getLname(),
                  employee.getEmail(), employee.getPhone(), employee.getHdata(), employee.getJobid(),
              employee.getSal(), employee.getComm(), employee.getMgrid(), employee.getDeptid());
      System.out.println(result);
   }

   @Override
   public void modifyInfo() {
/*
      Scanner sc = new Scanner(System.in);
      System.out.println("수정하시려는 EMPLOYEE_ID를 입력해 주세요 : ");
      int ID = sc.nextInt();

      Iterator<Employee_VO> iter = VOdata.iterator();
      while (iter.hasNext()) {
         person = iter.next();
         if (person.getEmpno() == ID) {

            String blink = sc.nextLine();
            System.out.println("FIRST_NAME 를 입력해 주세요");
            person.setFname(sc.nextLine());
            System.out.println("LAST_NAME 를 입력해 주세요");
            person.setLname(sc.nextLine());
            System.out.println("EMAIL 를 입력해 주세요");
            person.setEmail(sc.nextLine());
            System.out.println("PHONE_NUMBER 를 입력해 주세요");
            person.setPhone(sc.nextLine());
            System.out.println("HIRE_DATE 를 입력해 주세요");
            person.setHdata(sc.nextLine());
            System.out.println("JOB_ID 를 입력해 주세요");
            person.setJobid(sc.nextLine());
            System.out.println("SALARY 를 입력해 주세요");
            person.setSal(sc.nextInt());
            System.out.println("COMMISSION_PCT 를 입력해 주세요");
            person.setComm(sc.nextDouble());
            System.out.println("MANAGER_ID 를 입력해 주세요");
            person.setMgrid(sc.nextInt());
            blink = sc.nextLine();
            System.out.println("DEPARTMENT_ID 를 입력해 주세요");
            person.setDeptid(sc.nextLine());
            System.out.println();


            String fmt = "EMPLOYEE_ID : %d, FIRST_NAME : %s, LAST_NAME : %s, EMAIL : %s, PHONE_NUMBER : %s, HIRE_DATE : %s, JOB_ID : %s, SALARY : %d, COMMISSION_PCT : %.2f, MANAGER_ID : %s, DEPARTMENT_ID : %s\n";
            System.out.printf(fmt, person.getEmpno(), person.getFname(), person.getLname(), person.getEmail(), person.getPhone(), person.getHdata(), person.getJobid(), person.getSal(), person.getComm(), person.getMgrid(), person.getDeptid());
            System.out.println("수정되었습니다.");
         }
      }

*/
   }

   @Override
   public void removeInfo() {
/*
      Scanner sc = new Scanner(System.in);
      System.out.println("삭제하시려는 EMPLOYEE_ID를 입력해 주세요 : ");
      int ID = sc.nextInt();
      int i = 0;
      int j = 0;

      Iterator<Employee_VO> iter = VOdata.iterator();
      while (iter.hasNext()) {
         person = iter.next();
         if (person.getEmpno() == ID) {
            j = i;
         }
         i++;
      }
      VOdata.remove(j);
*/
   }
}