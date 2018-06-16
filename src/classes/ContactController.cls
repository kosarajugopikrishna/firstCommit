public with sharing class ContactController 
 {
   public Contact con{set;get;} 
   public ContactController(ApexPages.standardcontroller controller) 
     {
       con=(contact)controller.getRecord();
     }
   public Pagereference mySave()
     {
       upsert con; 
       Pagereference  p= new Pagereference ('/'+apexpages.currentpage());
       return p;
     }
   

}