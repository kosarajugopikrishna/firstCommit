public with sharing class popupstead {

  public PageReference cancel() {
        displaypopup=false;
        return null;
    }

    public list<account>details{set;get;}
    public account ac { get; set; }
    public String aid { get; set; }
    public boolean displaypopup{set;get;}
    
    public list<account>acct{set;get;}
    public void edit() 
    {
       
         displaypopup=true;
         string aid=apexpages.currentpage().getparameters().get('id');
         acct=[select id,name,phone from account where id=:aid];
    }
    
public pagereference save()
{
    update acct;
    displaypopup=false;
    return null;
 }
public popupstead()
    {
   
        details=[select Id,name,phone from account];
    }
      
}