public class wrappercontroller2 {

    public String ewrap { get; set; }

  
   

  
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
    public list<wrapper> lstwrap { get; set; }
    public wrappercontroller2()
    {
    lstwrap=new list<wrapper>();
    list<account> lst=[select id,name,phone from account];
    for(account c:lst)
    {
        lstwrap.add(new wrapper(false,c));
    }
    }
    public list<account> selected{get;set;}
    public void show() 
    {
    
       selected=new list<account>();
        system.debug('........'+lstwrap);
        for(wrapper w:lstwrap)
        {
            if(w.check==true)
            {
            selected.add(w.acc);
             /*PageReference p = page.mywrapperclass2;
             string sid=apexpages.currentpage().getparameters().get('id');
             string sname=apexpages.currentpage().getparameters().get('name');
             p.getparameters().put('id',sid);
             p.getparameters().put('name',sname);
            return p;*/
            
             }
            

    
    
    }
    }
    }