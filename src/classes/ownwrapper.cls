public with sharing class ownwrapper
 {
   public class wrapper
    {
   
     public account acc{set;get;}
     public boolean check{set;get;}
     public wrapper(boolean b, account a)
         {
             check=b;
             acc=a;
         }
       }
       
     //public string selected{set;get;}
    public list<account>selected{set;get;}
    public list<wrapper>lstwrapacc { get; set; }
    public ownwrapper()
    {
    lstwrapacc =new list<wrapper>();
    list<account> acclist=[select id,name,phone from account];
    for(account a:acclist)
    {
     lstwrapacc.add(new wrapper(false,a));
    }
    }
    public pagereference save()
    {
     selected=new list<account>();
     //selected='';
     for(wrapper w:lstwrapacc)
     {
      if(w.check==true)
      {
       //selected+=w.acc.Phone;
       selected.add(w.acc);
      }
     }
     return null;
    }
   
}