public class Lightning_Ctrl {

    @AuraEnabled
    Public static list<spider__Training_Session__c> gettraining(){
        return [select spider__Trainer__c,spider__Training_Course__c,spider__Status__c from spider__Training_Session__c where spider__Trainer__c =:'session1'];
    }
}