public with sharing class getfieldvalue
 {
 public list<account> accounts{set;get;}
 public boolean check{set;get;}
 public string disp{set;get;}
 public string sup{set;get;}
 public getfieldvalue()
 {
 accounts=new list<account>([select name,phone,email__c from account limit 15]);
 }
  public void sup() 
  {
   
  
    disp='478';
     
   }
    }