public class editcon {  
 list<Account> stun = new list<Account>();  
 list<Account> stun1 = new list<Account>();   
 public string ecid{get;set;}  
 public string dcid{get;set;}  
   public PageReference deletecon() {  
   stun1 =[Select Name,phone,billingcity from account where id=:dcid];  
     delete stun1;  
     pagereference pg= new pagereference('/apex/editdeletetable');  
     pg.setRedirect(True);      
     return pg;  
   }  
  public PageReference edit() {  
   pageReference pg = new pagereference('/apex/editdeletetable2?id='+ecid);  
   pg.setRedirect(true);  
     return pg;  
   }  
  public list<Account> getStun() {  
   stun = [select name,phone,billingcity from Account];  
     return stun;  
   }  
 }