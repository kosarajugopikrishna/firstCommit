global with sharing class javascriptcontroller {

    
    public static Account account{ get; set; }
    public string accname{set;get;}
    
    @RemoteAction
    global static Account getaccount(string accname){
     account =[select id,name,phone,spider__Mybox__c from account where name =:accname];
     return account;
     
}
}