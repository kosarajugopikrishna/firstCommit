public with sharing class getvalues 
{
 public list<account> accs{set;get;}
 

    public getvalues(ApexPages.StandardController controller)
    {
     
     accs=[select name from account limit 5];
    }

}