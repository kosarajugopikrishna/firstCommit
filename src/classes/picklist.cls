public class picklist 
{

    public list<selectoption> items { get; set; }

    public String selected { get; set; }
    
    public picklist()
    {
   items=new list<SelectOption>();
   list<Account> lstacc=[select id,name from Account];
   for(Account acc:lstacc)
   {
   items.add(new SelectOption(acc.name,acc.name));
   }
    
}
}