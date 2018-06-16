public with sharing class getvalue
 {
    public list<account>accs{set;get;}
    list<account> selectacc{set;get;}
    public boolean selected{set;get;}
    public getvalue()
    {
     accs=new list<account>([select name,phone,email__c from account limit 6]);
    }
    public void selectacc()
    {
    string id=system.currentpagereference().getparameters().get('accid');
    }
    
 }