package _2_Class_Java_DB.SungJuk._12_16_Test_BusinessV3;

class Employee_VO {

   private int empno;
   private String fname;
   private String lname;
   private String email;
   private String phone;
   private String hdata;
   private String jobid;
   private int sal;
   private double comm;
   private int mgrid;
   private int deptid;

   public Employee_VO() {
   }

   public Employee_VO(String fname, String lname, String email, String phone, String hdata, String jobid, int sal, double comm, int mgrid, int deptid) {
      this.fname = fname;
      this.lname = lname;
      this.email = email;
      this.phone = phone;
      this.hdata = hdata;
      this.jobid = jobid;
      this.sal = sal;
      this.comm = comm;
      this.mgrid = mgrid;
      this.deptid = deptid;
   }

   public Employee_VO(String fname, String lname, String email, String phone, String hdata) {
      this.fname = fname;
      this.lname = lname;
      this.email = email;
      this.phone = phone;
      this.hdata = hdata;
   }

   public Employee_VO(int empno, String fname, String lname, String email, String phone, String hdata, String jobid, int sal, double comm, int mgrid, int deptid) {
      this.empno = empno;
      this.fname = fname;
      this.lname = lname;
      this.email = email;
      this.phone = phone;
      this.hdata = hdata;
      this.jobid = jobid;
      this.sal = sal;
      this.comm = comm;
      this.mgrid = mgrid;
      this.deptid = deptid;
   }

   public int getEmpno() {
      return empno;
   }

   public void setEmpno(int empno) {
      this.empno = empno;
   }

   public String getFname() {
      return fname;
   }

   public void setFname(String fname) {
      this.fname = fname;
   }

   public String getLname() {
      return lname;
   }

   public void setLname(String lname) {
      this.lname = lname;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getHdata() {
      return hdata;
   }

   public void setHdata(String hdata) {
      this.hdata = hdata;
   }

   public String getJobid() {
      return jobid;
   }

   public void setJobid(String jobid) {
      this.jobid = jobid;
   }

   public int getSal() {
      return sal;
   }

   public void setSal(int sal) {
      this.sal = sal;
   }

   public double getComm() {
      return comm;
   }

   public void setComm(double comm) {
      this.comm = comm;
   }

   public int getMgrid() {
      return mgrid;
   }

   public void setMgrid(int mgrid) {
      this.mgrid = mgrid;
   }

   public int getDeptid() {
      return deptid;
   }

   public void setDeptid(int deptid) {
      this.deptid = deptid;
   }
}
