public with sharing class picklist1cls {
    public List<SelectOption> items{get; set;}
    public List<SelectOption> conitems{get; set;}
    public string selectedAcc{get; set;}
    
    public picklist1cls()
    {
        items = new List<SelectOption>();
        conitems = new List<SelectOption>();
        
        List<Account> lst = [Select id, name from account  name];
        items.add(new Selectoption('','--select an account--'));
        for(Account acc : lst){
            items.add(new Selectoption(acc.Id, acc.name));
        }
        
        List<contact> lstcon = [Select id, name from Contact order by name];
        for(Contact con: lstcon){
             conitems.add(new selectoption('none','none'));
            conitems.add(new SelectOption(con.Id, con.name));
        }
        
        
    }
    
    public void getData(){
        
        List<Contact> lst = [Select id, name,phone from Contact where AccountId =: selectedAcc];
        conitems.clear();
        for(Contact c: lst)
        {
            conitems.add(new SelectOption(c.name,c.phone));
        }
        
        
    }
}