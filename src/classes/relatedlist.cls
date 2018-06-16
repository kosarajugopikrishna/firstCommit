public with sharing class relatedlist 
{
    public list<contact>cons{set;get;}
    public relatedlist(ApexPages.StandardSetController controller)
     {
     cons=[select lastname,accountid from contact];
     }
  
}