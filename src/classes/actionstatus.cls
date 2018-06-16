public with sharing class actionstatus 
{

    public Account account{get; set;}
    public actionstatus()
    {
    account=new account();
    }
   

    public PageReference save() 
    {
        return null;
    }

}