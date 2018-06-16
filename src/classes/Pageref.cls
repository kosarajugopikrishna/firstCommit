public with sharing class Pageref
 {
    account acc;
    public PageReference save() 
    {
        insert acc;
        pagereference p= new pagereference('/'+acc.id);
        return p;
        //pagereference p=new pagereference('/apex/mypageref');
        //p.setRedirect(true);
        //p.getParameters().put('id',acc.id);
        //return p; 
    }
   
   
   public Account getAcc()
   {
   return null;
   }
   
    /*{
        if(acc == null) 
            acc = [select id, name, site from Account 
                       where id = :ApexPages.currentPage().getParameters().get('id')];
        return acc; 
    } */
}