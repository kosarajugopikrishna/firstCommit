public with sharing class Multicontact 
{
    public list<contact> conlist { get; set; }
     string accid;
     public Integer count=1;
     public Integer rowNum{get;set;}
    public multicontact()
    {
    accid=apexpages.currentpage().getparameters().get('id');
    conlist=new list<contact>();
    conlist.add(new contact(accountid=accid));
    }
    public void addrow()
    {
    conlist.add(new contact(accountid=accid));
    }
    public void addrows()
    {
   for(integer i=0;i<5;i++)
    {
    conlist.add(new contact(accountid=accid));
    }
    }
   public pagereference save()
   {
   insert conlist;
   return new pagereference('/'+conlist[0].accountid);
   }
   public void RemoveItems(){       

       rowNum = Integer.valueOf(ApexPages.currentPage().getParameters().get('index'));
       conlist.remove(rowNum);        
       
       //Integer i = items.size();
       //items.remove(i-1);           
    }          
   
}