public class AccountCustomController 
  {
    public Account acc{set;get;}
    
    public AccountCustomController()
      {
        acc=new account();
       
      }
    
    public Pagereference save()
    {
      insert acc;
      Pagereference p= new Pagereference ('/'+acc.id);
      return p;
     /* insert acc;
      PageReference p = ApexPages.currentpage();
       p.setRedirect(true);
       return p;*/
    }
  
}