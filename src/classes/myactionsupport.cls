public with sharing class myactionsupport 
{
 public account account { get; set; }
  public boolean phone{set;get;} 
  
   public myactionsupport()
   {
    account=new account();
    phone=false;
    }
    public void mouseout()
     {
        if(account.name!=null)
        {
         phone=true;
         }
      else
      phone=false;
    }


   
}