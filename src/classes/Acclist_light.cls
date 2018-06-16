public class Acclist_light {

 @auraEnabled 
    public static list<account> getaccounts(){
     return [select id,name,phone from account];   
    }
 @auraEnabled
    Public static list<contact> getcontacts(){
        return [select id,lastname from contact];
    }
}