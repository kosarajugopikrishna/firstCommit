public with sharing class AngularJS_Page3 {

    public list<spider__Training_Course__c> Courseslist { get; set; }

    public String course { get; set; }

 
@RemoteAction
public static list<spider__Training_Course__c> Courseslist() {
   list<spider__Training_Course__c>clist= [select name from spider__Training_Course__c limit 3];
    return clist;    
    }
   /* @RemoteAction
public static string Courseslist(string cou) {
    string test='gopi';
    return test;
    }*/
}