public class Sampleclass
{
    List<Session_Student__c> accList { get; set; }
    Public integer index { get; set; }

    public Sampleclass(BulkNoOfStudents controller) {
        Session_Student__c newAcc = New Session_Student__c();
        accList = new List<Session_Student__c>();
        accList.add(newAcc);
    }
    
    public void Addrow() {
        Session_Student__c newAcc = New Session_Student__c();
        accList.add(newAcc);
    }
    
    public void delrow() {
        accList.remove(index);
        
    }

Public String message = System.currentPagereference().getParameters().get('msg'); 

}