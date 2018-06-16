public with sharing class EditBulkNoofstudents{

public list<spider__Session_Student__c> stdlist{set;get;}
Public list<spider__Course_Details__c> CDOldList{set;get;}
id sessionid;
Public EditBulkNoofstudents() {
    sessionid=apexpages.currentpage().getparameters().get('id');
    stdlist =[select id,spider__Contact__c,spider__Training_Session__c,spider__Training_Session__r.spider__Status__c,spider__Training_Session__r.spider__Training_Course__c,spider__Status__c,spider__Reason__c,spider__Course_Fees__c from spider__Session_Student__c where spider__Training_Session__c =:sessionid];
    CDOldList = [select id,spider__Status__c,spider__Contact__c,spider__Training_Course__c from spider__Course_Details__c];
}

Public Boolean ValidateReason(){
 boolean flag;
  for(spider__Session_Student__c st: stdlist)
         {
          if(st.spider__Status__c == 'Discontinued' && st.spider__Reason__c == null)
           {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error:Provide the valid reason for discontinuing students.');
            ApexPages.addMessage(myMsg);
            //st.spider__Reason__c.adderror('Provide the valid reason for discontinuing students');
            flag=true;
           } 
        }
  if(flag==true){
      return true;
  }
  else{
      return false;
  }
 }
public PageReference save() {
list<spider__Course_Details__c> CDlist = new list<spider__Course_Details__c>();
 for(spider__Session_Student__c st: stdlist){
         if(st.spider__Training_Session__r.spider__Status__c == 'In Progress' && st.spider__Status__c == 'Unregistered'){
          ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Should not change the status after session has started');
            ApexPages.addMessage(myMsg);
             return null;
   }
 }
if(ValidateReason()){
   return null;
  }
  else{
            update stdlist;
     
     for(spider__Session_Student__c st: stdlist){
       if(CDOldlist.size()==0 && st.spider__Status__c=='Discontinued' || st.spider__Status__c=='Unregistered'){
      CDlist.add(new spider__Course_Details__c(spider__Contact__c= st.spider__Contact__c,spider__Status__c= st.spider__Status__c,spider__Training_Course__c=st.spider__Training_Session__r.spider__Training_Course__c));
     }
      for(spider__Course_Details__c CD : CDOldlist){
       if(CD.spider__Contact__c != st.spider__Contact__c && st.spider__Status__c=='Discontinued' && st.spider__Status__c=='Unregistered'){
      CDlist.add(new spider__Course_Details__c(spider__Contact__c= st.spider__Contact__c,spider__Status__c= st.spider__Status__c,spider__Training_Course__c=st.spider__Training_Session__r.spider__Training_Course__c));
      system.debug('***********NotEqualto:'+CDlist);
     }
    }
   }
     insert CDlist;
     
     for(spider__Session_Student__c st: stdlist){
       for(spider__Course_Details__c CD : CDOldlist){
       if(CD.spider__Contact__c == st.spider__Contact__c){
        CDlist.add(CD);
        system.debug('***********Equalto:'+CDlist);
       }
      }
   }
    update CDlist;
    return new pagereference('/'+sessionid);
   }
    
 }

 public PageReference Cancel() {
      return new pagereference('/'+sessionid);
    }

}