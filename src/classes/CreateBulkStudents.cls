public with sharing class CreateBulkStudents {

    public CreateBulkStudents() {

    }


    public boolean MGCons { get; set; }
    public list<contact> MotherGroupList{get;set;}
    public list<spider__Session_Student__c> Stdlist{ get; set; }
    string Sessionid;
    public list<spider__Training_Session__c >stdO;
    public list<spider__Training_Session__c>stdN;
    public list<spider__Session_Student__c>sessionstudentslist;
    public contact mothercontact{set;get;}
    public integer rowNum{get;set;}
    

    public CreateBulkStudents(ApexPages.StandardController controller) {
     mothercontact = new contact();
    //mothercontact.Mother_Group__c = 'a1P90000007w8vI';
    Sessionid=apexpages.currentpage().getparameters().get('id');
    stdO=[select id, (select id,spider__Contact__c from Session_Students__r),spider__From_Time__c,spider__To_Time__c  from spider__Training_Session__c];
    stdN=[SELECT id, spider__From_Time__c,spider__To_Time__c,spider__Training_Course__c,spider__Training_Course__r.spider__Course_Fees__c FROM spider__Training_Session__c where id=:Sessionid];
    Stdlist=new list<spider__Session_Student__c>();
    Stdlist.add(new spider__Session_Student__c(spider__Training_Session__c=Sessionid,spider__Course_Fees__c=stdN[0].spider__Training_Course__r.spider__Course_Fees__c));//spider__Number__c=ac[0].spider__Fees__c,,spider__Status__c='Active'
   // if(mothercontact!=null)
    //MotherGroupList =  [select id,lastname,spider__Mother_Group__c from contact where spider__Mother_Group__c =:mothercontact.Mother_Group__c ];

    
    }

    public list<contact> getMotherGroupList()
    {
      MotherGroupList =  [select id,lastname,spider__Mother_Group__c from contact where spider__Mother_Group__c =:mothercontact.Mother_Group__c ];
      return MotherGroupList;
      }
    
    public void addrow()
    {
        Stdlist.add(new spider__Session_Student__c(spider__Training_Session__c=Sessionid,spider__Course_Fees__c=stdN[0].spider__Training_Course__r.spider__Course_Fees__c));
    }
    public void delrow() {
        rowNum = Integer.valueOf(apexpages.currentpage().getparameters().get('index'));
        system.debug('rownum');
        Stdlist.remove(rowNum);   
    }    

   

 
  //Validate Timings
    
 public pagereference save()
  {
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
                }
               else{
                   insert stdlist;
                   return new pagereference('/'+Sessionid);// return new pagereference('/'+conlist[0].accountid);
                //Stdlist.add(stdnew);
               }
            }
          }
        }
      }
      
    return null;
  }
}