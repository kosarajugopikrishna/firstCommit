global with sharing class RemotePage{
    public String accountName { get; set; }
    public static Account account { get; set; }
    public RemotePage() { } // empty constructor
    @RemoteAction
    global static Account getAccount(String an) {
        account = [SELECT Id, Name, Phone, Type, NumberOfEmployees
                   FROM Account WHERE Name = :an];
        return account;
    }
}