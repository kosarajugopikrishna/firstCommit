public class AccWizardController 
{

    public String opp { get; set; }

    public PageReference cancel() {
        return null;
    }

  public Account acc{set;get;}
  public Contact Con{set;get;}
  
   public AccWizardController ()
  {
  
       acc=new Account();
       con=new Contact();
  }
   public PageReference step2() 
  {
   return null;
 }           
}