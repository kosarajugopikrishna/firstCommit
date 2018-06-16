public with sharing class popup4 {

    public PageReference cancel() {
        displaypopup=false;
        return null;
    }

    public list<account>details{set;get;}
    public account ac { get; set; }
    public String aid { get; set; }
    public boolean displaypopup{set;get;}
    
    public list<account>acct{set;get;}
    
    public PageReference edit() 
    {
         displaypopup=true;
         string aid=apexpages.currentpage().getparameters().get('id');
         acct=[select id,name,phone,email__c from account where id=:ac.id];
         return null;
    }
    
public pagereference save()
{
   displaypopup=false;
   update acct;
   return null;
 }
public popup4()
    {
        details=[select name,phone from account];
    }
}