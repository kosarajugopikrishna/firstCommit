Public class TableController{
 public List<Account> acc{get;set;}
 
 Public TableController(){
  acc= new List<Account>();
 // acc= [select id,name,type from Account];
 }
}