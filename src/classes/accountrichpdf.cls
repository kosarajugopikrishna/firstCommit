public with sharing class accountrichpdf {
public list<account>acc{set;get;}
    public accountrichpdf(ApexPages.StandardController controller) {
    
    acc=[select id, rich__c from account];

    }

}