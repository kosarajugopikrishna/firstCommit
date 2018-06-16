public class Accexten 
{
    public account acc{set;get;}
    public string conid{set;get;}
    public Accexten(ApexPages.StandardController controller) {
    acc=new account();
    }
        public pagereference save()
        {
        insert acc;
        pagereference p=new pagereference('/apex/mypgref2');
        p.setRedirect(true);  
       return p;  
   }  
        
}