global class batchclass implements database.batchable<sobject>{
 global database.querylocator start(database.batchablecontext BC){
   return database.getquerylocator('');
 }
  global void execute (Database.batchablecontext bc, list<Account>acclist){
  
  }
  global void finish(database.batchablecontext bc){
  //database.executebatch(new batchclass1(),1);
  }
}