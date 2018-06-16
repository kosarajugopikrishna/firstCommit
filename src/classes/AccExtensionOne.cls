public with sharing class AccExtensionOne 
  {
    public ApexPages.StandardController acc;
    public AccExtensionOne(ApexPages.StandardController controller) 
    {
      acc=controller;
    }
    
    public void sum()
      {
        System.debug(' I am from AccExtensionOne ');
        AccExtensionTwo two=new AccExtensionTwo ();
         two.sum();
      
      }


  }