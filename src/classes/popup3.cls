public with sharing class popup3 {

    public String aid { get; set; }
    public boolean displaypopup{set;get;}
    public list<account>ac{set;get;}
    

    public PageReference edit() 
    {
         displaypopup=true;
         string aid=apexpages.currentpage().getparameters().get('id');
         ac=[select id,name,phone,email__c from account where id=:aid];
         return null;
    }

 public list<account>details{set;get;}
    
    public popup3()
    {
     
     details=[select name,phone from account];
     }
}