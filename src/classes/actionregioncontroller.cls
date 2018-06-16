public with sharing class actionregioncontroller {

    public account account { get; set; }
    public string  contactname{set;get;}
    public string  contactphone{set;get;}
    
    public actionregioncontroller()
    {
     account=new account();
     }
    public void onsave()
    {
     contactname=account.name;
     contactphone=account.phone;
     }
}