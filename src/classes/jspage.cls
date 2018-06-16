public with sharing class jspage 
{
public Account acc{get;set;}
public jspage()
{
acc=new Account();
}

public pagereference jssave()
{
insert acc;
return new pagereference('/' +acc.id);
}
}