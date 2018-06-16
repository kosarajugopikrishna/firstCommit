public with sharing class Accountpdf {
    public Training_Session__c Acc { get; set; }
    public string studentnames{set;get;}
    public Accountpdf(ApexPages.StandardController controller) {
    studentnames= apexpages.currentpage().getparameters().get('studentnames');
 }
/*public string studentnames(){
return studentnames;
}*/
}