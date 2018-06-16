public with sharing class BulkNoOfStudents
{

    public string rowcount{set;get;}
    public Boolean displaypopup { get; set; }
    public list<spider__Session_Student__c> mglist { get; set; }
    public list<contact> MotherGroupList{get;set;}
    public list<spider__Session_Student__c> MotherGroupSessionList{get;set;}
    public list<spider__Session_Student__c> Stdlist{ get; set; }
    public contact conlist{ get; set; }
    string Sessionid;
    public list<spider__Training_Session__c >stdO;
    public list<spider__Training_Session__c>stdN;
    public list<spider__Session_Student__c>sessionstudentslist;
    public contact mothercontact{set;get;}
    public list<contact>mothercontactlist{ set;get;}
   // Public integer fees {set;get;}
    public Integer count=1;
    public Integer rowNum{get;set;}
    public Integer Index{get;set;}
    public list<spider__Session_Student__c>MGStudentslist;
    public list<spider__Session_Student__c>finalsessionstudentslist;
    
    public BulkNoOfStudents()
    {
    mglist =new list<spider__Session_Student__c>();
    mglist.add(new spider__Session_Student__c());
    mothercontact = new contact();
  
    Sessionid=apexpages.currentpage().getparameters().get('id');
    stdO=[select id, (select id,spider__Contact__c from Session_Students__r),spider__From_Time__c,spider__To_Time__c  from spider__Training_Session__c];
    stdN=[SELECT id, spider__From_Time__c,spider__To_Time__c,spider__Training_Course__c,spider__Training_Course__r.spider__Course_Fees__c FROM spider__Training_Session__c where id=:sessionid];
    Stdlist=new list<spider__Session_Student__c>();
    Stdlist.add(new spider__Session_Student__c(spider__Training_Session__c=Sessionid,spider__Course_Fees__c=stdN[0].spider__Training_Course__r.spider__Course_Fees__c));//spider__Number__c=ac[0].spider__Fees__c,,spider__Status__c='Active'
   }
   
    
   
    public void addrow()
    {
       Stdlist.add(new spider__Session_Student__c(spider__Training_Session__c=Sessionid,spider__Course_Fees__c=stdN[0].spider__Training_Course__r.spider__Course_Fees__c));
    }
    
    public void AddGrouprow() 
    {
      mglist.add(new spider__Session_Student__c());
    }
    
    
   public void delrow(){
      //rowNum = Integer.valueOf(ApexPages.currentPage().getParameters().get('index'));
      system.debug('*****index no'+index);
      Stdlist.remove(Integer.valueOf(index));
 
     
    }
   
    public void DeleteGroupRow() {
        //rowNum = Integer.valueOf(ApexPages.currentPage().getParameters().get('index'));
        system.debug('********rownumber*******'+index);
        
        mglist.remove(index);
        
    }
     
  
   public PageReference Cancelpopup() {
       displaypopup= false;
        return null;
    }


    public pagereference getmothercontacts() {
    if(mglist[0].Mother_Group__c== null)
    {
         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Error,'Students are attending in another session.');
            ApexPages.addMessage(myMsg);
     }
    MotherGroupSessionList = new list<spider__Session_Student__c>();
      if(mglist[0].Mother_Group__c!= null)
      {
        displaypopup=true;
         MotherGroupList=[select id,spider__Mother_Group__c,lastname from contact where spider__Mother_Group__c=:mglist[0].Mother_Group__c];
         for(contact con:MotherGroupList)
          {
            MotherGroupSessionList.add(new spider__Session_Student__c(spider__Training_Session__c=Sessionid,spider__Course_Fees__c=stdN[0].spider__Training_Course__r.spider__Course_Fees__c,spider__Contact__c=con.id));
           }
        
        }
         return null;
    }
    
 Public PageReference savepopup() {
   
  /*MGStudentslist = new list<spider__Session_Student__c>();
   
  if(MotherGroupList != null){
    for(contact stdnew: MotherGroupList)
      {
        for(spider__Session_Student__c ss: MotherGroupSessionList)
        {
         MGStudentslist.add(new spider__Session_Student__c(spider__Training_Session__c=Sessionid,spider__Course_Fees__c=ss.spider__Course_Fees__c,spider__Contact__c=stdnew.id));
        } 
         system.debug('*********list'+MGStudentslist);
    }
    }
    if(MotherGroupList == null)
     {
      MotherGroupList = new list<contact>();
     }*/
         // insert MGStudentslist;
          stdlist.addall(MotherGroupSessionList);
          displaypopup=false;
          return null;
    
   } 
    
 Public boolean validate_Session_timings(){
   boolean flag=false;
     for(spider__Session_Student__c stdnew: Stdlist)
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
 
   public pagereference save()
  {
     if (validate_Session_timings())
      {                     
           /* ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Error,'Students are attending in another session.');
            ApexPages.addMessage(myMsg);*/
            return null;
        }   
   else{
    insert Stdlist;
    return new pagereference('/'+Sessionid);// return new pagereference('/'+conlist[0].accountid);
   }
  
}
 }