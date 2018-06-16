public with sharing class Multicontact1
{
    public list<contact> conlist { get; set; }
    string accid;
    public list<account>acc;
    public list<account>ac;
    public multicontact1()
    {
    accid=apexpages.currentpage().getparameters().get('id');
    acc=[Select id, name, spider__Fees__c,spider__From_Time__c,spider__To_Time__c,(select id,accountId from Contacts) FROM Account];
    ac=[SELECT id, name,  spider__Fees__c,spider__From_Time__c,spider__To_Time__c FROM Account where id=:accid];
    conlist=new list<contact>();
    if(ac[0].spider__Fees__c!=null)
    conlist.add(new contact(lastname='Test1',accountid=accid,spider__Number__c=ac[0].spider__Fees__c,  spider__Status__c='Active'));
    }
    public void addrow()
    {
        conlist.add(new contact(lastname='Test1',accountid=accid,spider__Number__c=ac[0].spider__Fees__c,spider__Status__c='Active'));
    }
    public void addrows()
    {
       for(integer i=0;i<5;i++)
        {
        conlist.add(new contact(lastname='Test1',accountid=accid,spider__Number__c=ac[0].spider__Fees__c,  spider__Status__c='Active'));
        }
    }
    Public boolean validate_Session_timings(){
      if((ac[0].spider__To_Time__c == acc[0].spider__To_Time__c && ac[0].spider__From_Time__c  == acc[0].spider__From_Time__c)||
           (ac[0].spider__From_Time__c < acc[0].spider__To_Time__c && ac[0].spider__From_Time__c > acc[0].spider__From_Time__c) ||
           (ac[0].spider__From_Time__c == acc[0].spider__From_Time__c && ac[0].spider__To_Time__c > acc[0].spider__To_Time__c)||
           (ac[0].spider__From_Time__c < acc[0].spider__From_Time__c && ac[0].spider__To_Time__c > acc[0].spider__To_Time__c)){
      return true;
      }
      else{
    return false;
    }
   } 
   public pagereference save()
   {
      if (validate_Session_timings()) {                     
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Overlap Session.');
            ApexPages.addMessage(myMsg);
            return null;
     }
    else{
    insert conlist;
    return new pagereference('/'+accid);// return new pagereference('/'+conlist[0].accountid);
   }
  
}
}