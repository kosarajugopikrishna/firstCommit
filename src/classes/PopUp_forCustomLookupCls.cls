public class PopUp_forCustomLookupCls{

   
    public list<wrapper> lstwrap { get; set; }
    
    public PopUp_forCustomLookupCls()
    {
   
    lstwrap=new list<wrapper>();
    list<spider__Training_Course__c> lst=[select id,name from  spider__Training_Course__c where id!=:apexpages.currentpage().getparameters().get('id')];
    for(spider__Training_Course__c c:lst)
    {
        lstwrap.add(new wrapper(false,c));
    }
    }
    public list<spider__Training_Course__c> Check{get;set;}
   /*public PageReference show() 
    {
    
    Check=new list<spider__Training_Course__c>();
        system.debug('........'+lstwrap);
        for(wrapper w:lstwrap)
        {
            if(w.check==true)
            {
            check.add(w.acc);
            }
        }
         return null;
    }*/
 public class wrapper
    {
         public boolean check{get;set;}
         public spider__Training_Course__c acc{get;set;}
         public wrapper(boolean b, spider__Training_Course__c a)
         {
             check=b;
             acc=a;
         }
    }
}