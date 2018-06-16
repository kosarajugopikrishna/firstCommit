public class wrappercontroller {
   
    public list<wrapper> lstwrap { get; set; }
    
    public wrappercontroller()
    {
    lstwrap=new list<wrapper>();
    list<account> lst=[select id,name from account];
    for(account c:lst)
    {
        lstwrap.add(new wrapper(false,c));
    }
    }
    public list<account> selected{get;set;}
    public PageReference show() 
    {
    
    selected=new list<account>();
        system.debug('........'+lstwrap);
        for(wrapper w:lstwrap)
        {
            if(w.check==true)
            {
            selected.add(w.acc);
            }
        }
        return null;
    }
 public class wrapper
    {
         public boolean check{get;set;}
         public account acc{get;set;}
         public wrapper(boolean b, account a)
         {
             check=b;
             acc=a;
         }
    }
}