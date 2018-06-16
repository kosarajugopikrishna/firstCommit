public with sharing class editmultiplecontacts {
    string accid;
    public editmultiplecontacts(ApexPages.StandardSetController controller) {
     accid=apexpages.currentpage().getparameters().get('id');
    list<account> acc=[SELECT id, name,  spider__Fees__c FROM Account where id=:accid];
    }

}