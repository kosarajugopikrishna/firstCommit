public with sharing class AngularJS_Page2 {

    public String getAccountslist() {
        return JSON.serialize([select id,name,phone from account]);
    }
    
    @RemoteAction
    public static list<account> Accountlist() {
        return ([select id,name,phone from account]);
    }
}