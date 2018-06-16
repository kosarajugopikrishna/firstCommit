public with sharing class acct {

public list<account>acclist{set;get;}
    public acct(ApexPages.StandardController controller) 
    {
       acclist=new list<account>();
    //acclist=(account)controller.getrecord();
    }
public list<account> getaccounts()
{
acclist=[select name,phone from account];
return acclist;
}
}