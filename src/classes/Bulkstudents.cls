public with sharing class Bulkstudents {

    public String Stdlist { get; set; }
public list<contact> conlist{set;get;}
id accid;
 public Bulkstudents() {
    accid=apexpages.currentpage().getparameters().get('id');
    system.debug('id'+accid);
    conlist =[select id,lastname,accountId,spider__Status__c,spider__Number__c from contact where accountId=:accid];
    }
 public PageReference save() {
      update conlist;
        return new pagereference('/'+accid);
    }
  public PageReference Cancel() {
      return new pagereference('/'+accid);
    }

}