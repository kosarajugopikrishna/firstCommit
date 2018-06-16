public with sharing class getselectedvalue
 {

    //public boolean check { get; set; }
    public list<account>accs{set;get;}
    list<account> selectacc{set;get;}
    
    public getselectedvalue()
    {
     accs=new list<account>([select name,phone,email__c from account limit 6]);
    }
    public void selectacc()
    {
    string getid=system.currentpagereference().getparameters().get('accid');
    account acc=[select id,name,phone,email__c from account where id=:getid];
   
    selectacc=new list<account>();
    selectacc.add(acc);

    }
    public list<account>getselectedaccs()
    {
     //if(check==true)
     //{
       return selectacc;
     //}    
    }
    
 }