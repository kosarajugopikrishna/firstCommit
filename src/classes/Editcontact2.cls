public with sharing class Editcontact2 
{

public string ecid{set;get;}
 public string dcid{get;set;}  
public list<account>accounts{set;get;}
public list<account> ac{set;get;}
public editcontact2()
{
accounts=new list<account>();
accounts=[select name,phone,email__c from account];
}
public pagereference edit()
{
pagereference pg=new pagereference('/apex/myrequirement2?id='+ecid);
pg.setRedirect(true);
return pg;
}
public pagereference del()
{
 ac=[select name,phone,email__c from account where id=:dcid];
delete ac;
 pagereference p= new pagereference('/apex/myrequired');  
     p.setRedirect(True);      
     return p;  
}
}