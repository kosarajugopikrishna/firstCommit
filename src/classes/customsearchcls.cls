public class customsearchcls 
{

    //public String str1 { get; set; }
    public string str{get;set;}
    public list<contact> acclist{get;set;}
    public boolean isresult{get;set;}
  
    public  customsearchcls()
    {
       acclist=[select id,name,phone from contact];
    }
   public PageReference search() 
   {
        if(str.length()<=1)
        {
     
         Apexpages.addmessage(new Apexpages.message(Apexpages.severity.error,'Must Enter more than 2 characters'));
        }
        
        else
        {
           String sqlquery='select id,name,phone from contact where name like %str';
           acclist=Database.query(sqlquery);
          
        }
        return null;
    }
}