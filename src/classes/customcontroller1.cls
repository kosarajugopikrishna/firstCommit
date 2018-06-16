public with sharing class customcontroller1 {

    public PageReference next() {
        return null;
    }


    public String EmployeeName3 { get; set; }

    public String EmployeeName2 { get; set; }

    public String EmployeeName { get; set; }

    public list<contact> conlist { get; set; }
    
    public customcontroller1 ()
    {
    conlist=new list<contact>();
   conlist=[select name from contact limit 5];
   
    }
    
}