@istest
private class AccountCustomControllertest
{
 static testmethod void AccountCustomController()
 {
Account acc=new Account(Name='Test');
 //insert acc;
 
 AccountCustomController ac=new AccountCustomController();
// pagereference p= new pagereference('acid=accid');
ac.acc.name='acc';
 ac.save();
 
 
   
 }



 }