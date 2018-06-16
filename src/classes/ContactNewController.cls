public  class ContactNewController 
  {
    Contact con;
    public Account account{set;get;}
    public ContactNewController(ApexPages.StandardController controller) 
      {
        con=(Contact)controller.getRecord();
        
      }
    public void accountInfo()
      {
        if(con.AccountId!=null)
         {
        System.debug('---------------'+con.AccountId);
        account=[Select id,Name, BillingStreet,BillingCity,BillingState,BillingCountry from Account
                                  Where Id=:con.AccountId];
        System.debug('------------'+account.BillingStreet);
        System.debug('------------'+account.BillingCity);
        System.debug('------------'+account.BillingState );
         }
       else
       account=new account();
        
       
      }

  }