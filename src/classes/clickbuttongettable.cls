public class clickbuttongettable 
{

    public account account{set;get;}
    public boolean rendered{set;get;}
    public list<account>acclist=new list<account>();
    public clickbuttongettable()
    { //constructor
      rendered =false;
    }

    public PageReference save() 
    {
        rendered=true;
        acclist=[select name,phone from account];
        
        return null;
    }
        public list<account> getaccount()
        {
         return acclist;
         }
    
    

}