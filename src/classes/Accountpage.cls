public with sharing class Accountpage {

   // public string name { get; set; }
    // public string phone { get; set; }
     public account acc{set;get;}
    public accountpage()
    {
     acc=new account();
     }
     public pagereference save()
     {
     insert acc;
     pagereference p=new pagereference('/apex/contactpage');
     p.getparameters().put('id',acc.name);
     p.getparameters().put('id2',acc.phone);
     return p;
     }
     
     public pagereference cancel()
     {
        return null;
     }
     
     }