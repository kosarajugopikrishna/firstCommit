public with sharing class selectlistex {

    
    public string con{set;get;}
    public String acc { get; set; }
    public list<account>acclist=new list<account>();
    public list<selectoption> names { get; set; }
    public list<selectoption> cons { get; set; }
    /*public selectlistex()
     {
     names=new list<selectoption>();
     names.add(new selectoption('1','INDIA'));
     names.add(new selectoption('2','US'));
     }*/
    public selectlistex()
    {
     list<account>acclist=new list<account>();
     names=new list<selectoption>();
     acclist=[select name,phone from account];
     for(account ac:acclist)
     {
      names.add(new selectoption(ac.id,ac.name));
      }
    }
    
    public void con()
    {
     list<contact>conlist=new list<contact>();
     cons=new list<selectoption>();
     conlist=[select id,lastname,phone from contact where contact.accountid=:acc];
     for(contact c:conlist)
     {
     cons.add(new selectoption(c.lastname,c.id));
     }
     }
    
    
    
}