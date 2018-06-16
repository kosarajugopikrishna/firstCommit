public class SamplePageCls {
    
    public List<Session_Student__c> acclist { get; set; }
    public List<Session_Student__c> mglist { get; set; }
    public list<spider__Session_Student__c> MotherGroupContactsList{get;set;}
    public list<contact> MotherGroupList{get;set;}
    public list<spider__Training_Session__c >stdO;
    public list<spider__Training_Session__c>stdN;
    Public Boolean displaypopup {set;get;}
    string Sessionid;
    Public integer rowAssign {get;set;}
    Public integer motherRowAssign{get;set;}
    
    public SamplePageCls(ApexPages.StandardController controller) {
    
        // 1st Section 
        Sessionid=apexpages.currentpage().getparameters().get('id');
        stdO=[select id, (select id,spider__Contact__c from Session_Students__r),spider__From_Time__c,spider__To_Time__c  from spider__Training_Session__c];
        stdN=[SELECT id, spider__From_Time__c,spider__To_Time__c,spider__Training_Course__c,spider__Training_Course__r.spider__Course_Fees__c,spider__Training_Course__r.spider__Pre_Requisite__c FROM spider__Training_Session__c where id=:sessionid];
        system.debug('*******pre****'+stdN[0].spider__Training_Course__r.spider__Pre_Requisite__c);
        Session_Student__c newstd = New Session_Student__c();
        acclist = new List<Session_Student__c>();
        acclist.add(new spider__Session_Student__c(spider__Training_Session__c=Sessionid,spider__Course_Fees__c=stdN[0].spider__Training_Course__r.spider__Course_Fees__c));
        system.debug('******cou1****' +acclist[0].spider__Training_Session__r.spider__Training_Course__r.spider__Pre_Requisite__c);
        system.debug('******cou1****' +acclist);
        // 2nd Section
        mglist =new list<spider__Session_Student__c>();
        mglist.add(newstd);
        
        //Pre-Requisite Checking
       
    }
    
    // This method is used to Add new rows to the Students Section
    public void AddNewRow() {
        acclist.add(new spider__Session_Student__c(spider__Training_Session__c=Sessionid,spider__Course_Fees__c=stdN[0].spider__Training_Course__r.spider__Course_Fees__c));
        system.debug('******cou****' +acclist[0].spider__Training_Session__r.spider__Training_Course__r.spider__Pre_Requisite__c);
    }
     // This method is used to Delete rows to the Students Section
    public void DelNewRow() {
        if(rowAssign != null) {
            acclist.remove(rowAssign);
        }
    }
     // This method is used to Add rows to the Mother Group Section
    public void AddGrouprow() 
    {
      mglist.add(new spider__Session_Student__c());
    }
    
     // This method is used to Delete rows to the Mother Group Section
    public void DeletegroupRow(){
       if(motherRowAssign!= null) {
      mglist.remove(motherRowAssign);
      }
 }
    
   //Pass the Mother Group Contacts to Popup when click on Getcontacts link
    public pagereference getmothercontacts() {
    
    MotherGroupContactsList = new list<spider__Session_Student__c>();
      if(mglist[0].Mother_Group__c!= null)
      {
        displaypopup=true;
         MotherGroupList=[select id,spider__Mother_Group__c,lastname from contact where spider__Mother_Group__c=:mglist[0].Mother_Group__c];
         for(contact con:MotherGroupList)
          {
            MotherGroupContactsList.add(new spider__Session_Student__c(spider__Training_Session__c=Sessionid,spider__Course_Fees__c=stdN[0].spider__Training_Course__r.spider__Course_Fees__c,spider__Contact__c=con.id));
           }
        
      }
         return null;
    }
    
    Public PageReference savepopup() {
     acclist.addall(MotherGroupContactsList);
     displaypopup=false;
     return null;
 }
    public PageReference Cancelpopup() {
       displaypopup= false;
        return null;
 }
 
 //Validate Student Timings
    Public boolean validate_Session_timings(){
     boolean flag=false;
     for(spider__Session_Student__c stdnew: acclist)
      {
        for(spider__Training_Session__c Stdold: stdO)
        {
          for(spider__Session_Student__c  oldcons: Stdold.Session_Students__r)
          {
           if(stdnew.spider__Contact__c == oldcons.spider__Contact__c)
            {
              if((stdN[0].spider__To_Time__c == stdO[0].spider__To_Time__c && stdN[0].spider__From_Time__c  == stdO[0].spider__From_Time__c)||
                 (stdN[0].spider__From_Time__c < stdO[0].spider__To_Time__c && stdN[0].spider__From_Time__c > stdO[0].spider__From_Time__c) ||
                 (stdN[0].spider__From_Time__c == stdO[0].spider__From_Time__c && stdN[0].spider__To_Time__c > stdO[0].spider__To_Time__c)||
                 (stdN[0].spider__From_Time__c < stdO[0].spider__From_Time__c && stdN[0].spider__To_Time__c > stdO[0].spider__To_Time__c)) {
                 stdnew.spider__Contact__c.adderror('Attending another session with same timings');
                 flag=true;
              }
             }
           }
         }
       } 
     if(flag==true){
      return true;
      }
      else{
      return false;
     }
 }
      //Validate Pre-Requisite Courses
      Public boolean Validate_Pre_Requisite(){
       set<string>courselist=new set<string>();
      for(spider__Training_Session__c tc: stdN){
       if(tc.spider__Training_Course__r.spider__Pre_Requisite__c !=null){
        list<string> course= string.valueOf(tc.spider__Training_Course__r.spider__Pre_Requisite__c).split(',');
         for(string st:course){
           courselist.add(st);
         
       }
     }
    }
    system.debug('****courselist'+courselist);

     list<spider__Course_Details__c>CDlist=[select id,spider__Training_Course__c,spider__Training_Course__r.name,spider__Status__c,spider__Contact__c from spider__Course_Details__c where spider__Status__c='completed'];
      boolean flag=false; 
     
      for(spider__Training_Session__c ts: stdN){
       for(spider__Session_Student__c stdnew: acclist){
        set<string> setlist= new set<string>();
        for(string cou: courselist){
         for(spider__Course_Details__c Cd: CDlist){
         
          system.debug('****Cou1'+ cou);
          system.debug('****CD1'+ cd.spider__Training_Course__r.name);
            if(stdnew.spider__Contact__c == Cd.spider__Contact__c && ts.id == stdnew.spider__Training_Session__c){
          system.debug('****Condition'+ cou != cd.spider__Training_Course__r.name);
             if(cou == cd.spider__Training_Course__r.name){
               setlist.add(cou);
              //stdnew.spider__Contact__c.adderror('asdfasdf');
              //flag=true;
              
           }
        }
       }
      }
       if(setlist.size() != courselist.size()){
     stdnew.spider__Contact__c.adderror('Should Complete the Pre-Requisite Courses');
              flag=true;
              system.debug('****flag'+ flag);
              }
     } 
    
    }
  
     if(flag==true){
      return true;
      }
      else{
      return false;
     }
 }
  
    Public pagereference save(){
     if(Validate_Pre_Requisite()){
           return null;
           }
    else if(validate_Session_timings()){                     
            return null;
        }   
    else{
    insert acclist;
    return new pagereference('/'+Sessionid);// return new pagereference('/'+conlist[0].accountid);
   }
  
}
}

//if(ts.spider__Training_Course__r.spider__Pre_Requisite__c != cd.spider__Training_Course__r.name){