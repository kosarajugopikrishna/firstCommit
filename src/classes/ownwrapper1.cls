public with sharing class ownwrapper1
 {

    public String getWrapac() {
        return null;
    }


    public PageReference act() {
        return null;
    }
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
       
   
    public string acid{set;get;}
    public account acc1{set;get;}
    public list<account>selected{set;get;}
    public list<wrapper>lstwrapacc {get; set; }
    public ownwrapper1()
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
     pagereference p=new pagereference('/apex/mywrapperclass2?id='+acid);  
      return p;
    }
   
}