public with sharing class Accountpopup {

    public String getAcc() {
        return null;
    }


   public List<account> getAccounts()
    {
        List <account>accounttList = new List<account>();
        accounttList = [Select Id, Name from Account LIMIT 10];
        return accounttList ;
    }

    public String Edit() {
        displaypopup=true;
         string rpid=apexpages.currentpage().getparameters().get('id');
         acct=[select id,name,phone,email__c from account where id=:rpid];
         return null;
    }


    public list<account> records { get; set; }

    public PageReference cancel() {
        displaypopup=false;
        return null;
    }

   
    public account ac { get; set; }
    public String rpid { get; set; }
    public boolean displaypopup{set;get;}
    
    public list<account>acct{set;get;}
    
    /*public pagereference edit() 
    {
         displaypopup=true;
         string rpid=apexpages.currentpage().getparameters().get('id');
         acct=[select id,name,phone,email__c from account where id=:rpid];
         return null;
    }
    */
public pagereference save()
{
   displaypopup=false;
   update acct;
   return null;
 }
public Accountpopup()
    {
       records=[select name,phone from account];
    }
}