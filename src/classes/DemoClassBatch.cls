global with sharing class DemoClassBatch implements Database.Batchable<Sobject>, Database.AllowsCallouts,Database.Stateful

{
   
global String query;
public DemoClassBatch(){
   query='select id from account limit 1';
   
 }
   global database.querylocator start(database.batchableContext bc){

     return database.getquerylocator(query);
   
}
global void execute(database.batchablecontext bd, list<sobject> scope){
    
try{ 
     spider.Zipclass_WS.getAttachmentByParentId('sfdcId');
   }
catch(Exception e){ 
     System.debug('DemoClassBatch Exception -->'+e);
}  
}
 Public void finish(database.batchableContext bc){
     } 
        
       }