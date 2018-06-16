public with sharing class Account1 {

public list<account> acc { get; set; }

public account1()
{
acc= [select id,rich__c from account];
    }
    
}