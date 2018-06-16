public with sharing class AccountRich {
public list<account> Acc { get; set; }
    public AccountRich(){
    acc=[select id,name,rich__c from account];
    }
}