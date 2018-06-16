public with sharing class dynamiclookup {

    public dynamiclookup(ApexPages.StandardController controller) {
      courseId= apexpages.currentpage().getparameters().get('id');
      tc= [select id,spider__Course_Fees__c,spider__Pre_Requisite__c from spider__Training_Course__c where id=:courseId];
    }

private ApexPages.StandardController stdController;
public String redirectUrl {public get; private set;}
public Boolean shouldRedirect {public get; private set;}

public string tcourse { get; set; }
public list<spider__Training_Course__c> tc;
public string precourses{set;get;}
Public string courseId{set;get;}

public PageReference Save() {
if(tcourse!= null)
tc[0].spider__Pre_Requisite__c = tcourse;
update tc;
pagereference p= new pagereference('/'+courseId);
return p;
}


}